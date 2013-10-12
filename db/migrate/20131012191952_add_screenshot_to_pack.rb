class AddScreenshotToPack < ActiveRecord::Migration
  def change
    add_column :packs, :screenshot, :string
  end
end
