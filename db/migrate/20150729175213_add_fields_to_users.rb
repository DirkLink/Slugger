class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bio, :text
    add_column :users, :preferences, :text
  end
end
