class UsersController < ApplicationController
  def index
    if current_user && current_user.first_name == nil
      redirect_to "/users/#{current_user.id}/edit"
    else
      render 'index.html.erb'
    end
  end

  def edit
    user_id = params[:id]
    @user = User.find_by(id: params[:id])
    @genres = Genre.all
    @instruments = Instrument.all
    render 'edit.html.erb'
  end

  def update
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
    redirect_to "/" 
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
