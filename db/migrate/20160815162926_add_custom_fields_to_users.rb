class AddCustomFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :city, :string
    add_column :users, :producer, :boolean, default: false
    add_column :users, :farm_location, :string
    add_column :users, :farm_name, :string
    add_column :users, :farm_description, :string
  end
end
