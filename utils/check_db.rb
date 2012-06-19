require File.expand_path("../util_helper", __FILE__)

def db_status
	total_roads = Road.all.size
	total_pois = 0
	solved_pois = 0
	Road.all.each do |road|
		road.pois.each do |poi|
			total_pois = total_pois+1
			solved_pois=solved_pois+1 if poi.X && poi.Y
		end
	end
	{:total_roads => total_roads, :total_pois => total_pois, :solved_pois => solved_pois}
end

puts db_status