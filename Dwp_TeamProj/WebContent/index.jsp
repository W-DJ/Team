<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
<% String uId_Session = (String)session.getAttribute("uId_Session"); 
String aId_Session = (String)session.getAttribute("aId_Session");  %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	  <meta charset="UTF-8">
	  <title>Insert title here</title>
	  <link rel="stylesheet" href="/style/main_style.css">
	  <link rel="stylesheet" href="/style/indd.css">
	  <link rel="shorcut icon" href="#">
	  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  <script src="/script/main_Script.js"></script>
	</head>
  <body>
        <!--  헤더템플릿 시작, iframe으로 변경 -->
		<iframe src="/indd/header.jsp" scrolling="no" width="100%" frameborder=0></iframe>
    	<!--  헤더템플릿 끝 -->   
	<div id="wrap">
	 <div id="slideshowArea">
	                
	                <!-- 2. 슬라이드 프레임(= 틀) 3600 x 300 -->
	                <div id="slideFrame" class="dFlex">	                
	                
	                	<!-- 3. 이미지 요소를 포함하는 링크요소(a)  1200 x 300-->
	                	<a href="#">   <!--  -->
	                		<img src="/img/Fail_Event.png" alt="슬라이드1">
	                	</a>
	                	
	                	<a href="#">
	                		<img src="/img/launch-ing.png" alt="슬라이드2">
	                	</a>
	                	
	                	<a href="#">
	                		<img src="/img/SampleEvent.png" alt="슬라이드3">
	                	</a>
	                
	                </div>
	                <!-- div#slideFrame -->
	                
	            </div>
	            <!-- div#slideshowArea, 슬라이드 쇼 끝 -->
	            
	           <!--  상품템플릿 시작, iframe으로 변경 -->
	           <div id="GoodsArea">
	              <p>GoodSArea</p>
	           
	           </div> 
	            <!--  상품템플릿 시작, iframe으로 변경 -->
	            <iframe src="/indd/footer.jsp" scrolling="no" width="100%" frameborder=0></iframe>
	        <aside>
	        <div id="sideBar">
					<ul>
					<li><img src="/img/새벽.png" alt="" /></li>
					<li><a href="">고객센터</a></li>
					<li><a href="">마이페이지</a></li>
					<li><a href="">이벤트</a></li>
					</ul>
			</div>
			<div id="topBtnArea">&uarr;</div>
			</aside>
	</div>
	<!--div#wrap-->
  </body>
</html>