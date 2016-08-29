class CaregiversController < ApplicationController
  def show
    @caregiver = Caregiver.find_by_id(params[:id])
  end

  def edit
    @caregiver = Caregiver.find_by_id(params[:id])
    if session[:user_id] != @caregiver[:id]
      flash[:error] = "You are NOT authorized to edit this profile."
      redirect_to '/'
    end
  end

  def update
    caregiver_params = params.require(:caregiver).permit(:experience, :photo, :location, :credentials)
    @caregiver = Caregiver.find_by_id(params[:id])
    if @caregiver.update(caregiver_params)
      redirect_to caregiver_path(@caregiver)
    else
      redirect_to :back
    end
  end
end
