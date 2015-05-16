class ProfilesController < ApplicationController
  before_filter :set_profile, only: [:edit, :update, :show]
  def index
    @profiles = Profile.all
  end

  def edit
  end

  def update
    if @profile.update_attributes(profile_params)
      redirect_to @profile, notice: "Profile successfully updated!"
    else
      render :edit, notice: "There was an error"
    end
  end

  def show
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :twitter, :facebook, :github, :avatar, :current_title)
  end
end
