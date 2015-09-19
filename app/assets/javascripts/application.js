// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){
  console.log("momo");
  $(".gallery_change").on('touchstart mousedown',function(e){
    e.preventDefault();
    var string = $(this).attr("id");
    var number = string.slice(3,4);
    $(this).attr("id", "old" + number);
  }).bind('touchend mouseup', function(e){
    e.preventDefault();
    $('body').css('background-color','black');
    var string = $(this).attr("id");
    var number = string.slice(3,4);
    $(this).attr("id", "new" + number);
  });
});
