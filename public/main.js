$(document).ready(function(){
  $(".error").hide();
  
  // Alternative, example of validation on-submit.
  $("#the_form").on("submit", function(e){
    // By default, let the form be valid.
    var valid_form = true;
    
    var paint_color = $("#paint_color").val();
    if (paint_color === ""){
      $("#paint_color").next().show();
      valid_form = false;
    }
    
    if (valid_form === false){
      alert("INVALID FORM");
      e.preventDefault();
    }
    
  });
});