# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
addrs = null
startIndex = 0

$(document).ready ->
	initMap()
	#get all roads with Pois
	allroads = get_all_roads()

processRoads = (data) ->
	#str_road = ''
	#for xx in data
	#	str_road += xx.name
	#alert str_road
	addrs = data
	startIndex = 0
	showAllPois()
	//geocodeSearch()

showAllPois = () ->
	for road in addrs
		#if road.pois has a X, Y add a marker
		if road.pois
			for poi in road.pois
				if poi.X && poi.Y
					point = new BMap.Point(poi.Y, poi.X)
					addMarker(point, road.name+poi.ref, road.name+poi.ref)

geocodeSearch = () ->
	ii = 0
	#for road in [addrs[0], addrs[1], addrs[2], addrs[3], addrs[4], addrs[5]]
	for road in addrs
		if road.pois
			for poi in road.pois
				continue if ii++ < startIndex
				if poi.X && poi.Y
					continue
				else
					getXY(road.name, poi.ref, poi.ref_type, (point) ->
						if (point)
							poi.X = point.lat
							poi.Y = point.lng
							#addrComp = point.addressComponents
							#ajax post poi to server
							poi_url = "/roads/"+road._id+"/pois"
							$.ajax({
								type: 'POST',
								url: poi_url,
								data: poi,
								success: ->
									return
								,
								dataType: "json"
							})							
							addMarker(point, road.name+poi.ref, road.name+poi.ref)
					)
					setTimeout(geocodeSearch, 500)
					startIndex++
					return
				ii++
		
get_all_roads = () ->
	$.get("/roads", processRoads, "json")