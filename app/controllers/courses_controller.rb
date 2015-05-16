class CoursesController < ApplicationController
  before_filter :set_course, only: [:edit, :update, :show, :destroy]
  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end

  def edit
  end

  def create
    if @course.create!(course_params)
      redirect_to new_campaign_path(course_id: @course.id)
    else
      render :new, notice: "Something went wrong: #{e.messages}"
    end
  end

  def update
    if @course.update_attributes(course_params)
      redirect_to @course, notice: "Well done - #{@course.title} updated!"
    else
      render :edit, notice: "Something went wrong: #{e.messages}"
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: "Course removed."
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :completion_xp, :instructor_id)
  end
end
