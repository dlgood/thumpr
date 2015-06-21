$(document).ready(function() {

  window.setTimeout(function() {
    $(".custom-alert").fadeTo(500, 0).slideUp(500, function(){
        $(this).remove(); 
    });
  }, 3000);

});
