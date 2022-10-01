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
    <form action="/Admin/Join_Proc.jsp">
	     <table>
	     <tbody>
	     <tr><th class="req">아이디</th>
	 <td>
	 <input type="text" placeholder="아이디를 입력해주세요"
	 name="aId" id="aId">
	 <span><button>중복확인</button></span>
	 </td>
	     </tr>
	     <tr>
	     <th class="req">비밀번호</th>
	     <td><input type="password" placeholder="비밀번호를 입력해주세요"
	     name="aPw" id="aPw"></td>
	     </tr>
	     <tr>
	     <th>비밀번호 확인</th>
	     <td>
	     <input type="password" placeholder ="비밀번호를 한번 더 입력해주세요">
	     <span id="pwChk"></span>
	     </td>
	     </tr>
	     <tr>
	     <th class="req">이름</th>
	     <td><input type="text" placeholder="이름을 입력해주세요"
	     name="aName" id="aName"></td>
	     </tr>
	     <tr>
	     <th class="req">이메일</th>
	     <td><input type="text" placeholder="marketkuly"
	     name="aEmail" id= "aEmail">
	     </td>
	     </tr>
	     <tr>
	     <th class="req">휴대폰</th>
	     <td><input type="text" placeholder="숫자만 입력해주세요"
	     name="aPhone" id="aPhone"></td>
	     </tr>
	      <tr>
	     <td><button>가입하기</button></td>
	     </tr>
	     </tbody>
	     </table>
	     </form>
	   </div>
	<!--div#wrap-->
  </body>
</html>