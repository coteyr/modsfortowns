class AddCategoryIdToMods < ActiveRecord::Migration
  def change
    add_column :mods, :category_id, :integer
  end
end
