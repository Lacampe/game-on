$(document).ready(function() {
  var location = $('#location').get(0);

  if (location) {
    var autocomplete = new google.maps.places.Autocomplete(location, { types: ['geocode'] });
    google.maps.event.addDomListener(location, 'keydown', function(e) {
      if (e.keyCode == 13) {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
