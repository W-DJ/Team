<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" autoFlush="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="shortcut icon" href="#">
<link rel="stylesheet" href="/style/style.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/script/script.js"></script>
</head>
<body>
	<div id="wrap">

		<form 
		action="/bbs_Notice/writeProc.jsp"
		method="post" enctype="multipart/form-data"
			>
						  
			
			<header id="header">
				<h1>LOGO</h1>
				<ul>
					<li>공지</li>
					<li>브랜드 스토리</li>
					<li>고객 센터</li>
					<li>브랜드 PR</li>
					<li>비회원 서비스</li>
				</ul>
			</header>
			
			<main id="main">
				<table>
					<caption>공지사항</caption>
					<tbody>
						<tr>
							
							<td>이름
							<input type="text" name="aName" id="aName"/>
							</td>
						</tr>
						<tr>
							<td>제목
							<input type="text" name="asubject" id="asubject">
							</td>
						</tr>
							
							

						<tr>
							<td>사진첨부<input type="file" name="aupFileName"></td>
							
						</tr>

					</tbody>

				</table>
				<hr>
				<div id="option">

					<select id="">
						<option value="">스타일</option>
					</select> 
					<select name="" id="">
						<option value="문단">문단</option>
					</select>
					<select name="" id="">
						<option value="글꼴">글꼴</option>
					</select>
					<select name="" id="">
						<option value="크기">크기</option>
					</select>
				</div>
					<textarea name="acontent" id="acontent" rows="10"></textarea>
			<hr>

			</main>
			<aside id="aside" class="dFlex">
			
			<div id="submitBtn">
				<button type="submit" id="NoticeBtn">작성완료</button>
				<button type="reset" id="reset">취소</button>
			</div>
		</aside>
			
			
			

		</form>

	</div>
	<!-- div#wrap  -->
</body>
</html>
