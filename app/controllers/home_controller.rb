class HomeController < ApplicationController
  def home
    'home.html.erb'
  end

  def map
    render 'map.html.erb'
  end
end
