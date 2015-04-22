require 'faker'
class Course < ActiveRecord::Base
  before_save :check_course_name
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

  def check_course_name
    self.name ||= "#{Faker::App.name} #{Faker::Hacker.ingverb}"
  end

  def self.comparison(course1, course2)
    return Course.find(course1).average_speed - Course.find(course2).average_speed if course2
    0
  end

end


# select sum(distance) from courses_points where course_id = 12

# distance_from_previous
