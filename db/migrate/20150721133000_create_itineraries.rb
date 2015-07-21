class CreateItineraries < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.integer :user_id
      t.datetime :morning_time
      t.datetime :evening_time
      t.string :home_locale
      t.string :work_locale
      t.string :day
      t.timestamps null: false
    end
  end
end
