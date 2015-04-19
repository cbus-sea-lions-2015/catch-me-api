class CoursesController < ApplicationController
 
	def show
      @course = Course.find_by(id: params[:id])
      logger.info(@course)
      render json: @course
	end

	def index
		render json: Course.all
	end
     
	 def create
	   course = User.find_by(id: params[:user_id]).courses.new
	   if course.save
	     render json: course.id
		 else
		 	 render json: false
		 end
	 end

 
end



