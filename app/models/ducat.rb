class Ducat < ApplicationRecord
  validates(:name, length: { maximum: 50, message: " - слишком длинное [Название] (50 символов - максимум)"})
  validates(:name, :presence => { :message => " - поле [Название] обязательно для заполнения" })
end
