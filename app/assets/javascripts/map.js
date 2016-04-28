var marker;
var map;
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: {lat: 41.881832, lng: -87.623177}
  });

  marker = new google.maps.Marker({
    map: map,
    draggable: false,
    animation: google.maps.Animation.DROP,
    position: {lat: 41.978361, lng: -87.669315}
  });
}


