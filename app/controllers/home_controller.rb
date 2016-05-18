class HomeController < ApplicationController
  def home
    @banner_image = "/assets/images/hair.jpg"
  end

  def map
    render 'map.html.erb'
  end
end
