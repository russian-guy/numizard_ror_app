class CreateDucats < ActiveRecord::Migration[5.1]
  def change
    create_table :ducats do |t|
      t.float  :mean_price
      t.string :name
      t.string :material
      t.float  :weight
      t.float  :diameter
      t.float  :rating
      t.integer :publish_year
      t.string :mint
      t.string :set
      t.float  :quantity
      t.string :description

      t.timestamps
    end
  end
end
