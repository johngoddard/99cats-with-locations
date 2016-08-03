jQuery(function() {
  var completer;

  completer = new GmapsCompleter({
    inputField: '#gmaps-input-address',
    errorField: '#gmaps-error'
  });

  completer.autoCompleteInit({
    country: "us"
  });

  var defaultPositionOutputter = function(latLng) {
    console.log("OUTPUT!!!!!");
    console.log(latLng);
  };
});
