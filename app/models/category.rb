class Category < ApplicationRecord
    has_many :clients

    scope :filter_duplicates, -> { group(:name).having("count(*) >= 1")}
end
