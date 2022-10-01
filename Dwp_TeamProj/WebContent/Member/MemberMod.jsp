<%@page import="pack_Member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
<%
String uId_Session = (String)session.getAttribute("uId_Session");
%>    
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />

<%
MemberBean objMB  = mMgr.modifyMember(uId_Session);
String uEmail = objMB.getuEmail();
int idx = uEmail.indexOf("@");

String uEmail1 = uEmail.substring(0, idx);

String uEmail2 = uEmail.substring(idx+1);

%>    

  
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
	   <div id="container">
	<form action="/Member/MemberModProc.jsp" id="ModFrm">
	     <table>
	     <tbody>
	     <tr><th class="req">아이디</th>
	 <td>
	 <%= objMB.getuId() %>
	 <input type="hidden" name="uId" value="<%= uId_Session %>">
	 </td>
	     </tr>
	     <tr>
	     <th class="req">비밀번호</th>
	     <td><input type="password" name="uPw" id="uPw"></td>
	     </tr>
	     <tr>
	     <th>비빌번호 확인</th>
	     <td>
	     <input type="password">
	     <span id="pwChk"></span>
	     </td>
	     </tr>
	     <tr>
	     <th class="req">이름</th>
	     <td><%=objMB.getuName()%></td>
	     </tr>
	     <tr>
	     <th class="req">이메일</th>
	     <td>
	     <input type="text" id="uEmail1" value = "<%=uEmail1%>" >
	     <span>@</span>
	     <input type="text" id="uEmail2" value = "<%=uEmail2%>">
 	     <select id="valSel">
	     	<option value="">직접입력</option>
	     	<option>naver.com</option>
	     	<option>daum.net</option>
	     	<option>google.co.kr</option>
	     </select>
	     <input type="hidden" id="uEmail" name="uEmail">
	     </td>
	     </tr>
	     <tr>
	     <th class="req">휴대폰</th>
	     <td><input type="text" name="uPhone" id="uPhone" value="<%=objMB.getuPhone() %>"></td>
	     </tr>
	     <tr>
	     <th class="req">우편번호</th>
	     <td>
	     <input type="text" id="postcode" placeholder="우편번호">
         <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
	     </td>
	     </tr>
	     <tr>
	     <th class="req">주소</th>
	     <td>
         <input type="text" id="address" placeholder="주소"><br>
         </td>
         </tr>
         <tr>
         <th class="req">상세주소</th>
         <td>
         <input type="text" id="detailAddress" placeholder="상세주소">
         </td>
         </tr>
         <tr>
         <th class="req">참고항목</th>
         <td>
         <input type="text" id="extraAddress" placeholder="참고항목">
         <input type="hidden" name="uAddr" id="uAddr" />
         </td>
         </tr>
	     <tr>
	     <th class="req">성별</th>
	     <td>
	     <%
	     int gender = objMB.getuGender();
	     String chkMale = "";
	     String chkFemale = "";
	     String chkNone ="";
	     if(gender==1){
	    	chkMale = "checked"; 
	     }else if(gender ==2){
	    	 chkFemale = "checked";
	     }else{
	        chkNone = "checked";
	     }
	     %>
	     <input type="radio" name="uGender" value="1"
	     <%=chkMale%>>남자
	     <input type="radio" name="uGender" value="2"
	     <%=chkFemale%>>여자
	     <input type="radio" name="uGender" value="3"
	     <%=chkNone%>>선택안함      
	     </td>
	     </tr>
	     <tr>
	     <th>생년월일</th>
	     <td><input type="text" placeholder="YYYY / MM / DD"
	      name= "uBirth" value ="<%=objMB.getuBirth()%>"></td>
	     </tr>
	      <tr>
	     <td>
	     <button id="modBtn">수정하기</button>
	     <button type="reset">다시쓰기</button>
	     <button type="button">탈퇴하기</button>
	     </td>
	     </tr>
	     </tbody>
	     </table>
	     </form>
	   </div>
	   <!-- div#container 끝-->
	</div>
	<!--div#wrap 끝 -->
  </body>
</html>