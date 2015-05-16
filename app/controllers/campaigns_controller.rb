class CampaignsController < ApplicationController
  before_filter :set_campaign, only: [:edit, :update, :show, :destroy]
  def index
    if params[:course_id]
      @course = Course.find(params[:course_id])
      @campaigns = @course.campaigns
    else
      @campaigns = Campaign.all
    end
  end

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def edit
  end

  def create
    @course = Course.find(params[:course_id])
    @campaign = @course.campaigns.create!(campaign_params)
    if @campaign
      redirect_to @campaign, notice: "Campaign created!"
    else
      render :new, notice: "Something went wrong: #{e.messages}"
    end
  end

  def update
    if @campaign.update_attributes(campaign_params)
      redirect_to @campaign, notice: "Well done - #{@campaign.title} updated!"
    else
      render :edit, notice: "Something went wrong: #{e.messages}"
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_path, notice: "Course removed."
  end

  private

  def set_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title, :description, :completion_xp)
  end
end
