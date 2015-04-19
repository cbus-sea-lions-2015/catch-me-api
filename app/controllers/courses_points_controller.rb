class CoursesPointsController < ApplicationController
	
	def show
      @course_points = Course.find_by(id: params[:course_id]).courses_points
      render json: @course_points
	end

	def create
	  course = Course.find_by(id: params[:course_id])
    course.courses_points.create(course_point_params)
	end
    
    private

    def course_point_params
      params.require(:course_point).permit(:longitude,:latitude,:altitude)
    end

end
