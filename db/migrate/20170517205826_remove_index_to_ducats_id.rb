class RemoveIndexToDucatsId < ActiveRecord::Migration[5.1]
  def change
    remove_index  :ducats, :ducat_id
    remove_column :ducats, :ducat_id
  end
end
