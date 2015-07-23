class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer "driver_id"
      t.integer "rider_one_id"
      t.integer "rider_two_id"
      t.integer "rider_three_id"
      t.integer "rider_four_id"
      t.timestamps null: false
    end
  end
end
