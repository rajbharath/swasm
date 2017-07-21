# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
`
  $(document).ready(function() {
    $("#search_location").geocomplete()
                        .bind("geocode:result", function(event, result){
                          console.log(result);
                        });

    setTimeout(function(){
      Materialize.updateTextFields();
    });
    $("#project_location").on("click", function(){
       $("#modal1").modal('open');

       $("#enter_location").geocomplete({
          map: "#map",
          mapOptions: {
            zoom: 19
          },
          markerOptions: {
            draggable: true
          },
        }).bind("geocode:result", function(event, result){
                          $("#project_location").val("POINT (" + result.geometry.location.lat() + " " + result.geometry.location.lng() + ")");
                          $("#location_name").val(result.formatted_address);
                          Materialize.updateTextFields();
                        });;

        setTimeout(function(){
          $(".pac-container").css('z-index', 20000);
        }, 1000);
    });




  });

`
