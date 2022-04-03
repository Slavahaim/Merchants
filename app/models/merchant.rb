class Merchant < ApplicationRecord
  serialize :preferences, HashSerializer
  store_accessor :extra_info, :phone_number, :website
  validates :name, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :country_code, presence: true

  def self.search(search)
    if search
      merchant_name = Merchant.find_by(name: search.capitalize)
      if merchant_name
        where(id: merchant_name)
      else
        @merchants = Merchant.order(id: :asc)
      end
    else
      @merchants = Merchant.order(id: :asc)
    end
  end
end
