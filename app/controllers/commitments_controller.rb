class CommitmentsController < ApplicationController
  def create
    if !Commitment.exists?(user_id: current_user.id, jam_id: params[:jam_id]) 
      Commitment.create(
        user_id: current_user.id,
        jam_id: params[:jam_id]
      )
    end
    redirect_to "/jams/#{params[:jam_id]}"
  end
end
