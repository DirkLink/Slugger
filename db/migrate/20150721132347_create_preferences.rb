class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.string :music
      t.string :talking
      t.timestamps null: false
    end
  end
end
