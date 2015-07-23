json.user @users do |user|
  json.email user.email
  json.first_name user.first_name
  json.last_name user.last_name
  json.username user.username
  json.morning_time user.itinerary.morning_time
  json.evening_time user.itinerary.evening_time
  json.home_locale user.itinerary.home_locale
  json.work_locale user.itinerary.work_locale
end 