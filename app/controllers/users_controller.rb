class UsersController < ApplicationController
  def edit
    user_id = params[:id]
    @user = User.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    user_id = params[:id]
    @user = User.find_by(id: params[:id])
    @user.update(
      first_name: params[:first_name],
      last_name: params[:last_name],
      birthdate: params[:birthdate],
      address: params[:address]
    )
    UserGenre.create(
      user_id: user_id,
      genre_id: params[:genre_id]
    )
    UserInstrument.create(
      user_id: user_id,
      instrument_id: params[:instrument_id]
    )
    render 'update.html.erb'
  end

  def current_user_profile
    @user = current_user
  end
end
