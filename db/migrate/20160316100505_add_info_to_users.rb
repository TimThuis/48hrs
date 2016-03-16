class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :guide, :boolean
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birthday, :date
    add_column :users, :picture_url, :string
    add_column :users, :street, :string
    add_column :users, :zipcode, :string
    add_column :users, :city, :string
    add_column :users, :phone, :string
    add_column :users, :bio, :text
    add_column :users, :hour_rate, :integer
  end
end
