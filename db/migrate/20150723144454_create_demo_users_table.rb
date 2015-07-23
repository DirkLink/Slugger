class CreateDemoUsersTable < ActiveRecord::Migration
  def change
    create_table :demo_users do |t|
      t.string :email,              null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :username
      t.decimal :level
      t.timestamps
    end
  end
end
