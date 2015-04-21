class CoursesPointsController < SecuredController
	
	def show
      course_points = Course.find_by(id: params[:id]).courses_points
      render json: course_points
	end

	def create
	  course = Course.find_by(id: params[:course_id])
    course_point = course.courses_points.create(course_point_params)
  
    render json: course_point.id
	end
    
    private

    def course_point_params
      params.require(:course_point).permit(:longitude,:latitude)
    end

end
