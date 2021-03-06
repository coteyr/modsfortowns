# Copyright (c) 2010 by Robert D. Cotey II
#    This file is part of coteyr_pack.
#
#    coteyr_pack is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    coteyr_pack is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with coteyr_pack.  If not, see <http://www.gnu.org/licenses/>.

#Basic Skelton Deployment file. Look in the deploy=settings and deploy-custom for actual configuration.
require 'bundler/capistrano'
set :stages, %w(production staging)
set :default_stage, "production"
set :git_enable_submodules, true
require File.expand_path('../deploy-settings.rb', __FILE__)
require File.expand_path('../deploy-custom.rb', __FILE__)
require 'capistrano/ext/multistage'
require "rvm/capistrano"
default_run_options[:pty] = true
set :scm, "git"
ssh_options[:forward_agent] = true
#Paths

set :rvm_ruby_string, :local               # use the same ruby as used locally for deployment
set :rvm_autolibs_flag, "read-only"        # more info: rvm help autolibs
before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, OR:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts
 namespace :deploy do
   task :start do
   end
   task :stop do
   end
   task :restart, roles: :app, except: { no_release: true } do
     run "touch #{current_path}/tmp/restart.txt"
   end
 end
#Passenger
namespace :passenger do
    desc "Restart Application"
    task :restart do
        run "touch #{current_path}/tmp/restart.txt"
    end
    desc "Create Symlink for Passenger"
    task :linkin do
        run "rm -rf #{public_path}/uploads"
        run "ln -s /home/modsfortowns/web/uploads/ #{public_path}/uploads"
    end
end
namespace :sass do
  desc 'Updates the stylesheets generated by Sass'
  task :update, roles: :app do
    invoke_command "cd #{latest_release}; RAILS_ENV=#{rails_env} rake sass:update"
  end

  # Generate all the stylesheets manually (from their Sass templates) before each restart.
  #before 'deploy:restart', 'sass:update'
end
namespace :log do
  desc 'Generates Stats Report and emails it'
  task :stats, roles: :app do
    invoke_command "cd #{latest_release}; RAILS_ENV=#{rails_env} bundle exec rake coteyr_pack:log:stats"
  end
end

namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
      #run "cp -R #{release_path}/app/assets/images/* #{release_path}/public/assets/"
      #run "cp -R #{release_path}/app/assets/stylesheets/* #{release_path}/public/assets/"
      #run "cp -R #{release_path}/app/assets/javascripts/* #{release_path}/public/assets/"
      #run "cp  #{release_path}/public/assets/application-*.css #{release_path}/public/assets/application.css"
      #run "cp  #{release_path}/public/assets/application-*.js #{release_path}/public/assets/application.js"
    end
  end
end
namespace :rvm do
  task :trust_rvmrc do
    run "rvm rvmrc trust #{release_path}"
  end
end
namespace :db do
  task :copy_config do
    run "cp  ~/database.yml #{release_path}/config/database.yml"
  end
end

after "deploy:update_code","db:copy_config"
after "deploy", "rvm:trust_rvmrc"
after "deploy", "passnger:linkin"
#after :deploy, "passenger:restart"

