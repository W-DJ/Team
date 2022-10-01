<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
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
	<form action="/Member/MemberDel_Proc.jsp">
	 <fieldset>
	 <legend>비밀번호 확인</legend>
	  비밀번호<input type="password">
	  <button>전송</button>
	 </fieldset>
	 </form>
	</div>
	<!--div#wrap-->
  </body>
</html>