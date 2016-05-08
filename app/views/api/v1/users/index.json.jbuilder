json.array! @users.each do |user|
  json.id user.id
  json.first_name user.first_name
  json.last_name user.last_name
  json.address user.address
  json.latitude user.latitude
  json.longitude user.longitude
  json.isCurrentUser user.id == current_user.id
end