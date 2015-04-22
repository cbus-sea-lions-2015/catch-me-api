class Course < ActiveRecord::Base
	 has_many :courses_points
	 belongs_to :user

   def distance
     if self.courses_points.count > 1
    ((CoursesPoint.where(course_id: id).pluck(:distance_from_previous).reduce(:+)) / 1609.344).round(2)
    end
   end

   def duration
    if self.courses_points.count > 1
    (CoursesPoint.where(course_id: id).last.created_at - CoursesPoint.where(course_id: id).first.created_at)
    else
    0
    end
   end

   def average_speed
     if self.courses_points.count > 1
      (self.distance / self.duration).round(2)
    else
      0
    end
   end
   
   def real_name
     self.name = "Run fucker, Run!" if self.name == nil
     self.name
   end

end


# select sum(distance) from courses_points where course_id = 12

# distance_from_previous