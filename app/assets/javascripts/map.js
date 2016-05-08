var marker;
var map;
function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: {lat: 41.881832, lng: -87.623177}
  });

  fetch('/api/v1/users')
    .then(function(response) {
      return response.json();
    })
    .then(function(users) {
      console.log(users);
      users.forEach(function(user) {
        var marker = new google.maps.Marker({
          map: map,
          draggable: false,
          animation: google.maps.Animation.DROP,
          position: {lat: user.latitude, lng: user.longitude}
        });
      });
    });

}

