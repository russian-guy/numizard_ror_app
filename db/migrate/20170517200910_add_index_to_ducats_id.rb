class AddIndexToDucatsId < ActiveRecord::Migration[5.1]
  def change
    add_column :ducats, :ducat_id, :integer
    add_index :ducats, :ducat_id, unique: true
  end
end
