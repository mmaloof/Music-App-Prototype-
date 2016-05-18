class JamsController < ApplicationController
  def index
    if params[:genre_id]
      @jams = Genre.find(params[:genre_id]).jams
    else
      @jams = Jam.all
    end
    @banner_image = "/assets/images/vultures.jpg"
    @banner_title = "All Events"
    @banner_subtitle = ""
  end

  def new
    @instruments = Instrument.all
    @banner_image = "/assets/images/drums.jpg"
    @banner_title = "New Event"
    @banner_subtitle = ""
  end

  def create
    @jam = Jam.new(
      name: params[:name],
      venue: params[:venue],
      date: params[:date],
      time: params[:time],
      summary: params[:summary],
      address: params[:address],
      user_id: current_user.id
    )
    if @jam.save
      params[:instruments].each do |instrument_id, quantity|
        JamInstrument.create(
          jam_id: @jam.id,
          instrument_id: instrument_id,
          quantity: quantity
        )
      end
      Genre.all.each do |genre|
        if params[genre.name.downcase]
          JamGenre.create(
            jam_id: @jam.id,
            genre_id: genre.id
          )
        end
      end
      redirect_to "/jams/#{@jam.id}"
    else
      @genres = Genre.all
      @instruments = Instrument.all
    end
  end

  def show 
    jam_id = params[:id]
    @jam = Jam.find_by(id: params[:id])
    @banner_image = "/assets/images/drums.jpg"
    @banner_title = "What's the plan?"
    @banner_subtitle = ""
  end

  def edit
    @jam = Jam.find_by(id: params[:id])
    if current_user.id == @jam.user_id
      @genres = Genre.all
      @instruments = Instrument.all
      @banner_image = "/assets/images/drums.jpg"
      @banner_title = "Edit Event"
      @banner_subtitle = ""
    else
      redirect_to "/jams/#{@jam.id}"
    end
  end

  def update
    @jam = Jam.find_by(id: params[:id])
    if current_user.id == @jam.user_id
      if @jam.update(
        name: params[:name],
        venue: params[:venue],
        date: params[:date],
        time: params[:time],
        summary: params[:summary],
        address: params[:address]
      )
      JamInstrument.delete_all(jam_id: params[:id])
      params[:instruments].each do |k, v|
        JamInstrument.create(jam_id: params[:id], instrument_id: k, quantity: v)
      end

      JamGenre.delete_all(jam_id: params[:id])
      params[:genres].each do |genre_id|
        JamGenre.create(jam_id: params[:id], genre_id: genre_id)
      end

        flash[:success] = "Jam successfully updated!"
        redirect_to "/jams/#{@jam.id}"
      else
        render 'edit.html.erb'
      end
    else
      redirect_to "/jams/#{@jam.id}"
    end
  end

  def destroy
    jam_id = params[:id]
    @jam = Jam.find_by(id: params[:id])
    if current_user.id == @jam.user_id
      @jam.destroy
      @banner_image = "/assets/images/guitar.jpg"
      @banner_title = "Jam Deleted"
      @banner_subtitle = ""
    else 
      redirect_to "/jams/#{@jam.id}"
    end 
  end
end 
