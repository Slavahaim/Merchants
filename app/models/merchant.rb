class Merchant < ApplicationRecord
    serialize :preferences, HashSerializer
    store_accessor :extra_info, :phone_number, :website
    validates :name, presence: true
    validates :city, presence: true
    validates :street, presence: true
    validates :country_code, presence: true
end
