class CommitmentsController < ApplicationController
  def create
    Commitment.create(
      user_id: current_user.id,
      jam_id: params[:jam_id]
    )
    redirect_to "/jams/#{params[:jam_id]}"
  end
end
