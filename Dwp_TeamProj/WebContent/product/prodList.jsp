<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="pack_ProdBoard.ProdBoardBean" %>
<jsp:useBean id="objBoard" class="pack_ProdBoard.ProdBoardMgr" />

<%
request.setCharacterEncoding("UTF-8");

String uId_Session = (String)session.getAttribute("uId_Session"); 
String aId_Session = (String)session.getAttribute("aId_Session"); 

///////////////////////페이징 관련 속성 값 시작///////////////////////////
// 페이징(Paging) = 페이지 나누기를 의미함
int totalRecord = 0;        // 전체 데이터 수(DB에 저장된 row 개수)
int numPerPage = 1;    // 페이지당 출력하는 데이터 수(=게시글 숫자)
int pagePerBlock = 2;   // 블럭당 표시되는 페이지 수의 개수
int totalPage = 0;           // 전체 페이지 수
int totalBlock = 0;          // 전체 블록수

 /*  페이징 변수값의 이해 
totalRecord=> 200     전체레코드
numPerPage => 10
pagePerBlock => 5
totalPage => 20
totalBlock => 4  (20/5 => 4)
*/

int nowPage = 1;          // 현재 (사용자가 보고 있는) 페이지 번호
int nowBlock = 1;         // 현재 (사용자가 보고 있는) 블럭

int start = 0;     // DB에서 데이터를 불러올 때 시작하는 인덱스 번호
int end = 1;     // 시작하는 인덱스 번호부터 반환하는(=출력하는) 데이터 개수 
                          // select * from T/N where... order by ... limit start, end;

int listSize = 0;    // 1페이지에서 보여주는 데이터 수
						//출력할 데이터의 개수 = 데이터 1개는 가로줄 1개

// 게시판 검색 관련소스
String keyField = ""; // DB의 컬럼명
String keyWord = ""; // DB의 검색어
						
if (request.getParameter("keyWord") != null) {
	keyField = request.getParameter("keyField");
	keyWord = request.getParameter("keyWord");
}


						
if (request.getParameter("nowPage") != null) {
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	start = (nowPage * numPerPage) - numPerPage;
	end = numPerPage;            
}



/*
 select * from tblBoard order by num desc limit 10, 10;
데이터가 100개   =>   num :  100  99   98    97 ... 91 |  90        1
                       start, end :   0    1    2     3....   9      10
페이지당 출력할 데이터 수 10개
현재 페이지 1페이지라면    => 1페이지의 출력결과   100 ~ 91
2페이지   90~81
3페이지    80~71
*/

totalRecord = objBoard.getTotalCount(keyField, keyWord);   
// 전체 데이터 수 반환

totalPage = (int)Math.ceil((double)totalRecord/numPerPage);
nowBlock = (int)Math.ceil((double)nowPage/pagePerBlock);
totalBlock = (int)Math.ceil((double)totalPage/pagePerBlock);

///////////////////////페이징 관련 속성 값 끝///////////////////////////

Vector<ProdBoardBean> vList = null;
%>   
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/style/style.css">
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Product.js"></script>
	</head>
	<body>
	<div id="wrap" class="prodListWrap">
		<%
				String prnType = "";
				if (keyWord.equals("null") || keyWord.equals("")) {
					prnType = "전체 게시글";
				} else {
					prnType = "검색 결과";
				}
			%>

		<div id="pageInfo" class="dFlex">
			<span><%=prnType %> : <%=totalRecord%> 개</span> <span>페이지 : <%=nowPage + " / " + totalPage%></span>
		</div>
		<ul id="prodBBS" class="dFlex">
			<%
			vList = objBoard.getBoardList(keyField, keyWord, start, end);  // DB에서 데이터 불러오기
			listSize = vList.size();			
			
				if (vList.isEmpty()) {
					// 데이터가 없을 경우 출력 시작
			%>

			<li><%="게시물이 없습니다." %></li>

			<%} else{   
				   	
				   	for(int i=0; i<numPerPage; i++) {
						if(i==listSize) break;
						
						ProdBoardBean bean = vList.get(i);
						
						int num = bean.getNum();
						String pName = bean.getpName();
						String sysFileName = bean.getSysFileName();
						int oriPrice = bean.getOriPrice();
						int sellPrice = bean.getSellPrice();
						double discountRate = 100-(double)sellPrice/oriPrice*100;
						
						String discountDisplay = "";
						if(oriPrice==sellPrice) {
							discountDisplay="none";
						} else {
							discountDisplay="inline-block";
						}
						String [] sellLabel = bean.getSellLabel();
						String [] sellLabelDisplay = new String [4];
						for(int j =0; j <sellLabel.length; j ++) {
							if(sellLabel[j].equals("1")) {
								sellLabelDisplay[j] = "inline-block";
							} else if(sellLabel[j].equals("0")){
								sellLabelDisplay[j] = "none";
							}
						}
						
				   	%>

			<li class="prod" onclick="read('<%=num%>', '<%=nowPage%>')">
				<div class="prodThum">
					<img src="/fileUpload/<%=sysFileName %>" alt="제품 썸네일" width="200"
						height="200">
				</div> 
				<div class="prodDetail" >
					<div class="label dFlex">					
						<div class="bestLabel" style="display: <%= sellLabelDisplay[0] %>">BEST</div>
						<div class="newLabel" style="display: <%= sellLabelDisplay[1] %>">NEW</div>
						<div class="saleLabel" style="display: <%= sellLabelDisplay[2] %>">SALE</div>
						&nbsp;
					</div>
					<div class="pName"><%=pName %></div>
					<div class="price dFlex">
						<div class="discRate" style="display:<%=discountDisplay%>"><%=(int)discountRate %>%</div> 
						<div class="sPrice"><%=sellPrice %></div> 
						<div class="oPrice" style="display:<%=discountDisplay%>"><%=oriPrice %></div>
					</div>
				</div>
			</li>
			<%} //for End
				   	
			   		} //if  End %>

		</ul>
		<div id="listBtnArea">
			<% if(aId_Session!=null) { %>			
			<button type="button" onclick="location.href='/product/prodPost.jsp'">글쓰기</button>
			<% } %>
			<form name="searchFrm" class="dFlex" id="searchFrm">
	
				<div>
					<select name="keyField" id="keyField">
						<option value="subject"
							<%if (keyField.equals("subject"))
										out.print("selected");%>>제목</option>
						<option value="uName"
							<%if (keyField.equals("uName"))
										out.print("selected");%>>이름</option>
						<option value="content"
							<%if (keyField.equals("content"))
										out.print("selected");%>>내용</option>
					</select>
				</div>
				<div>
					<input type="text" name="keyWord" id="keyWord" id="keyWord"
						size="20" maxlength="30" value="<%=keyWord%>">
				</div>
				<div>
					<button type="button" id="searchBtn" class="listBtnStyle">검색</button>
				</div>
	
			</form>
	
			<!-- 검색결과 유지용 매개변수 데이터시작 --> 
			<input type="hidden" id="pKeyField" value="<%=keyField%>"> 
			<input type="hidden" id="pKeyWord" value="<%=keyWord%>"> 
			<!-- 검색결과 유지용 매개변수 데이터끝 -->
		</div>

		<div id="listPagingArea">
						
					<!-- 페이징 시작 -->
				<%
				int pageStart = (nowBlock - 1) * pagePerBlock + 1;
				int pageEnd = (nowBlock < totalBlock) ? pageStart + pagePerBlock - 1 : totalPage;
		
				if (totalPage != 0) { //   전체 페이지가 0이 아니라면 = 게시글이 1개라도 있다면
				%>
					
					<% if (nowBlock>1) { 	   // 페이지 블럭이 2이상이면 => 2개이상의 블럭이 있어야 가능 %>
								<span class="moveBlockArea" onclick="moveLeftBlock('<%=nowBlock-1%>', '<%=pagePerBlock%>')">
								&lt; 
								</span>
					<% } else { %>
					            <span class="moveBlockArea" ></span>
					<% } %>
				
					<!-- 페이지 나누기용 페이지 번호 출력 시작  -->
					<% 
					             // 2        <     6                     
						for (   ; pageStart<=pageEnd; pageStart++) { %>
							<% if (pageStart == nowPage) {   // 현재 사용자가 보고 있는 페이지 %>
								<span class="nowPageNum"><%=pageStart %></span>
							<% } else {                              // 현재 사용자가 보고 있지 않은 페이지 %>
							 	<span class="pageNum" onclick="movePage('<%=pageStart %>')">
									<%=pageStart %>
							 	</span>					
							<% } // End If%>		 	
					<% }  // End For%>
					<!-- 페이지 나누기용 페이지 번호 출력 끝  -->	
					
				
				<% if (totalBlock>nowBlock) { // 다음 블럭이 남아 있다면  %>
							<span  class="moveBlockArea" onclick="moveRightBlock('<%=nowBlock+1%>', '<%=pagePerBlock%>')">
							&gt;
							</span>
			
				<% } else { %>
				            <span class="moveBlockArea"></span>
				<% } %>
				
					
					
				<%
				} else {
					out.print("<b>[1]</b>"); // End if
				}
				%>						
			</div>
			
		</div>
		<!--div#wrap  -->
	</body>
</html>
