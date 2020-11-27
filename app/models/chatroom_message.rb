# == Schema Information
#
# Table name: chatroom_messages
#
#  id          :bigint           not null, primary key
#  content     :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  chatroom_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_chatroom_messages_on_chatroom_id  (chatroom_id)
#  index_chatroom_messages_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (chatroom_id => chatrooms.id)
#  fk_rails_...  (user_id => users.id)
#
class ChatroomMessage < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom
end
