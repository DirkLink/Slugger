class DropDemoUsers < ActiveRecord::Migration
  def change
    drop_table :demo_users
  end
end
