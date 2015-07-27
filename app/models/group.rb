class Group < ActiveRecord::Base
  belongs_to :driver, class_name: "User"
  belongs_to :rider_one, class_name: "User"
  belongs_to :rider_two, class_name: "User"
  belongs_to :rider_three, class_name: "User"
  belongs_to :rider_four, class_name: "User"
end
