class CoursesController < SecuredController
 
	def show
	  if params[:user_id]
     	user_courses = User.find_by(auth_id: params[:user_id]).courses
     	course_details = {}
     	user_courses.each do |course|
          course_details.push ({duration: course.duration, 
      	distance: course.distance, 
      	name: course.name, 
      	average_speed: course.average_speed,
        created_at: course.created_at})
     	end
        

     	render json: course_details
	  else
      	course = Course.find_by(id: params[:id])
      	course_details = {duration: course.duration, 
      	distance: course.distance, 
      	name: course.name, 
      	average_speed: course.average_speed,
        created_at: course.created_at}

      	render json: course_details
     end
	end

	def index
		render json: Course.all
	end
     
	def create
	   course = User.find_by(auth_id: params[:auth_id]).courses.create(name: params[:name])
	   render json: course.id
	end

	def update
      Course.find_by(id: params[:id]).update_attributes(courses_update_params)
	end

	private

	def courses_update_params
      params.require(:course).permit(:name)
	end

end



