<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel = "stylesheet" href="/style/style.css">
	<link rel = "shortcyt icon" href="#">
	<script src ="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src ="/script/script_Member.js"></script>
</head>
<body>
	<div id="wrap">
	 
     <form action="/Member/Login_Proc.jsp">
     <fieldset>
     <legend>로그인</legend>
     아이디<input type="text" name="uId" id="uId" /><br><br>
     비밀번호<input type="password" name="uPw" id="uPw" />
     </fieldset>
     <button>로그인하기</button>
     </form>
	</div>
</body>
</html>