class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :user_enrolled?

  def show
  end

  private 


  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def user_enrolled?
    if !current_user.enrolled_in?(current_lesson.section.course)
     redirect_to :back, alert: 'You are not Enrolled!'
   end
  end
end
