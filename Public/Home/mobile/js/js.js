// JavaScript Document
$(function(){
	$(".ul li").each(function(){
		  if($(this).children(".a").hasClass("xz"))
		  {
			  $(this).hover(function(){
										$(this).children(".xl").stop(true,true).slideToggle()
									 })
			  }
			 else{
				 $(this).hover(function(){
										$(this).children(".a").toggleClass("xz");
										$(this).children(".xl").stop(true,true).slideToggle()
									 })
				 }
		  }) 
	var timer2;
	$(".topanniu").click(function(){
								  	$(".xl").show();
								timer2=setTimeout(function(){
							  	$(".xl").hide();
							  },4000)
								  })
	
	$(".xl").hover(function(){
							clearTimeout(timer2);
							},function(){
								timer2=setTimeout(function(){
							  	$(".xl").hide();
							  },4000)
								})
	$(".kuai").eq(1).css("background","#e2d5b7")
	$(".kuai").eq(2).css("background","#e2d5b7")
	$(".footer1 a:first").css("background","none")
	$(".nav2").click(function(){
							  		$(".xl2").show();
								timer3=setTimeout(function(){
							  	$(".xl2").hide();
							  },4000)
							  })
	$(".xl2").hover(function(){
							clearTimeout(timer3);
							},function(){
								timer3=setTimeout(function(){
							  	$(".xl2").hide();
							  },4000)
								})
	$(".kuai1").each(function(){
							  if(($(this).index()+1)%2==1)
							  {
								  $(this).css("margin-left","0px")
								  }
								  $(this).hover(function(){
														 $(this).children(".btm").stop(true,true).slideDown();
														 $(this).find("img").css("border","solid 3px #ddcfbc")
														 },function(){
															  $(this).children(".btm").stop(true,true).slideUp();
															  $(this).find("img").css("border","solid 3px #f1f1f1")
															 })
							  })
}) 