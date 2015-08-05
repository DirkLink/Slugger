json.users @data do |user|
    json.id user.id
    json.email user.email
    json.first_name user.first_name
    json.last_name user.last_name
    json.username user.username
    json.driver user.driver
    json.bio user.bio
    json.preferences user.preferences
    json.morning_time user.itinerary.clean_home_time
    json.evening_time user.itinerary.clean_work_time
    json.home_locale user.itinerary.home_locale
    json.work_locale user.itinerary.work_locale
    json.home_lat user.itinerary.home_lat
    json.home_lng user.itinerary.home_lng
    json.work_lat user.itinerary.work_lat
    json.work_lng user.itinerary.work_lng
end 

json.groups @groups do |group|
    json.driver group.driver
    json.rider_one group.rider_one
    json.rider_two group.rider_two
    json.rider_three group.rider_three
    json.rider_four group.rider_four
end