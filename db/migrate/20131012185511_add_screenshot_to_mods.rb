class AddScreenshotToMods < ActiveRecord::Migration
  def change
    add_column :mods, :screenshot, :string
  end
end
