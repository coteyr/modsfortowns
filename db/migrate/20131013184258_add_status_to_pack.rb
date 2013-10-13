class AddStatusToPack < ActiveRecord::Migration
  def change
    add_column :packs, :status, :string
  end
end
