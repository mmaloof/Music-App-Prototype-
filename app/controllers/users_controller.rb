class UsersController < ApplicationController
  def index
    @users = User.where("email NOT LIKE ?", current_user.email)
    @banner_image = "/assets/images/behemoth.jpg"
    @banner_title = "Musician Profiles"
    @banner_subtitle = ""
  end
  
  def show
    user_id = params[:id]
    @user = User.find_by(id: params[:id])
    @banner_image = "/assets/images/rad.jpg"
    @banner_title = ""
    @banner_subtitle = ""
  end

  def edit
    if current_user.id == params[:id].to_i
      user_id = params[:id]
      @user = User.find_by(id: params[:id])
      @genres = Genre.all
      @instruments = Instrument.all
      @banner_image = "/assets/images/behemoth.jpg"
      @banner_title = "Your Profile Information"
      @banner_subtitle = ""
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
      if params[:genres]
        Genre.all.each do |genre|
          if params[:genres].include?(genre.id.to_s)
            UserGenre.create(
              user_id: current_user.id,
              genre_id: genre.id
            )
          end
        end
      end

      current_user.user_instruments.destroy_all
      if params[:instruments]
        Instrument.all.each do |instrument|
          if params[:instruments].include?(instrument.id.to_s)
            UserInstrument.create(
              user_id: current_user.id,
              instrument_id: instrument.id
            )
          end
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
