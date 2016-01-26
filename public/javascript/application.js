$(document).ready(function() {

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.nav a').on('click', function(){
    $('.nav').find('.active').removeClass('active');
    $(this).parent().addClass('active');
  });
  
});

