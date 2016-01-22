/* Custom Scripts */

/* Document Ready Starts */
$(document).ready(function(){

$(".forgot-txt").click(function(){
    $(".box-signin").hide();
    $(".btn-signin").hide();
    $(".box-forgot").show();
    $(".btn-forgot").show();
});

$(".signin-txt").click(function(){
	$(".box-forgot").hide();
    $(".btn-forgot").hide();
    $(".box-signin").show();
    $(".btn-signin").show();
});


$(".signin-go").click(function(event){
	event.preventDefault();
	$(".login-area").show();
    $(".signup-area").hide();
    $(".forgot-area").hide();
});

$(".signup-go").click(function(event){
	event.preventDefault();
	$(".login-area").hide();
    $(".signup-area").show();
    $(".forgot-area").hide();
});

$(".forgot-go").click(function(event){
	event.preventDefault();
	$(".login-area").hide();
    $(".signup-area").hide();
    $(".forgot-area").show();
});

});
/* Document Ready Ends */
jQuery(function($){ $('.chosen').chosen({width: "100%"}); });
/* Window.Load Starts */
$(window).load(function() { 
  $('#carousel').flexslider({
    animation: "slide",
    controlNav: false,
    animationLoop: false,
    slideshow: false,
    itemWidth: 210,
    itemMargin: 5,
    asNavFor: '#slider'
  });
 
  $('#slider').flexslider({
    animation: "slide",
    controlNav: false,
    animationLoop: false,
    slideshow: false,
    sync: "#carousel"
  });
});



/* Window.Load Ends */






