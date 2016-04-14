class JamsController < ApplicationController
  def index
    @jams = Jam.all
    render 'index.html.erb'
  end

  def new
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
      redirect_to "/jams/#{@jam.id}"
    else
      render 'new.html.erb'
    end
  end

  def show 
    jam_id = params[:id]
    @jam = Jam.find_by(id: params[:id])
    render 'show.html.erb'
  end
end
