class CoursesPoint < ActiveRecord::Base
  include CoursesHelper
	before_save :calculate_distance
  belongs_to :course


  def position
    {latitude, longitude}
  end
  
  
  private
  def calculate_distance
    index = CoursePoint.find_by(course_id: course_id).length
    if length == 0
      self.distance_from_previous = 0
    else
    old_position = CoursePoint.find_by(course_id: course_id)[index-1].position
    self.distance_from_previous = distance_between_two_coordinates({{old_position},{position}})
    end
  end
   
end

