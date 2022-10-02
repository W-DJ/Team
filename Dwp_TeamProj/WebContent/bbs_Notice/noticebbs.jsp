<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
    
    <%@ page import="pack_BBS.BoardBean" %>
    <%@ page import="java.util.*" %>
    
    <jsp:useBean id="NoticeList" class="pack_BBS.BoardMgr" scope="page" />
    
    <%
    request.setCharacterEncoding("UTF-8");
    
    int totalRecord = 0;        // 전체 데이터 수(DB에 저장된 row 개수)
    int numPerPage = 5;    // 페이지당 출력하는 데이터 수(=게시글 숫자)
    int pagePerBlock = 5;   // 블럭당 표시되는 페이지 수의 개수
    int totalPage = 0;           // 전체 페이지 수
    int totalBlock = 0;          // 전체 블록수
    
    
    int nowPage = 1;          // 현재 (사용자가 보고 있는) 페이지 번호
    int nowBlock = 1;         // 현재 (사용자가 보고 있는) 블럭

    int start = 0;     // DB에서 데이터를 불러올 때 시작하는 인덱스 번호
    int end = 5;     
    
    int listSize = 0;   
    Vector <BoardBean> vList = NoticeList.getBoardList(start, end);
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="shortcut icon" href="#">
	<link rel="stylesheet" href="/style/style_BBS.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/script/script_Inquire.js"></script>
</head>
<body>
    <div id="wrap">
		
		<main id="main" class="dFlex">
		
		<div id="contents" class=bbsList>
		
		
			<div id="pageInfo" class="dFlex">
				<%
				
				listSize = vList.size();
				
				%>
				
				
				<span>전체게시글 : <%=listSize %></span>
				<span>페이지 : <%=nowPage %></span>
			
			
			</div>
		
		<table id="boardList">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>		
					<tr>
						<td colspan="5" class="spaceTd"></td>
					</tr>		
				</thead>
				<tbody>
				
				
				
				<% 
				for (int i=0; i<listSize; i++) {		
					
					if(i==listSize) break;
					
					BoardBean bean = vList.get(i);
			
				%>
			
		
				
					<tr class="listTr" onclick="modify('<%=bean.getNum()%>','<%=nowPage%>')">
					
					
						<td><%=bean.getNum() %></td>
						<td><%=bean.getaName() %></td>
						<td><%=bean.getAsubject() %></td>
						<td><%=bean.getRegTM() %></td>
						<td><%=bean.getReadCnt() %></td>
					</tr>
				<% } %>
				</form>
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
										size="20" maxlength="30" value="">
									
									
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
