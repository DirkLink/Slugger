class Group < ActiveRecord::Base
  has_one :driver, class_name: "User"
  has_one :rider_one, class_name: "User"
  has_one :rider_two, class_name: "User"
  has_one :rider_three, class_name: "User"
  has_one :rider_four, class_name: "User"
end
