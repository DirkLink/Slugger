class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.integer :user_id
      t.string :badge_name
      t.string :description
      t.string :image_url
      t.timestamps null: false
    end
  end
end
