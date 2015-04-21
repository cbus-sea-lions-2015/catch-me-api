class Course < ActiveRecord::Base
	 has_many :courses_points
	 belongs_to :user

   def total_distance
     CoursesPoint.where(course_id: id).distance_from_previous.reduce(:+)
   end
end


# select sum(distance) from courses_points where course_id = 12

# distance_from_previous