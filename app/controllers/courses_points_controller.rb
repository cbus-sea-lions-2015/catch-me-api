class CoursesPointsController < ApplicationController
	
	def show
      @course_points = Course.find_by(id: params[:course_id]).courses_points
      render json: @course_points
	end
    
    

end
