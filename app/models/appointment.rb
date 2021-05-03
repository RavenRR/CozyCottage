class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :title, :content, :completed, presence: true

end
