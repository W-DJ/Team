<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
<% String uId_Session = (String)session.getAttribute("uId_Session"); 
String aId_Session = (String)session.getAttribute("aId_Session");  %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	  <meta charset="UTF-8">
	  <title>Insert title here</title>
	  <link rel="stylesheet" href="/style/style.css">
	  <link rel="shorcut icon" href="#">
	  <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	  <script src="/script/script_Member.js"></script>
	</head>
  <body>
	<div id="wrap">
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
	<% } %>
	</div>
	<!--div#wrap-->
  </body>
</html>