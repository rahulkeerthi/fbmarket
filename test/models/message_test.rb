# == Schema Information
#
# Table name: messages
#
#  id         :bigint           not null, primary key
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  inbox_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_messages_on_inbox_id  (inbox_id)
#  index_messages_on_user_id   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (inbox_id => inboxes.id)
#  fk_rails_...  (user_id => users.id)
#
require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
