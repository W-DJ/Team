<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
<% String uId_Session = (String)session.getAttribute("uId_Session"); 
String aId_Session = (String)session.getAttribute("aId_Session");  %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	  <meta charset="UTF-8">
	  <title>Insert title here</title>
	  <link rel="stylesheet" href="/style/Mypage.css">
	  <link rel="shorcut icon" href="#">
	  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  <script src="/script/script_Member.js"></script>
	</head>
  <body>
	<div id="wrap">
	<iframe src="/indd/header.jsp" scrolling="no" width="100%" frameborder=0></iframe>
	<% if(uId_Session!=null) { %>
	<ul>
	 <li><a href="/Member/MemberMod.jsp">회원정보수정</a></li>
	 <li><a href="/Member/MemberDel.jsp">회원탈퇴</a></li>
	 <li><a href="">장바구니</a></li>
	 <li><a href="">찜</a></li>
	 <li><a href="">주문현황</a></li>
	</ul>
	<% } else if (aId_Session!=null) { %>
	<ul>
	 <li><a href="/Member/MemList.jsp">회원목록/수정/삭제</a></li>
	 <li><a href="">회원주문현황/수정/삭제</a></li>
	</ul>
	<%}else{%>
	<div id="MyPageArea">
	<div id="LoginView">
		    <p>로그인 후에 이용이 가능합니다</p>
    <fieldset>
     <legend>로그인</legend>
     아이디<input type="text" name="uId" id="uId" /><br><br>
     비밀번호<input type="password" name="uPw" id="uPw" />
     </fieldset>
     <button>로그인하기</button>
     </div>
     <!-- div#LoginView -->
     </div>
     <!-- div#MyPageArea -->
	<%}%>
	<iframe src="/indd/footer.jsp" scrolling="no" width="100%" frameborder=0></iframe>
	</div>
	<!--div#wrap-->
  </body>
</html>