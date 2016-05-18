class ChatsController < ApplicationController
  def index
    @banner_image = "/assets/images/crowd.jpg"
    @banner_title = "Welcome to the Green Room"
    @banner_subtitle = ""
  end
end
