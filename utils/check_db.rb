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

def clear_db
	Road.all.each do |road|
		road.pois.each do |poi|
			if poi.X && poi.Y
				drop_duplicated_records(road.pois, poi)
			end
		end
	end
end

def drop_duplicated_records(pois, poi)
	pois.each do |xx|
		xx.destroy if xx.ref == poi.ref && (!xx.X || !xx.Y)
	end
end

clear_db

puts db_status