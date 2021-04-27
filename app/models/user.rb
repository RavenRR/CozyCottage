class User < ApplicationRecord
    has_secure_password
    has_many :clients
    has_many :categories, through: :clients
    has_many :appointments
    has_many :client_appointments, through: :appointments, source: :client

    validates :email, uniqueness: true, presence: true

    def self.from_omniauth(response)
        self.find_or_create_by(email: response[:info][:email]) do |u|
            u.email = response[:info][:email]
            u.password = SecureRandom.hex
        end
    end
    
end
