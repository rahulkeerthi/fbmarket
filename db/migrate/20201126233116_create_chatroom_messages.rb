class CreateChatroomMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :chatroom_messages do |t|
      t.string :content
      t.references :chatroom, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
