module CoursesHelper

  def self.distance_between_two_coordinates(point_a,point_b)
  	lat1 = point_a.latitude
  	lon1 = point_a.longitude
	  lat2 = point_b.latitude
	  lon2 = point_b.longitude
    r = 6371000
	  phi1 = lat1 * Math::PI / 180 
	  phi2 = lat2 * Math::PI / 180 
	  delta_phi = (lat2-lat1) * Math::PI / 180 
	  delta_lambda = (lon2-lon1) * Math::PI / 180 

	  a = Math.sin(delta_phi/2) * Math.sin(delta_phi/2) +
  	    Math.cos(phi1) * Math.cos(phi2) *
  	   Math.sin(delta_lambda/2) * Math.sin(delta_lambda/2)

	  c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

	  d = r * c
  end

#  # def self.distance_between_two_coordinates(arg ={})
#  #    lat1 = arg[:lat1]
#  #    lon1 = arg[:lon1]
#  #    lat2 = arg[:lat2]
#  #    lon2 = arg[:lon2]
#  #    r = 6371000
#  #    phi1 = lat1 * Math::PI / 180 
#  #    phi2 = lat2 * Math::PI / 180 
#  #    delta_phi = (lat2-lat1) * Math::PI / 180 
#  #    delta_lambda = (lon2-lon1) * Math::PI / 180 

#  #    a = Math.sin(delta_phi/2) * Math.sin(delta_phi/2) +
#  #        Math.cos(phi1) * Math.cos(phi2) *
#  #       Math.sin(delta_lambda/2) * Math.sin(delta_lambda/2)

#  #    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))

#  #    d = r * c
#  #  end
  def agregate_average_speed(user_id)
    courses = Course.where(user_id: user_id)
    speed_averages = []
    
    courses.each do |course|
      speed_averages << course.average_speed
    end
    
    speed_averages.reduce(:+).to_f / speed_averages.size
  end
end

