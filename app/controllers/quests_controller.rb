class QuestsController < ApplicationController
  before_filter :set_quest, only: [:show, :edit, :update, :destroy]
  def index
    if params[:mission_id]
      @mission = Mission.find(params[:mission_id])
      @quests = @mission.quests
    else
      @quests = Quest.all
    end
  end

  def show
  end

  def new
    @quest = Quest.new
  end

  def edit
  end

  def create
    @mission = Mission.find(params[:mission_id])
    @quest = @mission.quests.create(quest_params)
    if @quest
      redirect_to @quest, notice: "Quest created!"
    else
      render :new, notice: "Something went wrong: #{e.messages}"
    end
  end

  def update
    if @quest.update_attributes(quest_params)
      redirect_to @quest, notice: "Quest updated!"
    else
      render :edit, notice: "Something went wrong: #{e.messages}"
    end
  end

  def destroy
    @quest.destroy
    redirect_to @quest.campaign, notice: "Quest destroyed"
  end

  private

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def quest_params
    params.require(:quest).permit(:title, :description, :completion_xp, :required, :comparison_url, :bonus_xp, :comparison_percentage)
  end
end
