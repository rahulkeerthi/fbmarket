# == Schema Information
#
# Table name: inboxes
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Inbox < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  def self.where_has_user(user)
    inboxes = Inbox.all
    inboxes.filter do |inbox|
      inbox.messages.any? { |message| message.user == user }
    end
  end
end
