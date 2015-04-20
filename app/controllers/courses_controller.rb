class CoursesController < ApplicationController
 
	def show
	  # if params[:user_id]
     user_courses = user.find_by(id: params[:user_id]).courses
     render json: user_courses
	  # else
   #    @course = Course.find_by(id: params[:id])
   #    logger.info(@course)
   #    render json: @course
   #   end
	end

	def index
		render json: Course.all
	end
     
	def create
	   course = User.find_by(id: params[:user_id]).courses.create
	   render json: course.id
	end

 
end



