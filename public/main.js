$(document).ready(function(){
  $(".error").hide();
  
  // Alternative, example of validation on-submit.
  $("#the_form").on("submit", function(e){
    // By default, let the form be valid.
    var valid_form = true;
    
    var event_add = $(".add_event_new_artist").val();
    if (paint_color === ""){
      $(".add_event_new_artist").next().show();
      valid_form = false;
    }
    
    if (valid_form === false){
      alert("INVALID FORM");
      e.preventDefault();
    }
    
  });
});