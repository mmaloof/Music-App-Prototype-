class JamsController < ApplicationController
  def index
    if params[:genre_id]
      @jams = Genre.find(params[:genre_id]).jams
    else
      @jams = Jam.all
    end
    render 'index.html.erb'
  end

  def new
    @instruments = Instrument.all
    render 'new.html.erb'
  end

  def create
    @jam = Jam.new(
      name: params[:name],
      venue: params[:venue],
      date: params[:datetime],
      time: params[:datetime],
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
      render 'new.html.erb'
    end
  end

  def show 
    jam_id = params[:id]
    @jam = Jam.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @jam = Jam.find_by(id: params[:id])
    if current_user.id == @jam.user_id
      @genres = Genre.all
      @instruments = Instrument.all
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
        date: params[:datetime],
        time: params[:datetime],
        summary: params[:summary],
        address: params[:address]
      )

        # @jam.id.jam_genres.destroy_all
        # Genre.all.each do |genre|
        #   if params[genre.name.downcase]
        #     JamGenre.create(
        #       jam_id: jam.id,
        #       genre_id: genre.id
        #     )
        #   end
        # end

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
      render 'destroy.html.erb'
    else 
      redirect_to "/jams/#{@jam.id}"
    end 
  end
end 
