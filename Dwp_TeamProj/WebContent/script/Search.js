$(function(){
	$("input.input").onmouseout(function(){
		$(this).val("").blur();
	});
	
	

	
	
	
});

	function fnJoin(){
	 window.opener.location.href="/Member/Join.jsp";
	 
	};
	 window.close();
	
		function fnLogin(){
	 window.open('/Member/Login.jsp');
	};
	
		function fnMypage(){
	 window.open("/Member/MyPage.jsp");
	};
	
		function fnInquire(){
	 window.open('/bbs_Inquire/list.jsp');
	};
	
		function fnProd(){
	 window.open("/product/prodList.jsp");
	};
	
