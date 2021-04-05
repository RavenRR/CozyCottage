class Client < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  has_many :appointments
  has_many :users, through: :appointments
end
