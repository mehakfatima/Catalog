/* Custom Scripts */

/* Document Ready Starts */
$(document).ready(function(){

$(".forgot-txt").click(function(){
    $(".box-signin").hide();
    $(".btn-signin").hide();
    $("#myModalLabel").text('Forgot Password')
    $(".box-forgot").show();
    $(".btn-forgot").show();
});

$(".signin-txt").click(function(){
    $(".box-forgot").hide();
    $(".btn-forgot").hide(); 
    $("#myModalLabel").text('Sign In')
    $(".box-signin").show();
    $(".btn-signin").show();
});

$(".modalclose").click(function(){    
    $(".box-forgot").hide();
    $(".btn-forgot").hide();
    $("#myModalLabel").text('Sign In')
    $(".box-signin").show();
    $(".btn-signin").show();
    $(".parsley-required").html("");   
    $(".parsley-type").html("");   
    $(".parsley-minlength").html("");      
    $(".parsley-equalto").html("");   
    $(".parsley-pattern ").html("");   
    $('.form-control').removeClass('parsley-error');
    $('.form-control').removeClass('parsley-success');    
    $("input[type=text], textarea").val("");
    $("input[type=password]").val("");
    $("input[type=email]").val("");
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
jQuery(function($){ $('.chosen-select').chosen({width: "100%"}); });
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

//$('body').on('hidden.bs.modal', '.modal', function () {
//        $(this).removeData('createAccount');
//        alert("hogya");
//      });

 $(function(){   
      $('#createAccount').on('hidden.bs.modal', function () {
        console.log("in funct");
         $(this).removeData();
          alert('hidden event fired!');
      });

       $('#createAccount').on('shown.bs.modal', function () {
          console.log("in funct show");
          alert('show event fired!');
      });
});

/* Window.Load Ends */






