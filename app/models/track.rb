class Track < ActiveRecord::Base
	belongs_to :course
	has_one :course
	has_many :courses_points, through :course 
end
