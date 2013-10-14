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
class ModsController < ApplicationController
  include Restful
  def initialize
    super
    @skope = "Mod"
    @klass =  Mod
  end
  before_filter :set_page_title
  before_filter :find_categories, only: [:new, :create, :update, :edit]
  def index
    conditions = {}
    conditions.merge!({user_id: params[:user_id]}) if params[:user_id]
    conditions.merge!({category_id: params[:category_id]}) if params[:category_id]
    @mods = Mod.where(conditions)
    respond_to do |format|
      format.html {}
      format.json {
        render json: @mods.to_json(include: ['last_version', :category] )
      }
    end
  end
private
  def set_page_title
    mod = Mod.find params[:id] if params[:id]
    @page_title = mod.name if mod
    @page_title ||= 'Mods'
    @page_icon = 'font-eye-open'
  end
  def allowed_params
    params.require :mod
    params.permit mod: [:name, :description, :user_id, :screenshot, :screenshot_cache, :category_id, :status]
  end
  def find_categories
    @categories = Category.find :all
  end
end
