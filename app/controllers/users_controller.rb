class UsersController < ApplicationController
  def index
    @users = User.where("email NOT LIKE ?", current_user.email)
  end
  
  def show
    user_id = params[:id]
    @user = User.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    if current_user.id == params[:id].to_i
      user_id = params[:id]
      @user = User.find_by(id: params[:id])
      @genres = Genre.all
      @instruments = Instrument.all
      render 'edit.html.erb'
    else 
      redirect_to '/users'
    end
  end

  def update
    if current_user.id == params[:id].to_i
    user_id = params[:id]
    @user = User.find_by(id: params[:id])
    @user.update(user_params)

    current_user.user_genres.destroy_all
    Genre.all.each do |genre|
      if params[genre.name.downcase]
        UserGenre.create(
          user_id: current_user.id,
          genre_id: genre.id
        )
      end
    end

    current_user.user_instruments.destroy_all
    Instrument.all.each do |instrument|
      if params[instrument.name.downcase]
        UserInstrument.create(
          user_id: current_user.id,
          instrument_id: instrument.id
        )
      end
    end
      redirect_to "/users/#{@user.id}" 
    else 
      redirect_to "/users"
    end
  end

  def current_user_profile
    @user = current_user
  end

  private

  def user_params
    params.permit(
      :first_name,
      :last_name,
      :birthdate,
      :address,
      :avatar, 
      :bio, 
      :area,
      :username,
      :artists
    ) 
  end
end
