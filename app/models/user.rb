class User < ApplicationRecord
  has_one_attached :photo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # GEOCODING
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def address
    [addr_street1, addr_street2, addr_city, addr_area, addr_country, addr_postcode].compact.join(', ')
  end

  def address_changed?
    addr_street1_changed? || addr_street2_change? || addr_city_changed? || addr_area_changed? || addr_country_changed? || addr_postcode_changed?
  end
end
