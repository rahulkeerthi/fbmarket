class AddGeodataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :users, :addr_street1, :string
    add_column :users, :addr_street2, :string
    add_column :users, :addr_city, :string
    add_column :users, :addr_area, :string
    add_column :users, :addr_country, :string
    add_column :users, :addr_postcode, :string
  end
end
