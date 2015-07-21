class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.integer :driver_id
      t.string :color
      t.string :make
      t.string :model
      t.string :year
      t.integer :seats_available
      t.timestamps null: false
    end
  end
end
