class HomeController < ApplicationController
  def index
    if current_user && current_user.first_name == nil
      redirect_to "/users/#{current_user.id}/edit"
    else
      render 'index.html.erb'
    end
  end
end
