# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  addr_area              :string
#  addr_city              :string
#  addr_country           :string
#  addr_postcode          :string
#  addr_street1           :string
#  addr_street2           :string
#  admin                  :boolean          default(FALSE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  latitude               :float
#  longitude              :float
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                   (email) UNIQUE
#  index_users_on_latitude_and_longitude  (latitude,longitude)
#  index_users_on_reset_password_token    (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # DEVISE
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # ADMIN
  def admin?
    admin
  end

  # USER AVATAR
  has_one_attached :photo

  # FOLLOWING
  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following

  # MESSAGES
  has_many :messages
  has_many :inboxes, through: :messages

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
    addr_street1_changed? || addr_street2_changed? || addr_city_changed? || addr_area_changed? || addr_country_changed? || addr_postcode_changed?
  end
end
