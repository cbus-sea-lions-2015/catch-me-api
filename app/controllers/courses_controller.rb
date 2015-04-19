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
	   user = User.find_by(id: params[:user_id]).courses.create
	   # user.courses.last.id
	 end

 
end



