class AddIndexToUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :users, [:latitude, :longitude]
  end
end
