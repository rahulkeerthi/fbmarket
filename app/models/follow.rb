# == Schema Information
#
# Table name: follows
#
#  id           :bigint           not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  follower_id  :integer          not null
#  following_id :integer          not null
#
# Indexes
#
#  index_follows_on_follower_id                   (follower_id)
#  index_follows_on_following_id                  (following_id)
#  index_follows_on_following_id_and_follower_id  (following_id,follower_id) UNIQUE
#
class Follow < ApplicationRecord
  belongs_to :follower, foreign_key: 'follower_id', class_name: 'User'
  belongs_to :following, foreign_key: 'following_id', class_name: 'User'
end
