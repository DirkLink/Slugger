json.group do
  json.array![
    json.user do
      json.id @group.driver.id
      json.email @group.driver.email
      json.first_name @group.driver.first_name
      json.last_name @group.driver.last_name
      json.username @group.driver.username
      json.driver @group.driver.driver
    end,
    json.user do
      json.id rider_one.id
      json.email @group.rider_one.email
      json.first_name @group.rider_one.first_name
      json.last_name @group.rider_one.last_name
      json.username @group.rider_one.username
      json.driver @group.rider_one.driver
    end,
    json.user do
      json.id @group.rider_two.id
      json.email @group.rider_two.email
      json.first_name @group.rider_two.first_name
      json.last_name @group.rider_two.last_name
      json.username @group.rider_two.username
      json.driver @group.rider_two.driver
    end,
    json.user do
      json.id @group.rider_three.id
      json.email @group.rider_three.email
      json.first_name @group.rider_three.first_name
      json.last_name @group.rider_three.last_name
      json.username @group.rider_three.username
      json.driver @group.rider_three.driver
    end,
    json.user do
      json.id @group.rider_four.id
      json.email @group.rider_four.email
      json.first_name @group.rider_four.first_name
      json.last_name @group.rider_four.last_name
      json.username @group.rider_four.username
      json.driver @group.rider_four.driver
    end
  ]
end