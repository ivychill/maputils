/* maputils.js */

var map = null;
var activedIcon = new BMap.Icon('pin-active.png', new BMap.Size(40,40));
var inactivedIcon = new BMap.Icon('pin-inactive.png', new BMap.Size(40,40));

$ = jQuery;

function initMap() {
	map = new BMap.Map("map_canvas");
	map.centerAndZoom("深圳", 12);
	var trafficLayer = new BMap.TrafficLayer();
	//map.addTileLayer(trafficLayer);
	map.setMinZoom(12);
        // update the navbar title using jQuery
        $('#marker-nav .marker-title')
            .html("...Navigator Bar Here...")
            .removeClass('has-detail')
            .unbind('click');
}

function getXY(filter1, filter2, filter_type, cbk_fn) {
	var myGeo = new BMap.Geocoder();
	var addr = "";
	if (filter1) addr = addr+filter1;
	if (filter2) addr = addr+"/"+filter2;
	if (filter_type) addr = addr+"("+filter_type+")";
	myGeo.getPoint(addr, cbk_fn, "深圳");	
}

function addMarker(latlong, title, content) {
	var marker = new BMap.Marker(latlong, {icon:activedIcon});
	map.addOverlay(marker);
	if (currentMarker) {
		currentMarker.setIcon(inactivedIcon);
	}
	
	var infoWindow = new BMap.InfoWindow(content);

	//marker.addEventListener('click', function() {
	//	this.openInfoWindow(infoWindow);
	//});
}