class AddStatusToMods < ActiveRecord::Migration
  def change
    add_column :mods, :status, :text
  end
end
