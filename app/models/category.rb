class Category < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments
end
