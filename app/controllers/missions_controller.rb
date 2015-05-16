class MissionsController < ApplicationController
  before_filter :set_mission, only: [:show, :edit, :update, :destroy]

  def index
    if params[:campaign_id]
      @campaign = Campaign.find(params[:campaign_id])
      @missions = @campaign.missions
    else
      @missions = Mission.all
    end
  end

  def show
  end

  def edit
  end

  def new
    @mission = Mission.new
  end

  def create
    @campaign = Campaign.find(params[:campaign_id])
    @mission = @campaign.missions.create(mission_params)
    if @mission
      redirect_to @mission, notice: "Mission created!"
    else
      render :new, notice: "Something went wrong: #{e.messages}"
    end
  end

  def update
    if @mission.update_attributes(mission_params)
      redirect_to @mission, notice: "Mission updated!"
    else
      render :edit, notice: "Something went wrong: #{e.messages}"
    end
  end

  def destroy
    @mission.destroy
    redirect_to @mission.campaign, notice: "Mission destroyed"
  end

  private

  def set_mission
    @mission = Mission.find(params[:id])
  end

  def mission_params
    params.require(:mission).permit(:title, :description, :completion_xp, :required)
  end
end
