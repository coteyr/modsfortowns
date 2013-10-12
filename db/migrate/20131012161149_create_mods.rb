class CreateMods < ActiveRecord::Migration
  def change
    create_table :mods do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps
    end
  end
end
