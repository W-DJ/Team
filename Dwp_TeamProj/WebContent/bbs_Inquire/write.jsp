<%@page import="pack_Member.MemberBean"%>
<%@page import="pack_BBS.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<%
	String uId_Session = (String)session.getAttribute("uId_Session"); 
	String aId_Session = (String)session.getAttribute("aId_Session");
%>
<jsp:useBean id="lMgr" class="pack_BBS.BoardMgr" />
<jsp:useBean id="mMgr" class="pack_Member.MemberMgr" />
<%
MemberBean objMB  = mMgr.modifyMember(uId_Session);
String uName = objMB.getuName();


%>    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/script/script_Inquire"></script>
</head>
<body>
	<div id="wrap">

		<form 
		action="/bbs_Inquire/writeProc.jsp"
		method="post" enctype="multipart/form-data"
			>
						  
			
			<header id="header">
				<h1>LOGO</h1>
				<ul>
					<li>제품 구매</li>
					<li>브랜드 스토리</li>
					<li>고객 센터</li>
					<li>브랜드 PR</li>
					<li>비회원 서비스</li>
				</ul>
			</header>
			<main id="main">
				<table>
					<caption>QnA board</caption>
					<tbody>
						<tr>
							<td>이름</td>
							<td>
								<%=uName %>
								<input type="hidden" name="uid" value="<%=uId_Session%>">
								<input type="hidden" name="uName" value="<%=uName %>">					
							</td>
							
						</tr>
	
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name="subject" id="subject">
							</td>
						</tr>
						<tr>
							<td>연락처</td>
							<td>
								<input type="text" name="uPhone1" class="uPhone">
								<input type="text" name="uPhone2" class="uPhone">
								<input type="text" name="uPhone3" class="uPhone">
								
							</td>
						</tr>
							
							
						<tr>
							<td colspan="2">
								<select name="qnaType" id="qnaType">
								
									<option value="">문의유형</option>
									<option value="angry">취소/반품/교환</option>
									<option value="order">주문/결제</option>
									<option value="event">이벤트</option>
									<option value="etc">기타</option>
								</select>
							</td>

						</tr>
						<tr>
							<td>사진첨부</td>
							<td><input type="file" name="upFileName"></td>
						</tr>

					</tbody>

				</table>
				<hr>
					
				내용<textarea name="content" id="content" rows="10"></textarea>
			<hr>

			</main>
			<aside id="aside" class="dFlex">
				<span>비밀번호 4자리</span> 
				
				<input type="password" name="bbsPw" id="bbsPw">
				<div id="submitBtn">
					<button type="submit" id="regBtn">작성완료</button>
					<button type="reset" id="reset">취소</button>
				</div>
			</aside>

			<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
			

		</form>

	</div>
	<!-- div#wrap  -->
</body>
</html>
