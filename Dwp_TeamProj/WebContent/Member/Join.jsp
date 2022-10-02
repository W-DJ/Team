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
	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	  <script src="/script/script_Member.js"></script>
	  <script src ="/script/ApiScript.js"></script>
	</head>
  <body>
	<div id="wrap">
	<iframe src="/indd/header.jsp" scrolling="no" width="100%" frameborder=0></iframe>
	   <div id="container">
	   	<div id="title">회원가입</div>
	    <span>필수입력사항</span>
	<form action="/Member/Join_Proc.jsp" id="joinFrm">
	     <table>
	     <tbody>
	     <tr><th class="req">아이디</th>
	 <td>
	 <input type="text" placeholder="아이디를 입력해주세요"
	 name="uId" id="uId">
	 <span><button>중복확인</button></span>
	 </td>
	     </tr>
	     <tr>
	     <th class="req">비밀번호</th>
	     <td><input type="password" placeholder="비밀번호를 입력해주세요"
	     name="uPw" id="uPw"></td>
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
	     <td><input type="text" placeholder="이름을 입력해주세요"
	     name="uName" id="uName"></td>
	     </tr>
	     <tr>
	     <th class="req">이메일</th>
	     <td>
	     <input type="text" id="uEmail1">
	     <span>@</span>
	     <input type="text" id="uEmail2">
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
	     <td><input type="text" placeholder="숫자만 입력해주세요"
	     name="uPhone" id="uPhone"></td>
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
	     <input type="radio" name="uGender" value="1">남자
	     <input type="radio" name="uGender" value="2">여자
	     <input type="radio" name="uGender" value="3">선택안함      
	     </td>
	     </tr>
	     <tr>
	     <th>생년월일</th>
	     <td><input type="text" placeholder="YYYY / MM / DD"
	      name= "uBirth"></td>
	     </tr>
	     <tr>
	     <th>추가입력사항</th>
	     <td>
	     <label>추천인 아이디<input type="text" name="recoPerson"></label>
	     </td>
	     </tr>
	     <tr>
	     <th>이용약관</th>
	     <td>
	     
	     <div class="joinAgree">
	     
	     <div id="chkAllArea">
	     <input type="checkbox" id="chkAll">전체동의합니다.
         </div>
         <!-- div#chkAll 끝 -->
         
          <div class="licenseArea">
         
         <div class="termArea">
	     <input type="checkbox"
	     class="useAgree">이용약관 동의<span>(필수)</span>
          </div>
          
          <div class="termArea">
	     <input type="checkbox"
	     class="useAgree">개인정보 수집 · 이용동의<span>(필수)</span>
	   </div>

         <div class="termArea">
	      <input type="checkbox" class="useAgree" id="chkAll2">
	      무료배송, 할인쿠폰 등 혜택/정보 수신 동의<span>(선택)</span>
	     </div>
	     
	     <div class="termArea">
	     <input type="checkbox" class="useAgree socialAgree">SMS
	     <input type="checkbox" class="useAgree socialAgree">이메일 
         </div>
         
         <div class="termArea">
	     <input type="checkbox" class="useAgree">본인은 만14세이상입니다<span>(필수)</span>
          </div>
	      
	      </div>
	      <!-- div#licenseArea -->
	      </div>
	      <!-- div#joinAgree 끝 -->
	      </td>
	      </tr>
	      <tr>
	     <td><button type="button" id="joinBtn">가입하기</button></td>
	     </tr>
	     </tbody>
	     </table>
	     </form>
	   </div>
	   <!-- div#container 끝-->
	   <iframe src="/indd/footer.jsp" scrolling="no" width="100%" frameborder=0></iframe>
	</div>
	<!--div#wrap 끝 -->
  </body>
</html>