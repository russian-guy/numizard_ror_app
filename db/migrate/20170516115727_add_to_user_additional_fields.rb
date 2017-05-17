class AddToUserAdditionalFields < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :surname,          :string  # фамилия
    add_column :users, :birthday,         :date    # дата рождения
    add_column :users, :sex,              :boolean # пол
    add_column :users, :city,             :string  # город
    add_column :users, :street,           :string  # улица
    add_column :users, :house_number,     :string  # номер дома
    add_column :users, :pavilion_number,  :string  # номер корпуса
    add_column :users, :apartment_number, :string  # номер квартиры
    add_column :users, :postcode,         :string  # почтовый индекс
    add_column :users, :telephone_number, :string  # телефон
  end
end
