class Client < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :category
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  
  scope :order_by_appointments, -> {left_joins(:appointments).group('clients.id').order('count(appointments.client_id) desc')}

  def self.filter(params)
      where("category_id = ?", params)
  end

  def category_attributes=(attr)
      self.category = Category.find_or_create_by(attr) if !attr[:name].blank?
  end
end
