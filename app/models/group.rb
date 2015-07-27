class Group < ActiveRecord::Base
  has_one :driver, class_name: "User"
end
