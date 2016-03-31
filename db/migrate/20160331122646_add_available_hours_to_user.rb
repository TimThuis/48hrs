class AddAvailableHoursToUser < ActiveRecord::Migration
  def change
    add_column :users, :available_hours, :integer
  end
end
