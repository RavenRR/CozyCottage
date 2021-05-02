class User < ApplicationRecord
    has_secure_password
    has_many :clients
    has_many :categories, through: :clients
    has_many :appointments
    has_many :client_appointments, through: :appointments, source: :client

    validates :username,:email, uniqueness: true, presence: true

    def self.from_omniauth(response)
        User.find_or_create_by(uid: response[:uid], provider: response[:provider]) do |u|
            u.username = response[:info][:name]
            u.email = response[:info][:email]
            u.password = SecureRandom.hex(15)
        end
    end
    
end
