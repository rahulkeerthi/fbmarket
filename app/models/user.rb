class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # USER AVATAR
  has_one_attached :photo

  # FOLLOWING
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end

  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end

  def is_following?(user_id)
    relationship = Follow.find_by(follower_id: id, following_id: user_id)
    return true if relationship
  end

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
