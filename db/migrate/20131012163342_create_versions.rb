class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :download
      t.string :number
      t.integer :mod_id
      t.text :major_changes
      t.timestamps
    end
  end
end
