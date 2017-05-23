class Ducat < ApplicationRecord
  has_many :pictures, :dependent => :destroy
  validates(:name, length: { maximum: 50, message: " - слишком длинное [Название] (50 символов - максимум)"})
  validates(:name, :presence => { :message => " - поле [Название] обязательно для заполнения" })
  has_many :pictures, :dependent => :destroy
end
