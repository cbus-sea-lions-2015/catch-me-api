class CoursesController < SecuredController

  def show
    if params[:user_id]
      user_courses = User.find_by(auth_id: params[:user_id]).courses
      course_details = []
      user_courses.each do |course|
        course_details << format_course_data(course)
      end

      render json: course_details.reverse.take(5)
    else
      course = Course.find_by(id: params[:id])
      render json: format_course_data(course)
    end
  end

  def profiledata
    user_courses = User.find_by(auth_id: params[:user_id]).courses.limit(7)
    distances = []
    user_courses.each do |course|
      distances.push(course.distance)
    end
    (15-distances.size).times{distances.unshift(3)}
    render json: {distance: distances}
  end

  def index
    render json: Course.all
  end

  def create
    course = User.find_by(auth_id: params[:auth_id]).courses.create(name: params[:name])
    course.update_attributes(catch_me_course_id: params[:catch_me_course_id]) if params[:catch_me_course_id]

    render json: course.id
  end

  def update
    Course.find_by(id: params[:id]).update_attributes(courses_update_params)
  end


  def destroy
    Course.find_by(id: params[:id]).destroy
    Course.each { |course| course.catch_me_course_id = nil if course.catch_me_course_id == params[:id]}
  end

  private

  def courses_update_params
    params.require(:course).permit(:name,:favorite)
  end

  def format_course_data(course)
    {
      id: course.id,
      duration: Time.at(course.duration).utc.strftime("%H:%M:%S") ,
      distance: course.distance,
      name: course.name,
      average_speed: course.average_speed,
      favorite: course.favorite,
      catch_me_course_id: course.catch_me_course_id,
      created_at: course.created_at.strftime("%b-%d-%Y %H:%M"),
      comparison_speed: Course.comparison(course.id,course.catch_me_course_id)
    }
  end



end
