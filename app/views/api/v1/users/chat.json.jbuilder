json.array! @users.each do |user|
  json.isCurrentUser user.id == current_user.id
end
