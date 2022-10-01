<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="/A_teamProject/style/style_Common.css">
	<link rel="stylesheet" href="/A_teamProject/style/style_Template.css">
	<link rel="stylesheet" href="/A_teamProject/style/style_BBS.css">
<script src="/A_teamProject/source/jquery-3.6.0.min.js"></script>
	<script src="/A_teamProject/script/script_BBS.js"></script>
</head>
<body>
    <div id="wrap">
		
		<main id="main" class="dFlex">
		
		<div id="contents" class=bbsList>
		
		
			<div id="pageInfo" class="dFlex">
			
				<span>전체게시글 : 0 개 </span>
				<span>페이지 : 1페이지</span>
			
			
			</div>
		
		
		<table id="boardList">
				<thead>
					<tr>
						<th>번호(num)</th>
						<th>제목(subject)</th>
						<th>이름(uid)</th>
						<th>날짜(date)</th>
						<th>조회수(readCnt)</th>
					</tr>		
					<tr>
						<td colspan="5" class="spaceTd"></td>
					</tr>		
				</thead>
				<tbody>
					<tr>
						<td>num</td>
						<td>subject</td>
						<td>uid</td>
						<td>date</td>
						<td>readCnt</td>
					</tr>
				
				</tbody>
				<tfoot>
				
					<tr id="listBtnArea">
						<td colspan="2">
						<!-- if 회원이 아니라면, loginAlertBtn 눌렀을 때 알림창이 떠야함 -->
							<button type="button" id="loginAlertBtn" class="listBtnStyle">글쓰기</button>
							<!-- 회원인 경우 페이지 이동  -->
							<button type="button" id="NoticeWriteBtn" class="listBtnStyle">글쓰기</button>
						</td>
					
						<td colspan="3">
						
								
							<form name="searchFrm" 
											id="searchFrm">
							 		
							 	
									<div id="keySelect" >
										<select name="keyField" id="keyField">
												<option value="subject">제 목</option>
												<option value="uid">이 름</option>
												<option value="content">내 용</option>
										</select>
									</div>			
									<div id="keyWordInput" >
										<input type="text" name="keyWord" id="keyWord"
										size="20" maxlength="30" value="안녕">
									
									
									</div>	
									
									<div>
											<button type="button" id="searchBtn" class="listBtnStyle">검색</button>
									</div>	
											
											
							</form>
						
						
							<!-- 검색결과 유지용 매개변수 데이터시작 -->
							<input type="hidden" id="pKeyField" value="">
							<input type="hidden" id="pKeyWord" value="">
							<!-- 검색결과 유지용 매개변수 데이터끝 -->

						</td>
	
					</tr>
					
					<tr id="listPagingArea">
						<td colspan="5" id="pagingTd">
							<span class="moveBlockArea">1</span>
							<span>/</span>
							<span>5</span>
						</td>
					</tr>

				</tfoot>	
			</table>	
				

		</div>
		
		
		
		</main>
    </div>
    <!-- div#wrap  -->
</body>
</html>
