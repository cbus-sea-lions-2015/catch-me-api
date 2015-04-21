class CoursesController < SecuredController
 
	def show
	  if params[:user_id]
     user_courses = User.find_by(auth_id: params[:user_id]).courses
     render json: user_courses
	  else
      @course = Course.find_by(id: params[:id])
      logger.info(@course)
      render json: @course
     end
	end

	def index
		render json: Course.all
	end
     
	def create
	   course = User.find_by(auth_id: params[:auth_id]).courses.create
	   render json: course.id
	end

	def update
      Course.find_by(id: params[:id]).update_attributes(courses_update_params)
	end

	private

	def courses_update_params
      params.require(:course).permit(:city, :country, :duration, :distance, :name, :average_speed)
	end

end



