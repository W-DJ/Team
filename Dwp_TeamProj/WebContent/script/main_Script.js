$(function() {
setInterval(fnSlide, 7000);
	
	
	function fnSlide() {
		
		$("#slideFrame").animate(
		{"margin-left": "-1200px"},
		2000,
		function(){
			// div#slideFrame 하위의 첫 번째 a요소를
			// 마지막 a요소 다음으로 이동하세요.
			$("#slideFrame a:first-child")
					.insertAfter("#slideFrame a:last-child");
			// #slideFrame의 margin-left를 원위치. margin-left: 0;
			$("#slideFrame").css({"margin-left": "0"});
		});
	
	$(window).scroll(function(){
                let topPos = $(this).scrollTop();
                if(topPos > 50){
                    $("#topBtnArea").fadeIn(1000);
            }else{
                $("#topBtnArea").fadeOut(1000);
            }
        });
        $("div#topBtnArea").click(function(){
            $(window).scrollTop(0);
        })
	
	}
	});