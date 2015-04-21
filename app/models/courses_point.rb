class CoursesPoint < ActiveRecord::Base
  include CoursesHelper
	before_save :calculate_distance
  belongs_to :course


  def position
    {latitude: latitude, longitude: longitude}
  end
   
 
 
  
  private
  def calculate_distance
    number_of_points = CoursesPoint.where(course_id: self.course_id).length
    if number_of_points == 0
      self.distance_from_previous = 0
    else
    old_position = CoursesPoint.where(course_id: course_id).last.position
    puts old_position
    self.distance_from_previous = distance_between_two_coordinates(old_position,position)
    end
  end

  

   
end

