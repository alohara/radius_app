  $(document).ready(function(){
	$("#main_menu").click(function(){
    $("#bs-example-navbar-collapse-2").removeClass("in");
	$("#bs-example-navbar-collapse-3").removeClass("in");
	$("#bs-example-navbar-collapse-4").removeClass("in");
	$("#setting_mobile").css("display", "none");
	$(".setting").removeClass("dropdown-menu");
	$(".setting").addClass("setting-menu");
  });
  $("#searhc_menu").click(function(){
    $("#bs-example-navbar-collapse-1").removeClass("in");
	$("#bs-example-navbar-collapse-3").removeClass("in");
	$("#bs-example-navbar-collapse-4").removeClass("in");
  });
  $("#filter_menu").click(function(){
    $("#bs-example-navbar-collapse-2").removeClass("in");
	$("#bs-example-navbar-collapse-1").removeClass("in");
	$("#bs-example-navbar-collapse-4").removeClass("in");
	$("#filter_mobile").css("display", "none");
	$(".filter").removeClass("dropdown-menu");
	$(".filter li").css({"float": "left", "color": "white", "list-style": "none","margin":"10px"});
	$(".filter li a").css({"color": "white", "text-decoration": "none","padding":"5px"});
	$(".navbar-collapse").css({"width": "100%"});

  });
  $("#post_menu").click(function(){
    $("#bs-example-navbar-collapse-2").removeClass("in");
	$("#bs-example-navbar-collapse-1").removeClass("in");
	$("#bs-example-navbar-collapse-3").removeClass("in");
	$("#post_mobile").css("display", "none");
	$(".more_width").removeClass("dropdown-menu");
  });
  
   $('#sidebar_menu').on('click', function() {
    var flag = $(this).data('flag');
    $('.sidebar').toggle('slice');
    if (flag) {
		 $("#dashboard").removeClass("col-xs-12");
	$("#dashboard").addClass("col-xs-offset-4","col-xs-8");
	$(".glyphicon-arrow-right").addClass("glyphicon-arrow-left"); 
	$(".glyphicon-arrow-right").removeClass("glyphicon-arrow-right"); 
	
      
    } else {
      $("#dashboard").removeClass("col-xs-offset-4","col-xs-8");
	$("#dashboard").addClass("col-xs-12");
	$(".glyphicon-arrow-left").addClass("glyphicon-arrow-right"); 
	$(".glyphicon-arrow-left").removeClass("glyphicon-arrow-left"); 
	
    }

    $(this).data('flag', !flag);
});
});