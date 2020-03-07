$(function(){
  $("#category").hover(function() {
    $(this).children('ul').show();
  }, function() {
    $(this).children('ul').hide();
    $("#parent").hover(function() {
      $(this).children('.children_box').show();
    }, function() {
      $(this).children('.children_box').hide();
    });
  });
});