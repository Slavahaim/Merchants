class Merchant < ApplicationRecord
  serialize :preferences, HashSerializer
  store_accessor :extra_info, :phone_number, :website
  validates :name, presence: true, length: { minimum: 3}, uniqueness: { case_sensitive: false }
  validates :city, presence: true
  validates :street, presence: true
  validates :country_code, presence: true, numericality: { only_integer: true }, length: { in: 5..9 }

  def self.search(search)
    if search
      merchant_name = Merchant.find_by(name: search)
      if merchant_name
        where(id: merchant_name)
      else
        @merchants = Merchant.order(id: :desc)
      end
    else
      @merchants = Merchant.order(id: :asc)
    end
  end
end
