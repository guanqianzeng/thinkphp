// JavaScript Document
$(function(){
		   $(".splb a").each(function(){
									  if(($(this).index()+1)%4==1)
									  {
										  $(this).css("margin-left","0px")
										  }
									  })
		   $(".k1").each(function(){
									  if(($(this).index()+1)%4==1)
									  {
										  $(this).css("margin-left","0px")
										  }
									  })
		   $(".js").css("margin-left",($(window).width()-1440)/2+"px")
		   $(".js2").css("margin-left",($(window).width()-1440)/2+"px")
		  $(".kuai").hover(function(){
										$(this).css("background","#e2d5b7")
									},function(){
												$(this).css("background","#eee8cb")
										})
		    $(".kuai2").each(function(){
									  if(($(this).index()+1)%3==1)
									  {
										  $(this).css("margin-left","0px")
										  }
										  $(this).hover(function(){
																 $(this).addClass("xz");
																 $(this).children(".k2btm").stop(true,true).slideDown();
																 },function(){
																 $(this).removeClass("xz");
																 $(this).children(".k2btm").stop(true,true).slideUp();	
																	 })
									  })
			$(".nav3cc").width($(".nav3cc").children("a").size()*100)
			
			var intS=100;
			var intT=100;
			$(".nav3l").click(function(){
									  var intC= $(".nav3cc a.xz").index();
									   var intA=parseInt($(".nav3cc").css("margin-left"));
									   if(intA==0){}
										else{
											$(".nav3cc").animate({marginLeft:intA+intS},intT)
										
										   }
									   	
									   })
			$(".nav3r").click(function(){
									   var intC= $(".nav3cc a.xz").index();
									   if($(".nav3cc a").size()<10){}
									   else{
									   
									   	var intA=parseInt($(".nav3cc").css("margin-left"));
									   	if(intA==-(parseInt($(".nav3cc").width())-(9*100))){}
										else{
												
											$(".nav3cc").animate({marginLeft:intA-intS},intT)
											}
											}
									   })
		   })