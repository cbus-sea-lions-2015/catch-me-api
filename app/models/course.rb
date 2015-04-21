class Course < ActiveRecord::Base
	 has_many :courses_points
	 belongs_to :user

   def distance
     (CoursesPoint.where(course_id: id).pluck(:distance_from_previous).reduce(:+)) / 1000
   end

   def duration
    (CoursesPoint.where(course_id: id).last.created_at - CoursesPoint.where(course_id: id).first.created_at) / 3600
   end

   def average_speed
      self.distance / self.duration
   end


end


# select sum(distance) from courses_points where course_id = 12

# distance_from_previous