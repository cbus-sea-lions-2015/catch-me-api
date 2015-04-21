class CoursesPointsController < SecuredController
	
	def show
      course_points = Course.find_by(id: params[:id]).courses_points
      render json: course_points
	end

	def create
	  course = Course.find_by(id: params[:course_id])
    course_point = course.courses_points.create(course_point_params)
      # update the distance on the course
    total_distance = course.distance.update(total_distance_covered(course.id))
    
      # update the time taken
    total_time = course.duration.update(course.courses_points.created at[-1] - course.courses_points.created at[0])
    
      # update the average speed on the course
    course.average_speed.update(total_distance / total_time)

    render json: course_point.id

	end
    
    private

    def course_point_params
      params.require(:course_point).permit(:longitude,:latitude,:altitude)
    end

    def total_distance_covered(course_id)
        
      course = Course.find_by(id: course_id)
      distance = 0
      @previous_position = {longitude: course.courses_points[0].longitude,
                             latitude:  course.courses_points[0].latitude}
      
      course.courses_points.each do |course_point|
        distance += distance_between_two_coordinates({
                            {point_a: previous_position},
                            {point_b: {longitude: position.longitude, latitude:  position.latitude}
                            }
                                                      })
        @previous_position = {longitude: position.longitude,
                              latitude:  position.latitude}
      end
      distance
    end

end
