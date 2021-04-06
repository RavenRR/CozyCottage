class User < ApplicationRecord
    has_secure_password
    has_many :clients
    has_many :categories, through: :clients
    has_many :appointments
    has_many :client_appointments, through: :appointments, source: :client
end
