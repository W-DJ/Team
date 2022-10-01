<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/err/errorProc.jsp"%>


<%@ page import="pack_ProdBoard.ProdBoardBean" %>
<jsp:useBean id="objBoard" class="pack_ProdBoard.ProdBoardMgr"  scope="page" />
<%
request.setCharacterEncoding("UTF-8");

String uId_Session = (String)session.getAttribute("uId_Session"); 
String aId_Session = (String)session.getAttribute("aId_Session"); 

int numParam = Integer.parseInt(request.getParameter("num"));

// 검색어 수신 시작
String keyField = request.getParameter("keyField");
String keyWord = request.getParameter("keyWord");
// 검색어 수신 끝

// 현재 페이지 돌아가기 소스 시작
String nowPage = request.getParameter("nowPage");
// 현재 페이지 돌아가기 소스 끝

objBoard.upCount(numParam);    // 조회수 증가
ProdBoardBean bean = objBoard.getBoard(numParam);   
//  List.jsp에서 클릭한 게시글의 매개변수로 전달된 글번호의 데이터 가져오기
     
int num =  bean.getNum();
String pName = bean.getpName();
String pType = bean.getpType();
int stockVolumn=bean.getStockVolumn();		/*stockVolumn: 재고*/
int salesVolumn=bean.getSalesVolumn();			/*salesVolumn : 판매량*/
int oriPrice=bean.getOriPrice();				/*oriPrice 원래 가격*/
int sellPrice=bean.getSellPrice();				/*sellPrice 실제 판매 가격*/
String [] sellLabel=bean.getSellLabel();		/*sellLabel : BEST, NEW, SALE, NONE*/
String content=bean.getContent();			
String regDate=bean.getRegDate();
int readCnt=bean.getReadCnt();					/*count : 조회수*/
String oriFileName=bean.getOriFileName();
String sysFileName=bean.getSysFileName();
int fileSize=bean.getFileSize();

double discountRate = 100-(double)sellPrice/oriPrice*100;

String discountDisplay = "";
if(oriPrice==sellPrice) {
	discountDisplay="none";
} else {
	discountDisplay="inline-block";
}

String [] sellLabelDisplay = new String [4];
for(int j =0; j <sellLabel.length; j ++) {
	if(sellLabel[j].equals("1")) {
		sellLabelDisplay[j] = "inline";
	} else if(sellLabel[j].equals("0")){
		sellLabelDisplay[j] = "none";
	}
}

session.setAttribute("bean", bean);
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
		<div id="wrap" class="prodReadWrap">
			<div id="prodMain" class="dFlex">
				<div id="prodPhoto">
					<img src="/fileUpload/<%=sysFileName %>" alt="제품 이미지" width=500 height=500>
				</div>
				
				<div id="prodInfoMain">
					<div id="pType">
						<%=pType %>
					</div>

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

					<div>
						<span>수량</span>
						<button type="button" id="volumnDownBtn">-</button>
						<span id="orderVolumn">1</span>
						<button type="button" id="volumnUpBtn">+</button>
						<input type="hidden" id ="stockVolumn" value="<%=stockVolumn%>">
						<!-- 버튼을 누르면 span안에 있는 숫자가 바뀌는 js구현해야. 1 밑으로는 내려가거나 재고를 초과하지는 않도록 -->
					</div>
					<div>
						<button type="button">찜</button>
						<button type="button">장바구니 담기</button>
					</div>
					<% if(aId_Session!=null) {%>
					<div>
						<button type="button" id="modBtn">수 정</button>
						<button type="button" id="delBtn">삭 제</button>
					</div>
					<% } %>
				</div>
			</div>
			<div id="prodArticle">
				<div id="articleBtnArea">
					<button type="button" id="contentBtn">상품설명</button>
					<button type="button" id="reviewBtn">후기</button>
					<!-- 버튼을 누르면 div#content와 review의 display 속성값이 바뀌도록 js구현해야-->
				</div>
				<div id="content">
					<%=content %>
				</div>
				<div id="review">
					<iframe src="" style="display: none"></iframe>
				</div>
			</div>

			<input type="hidden" name="nowPage" value="<%=nowPage%>" id="nowPage"> 
			<input type="hidden" name="num" value="<%=num%>" id="num">
	
			<!-- 검색어전송 시작 -->
			<input type="hidden" id="pKeyField" value="<%=keyField%>"> 
			<input type="hidden" id="pKeyWord" value="<%=keyWord%>">
			<!-- 검색어전송 끝 -->

		</div>
		<!--div#wrap  -->
	</body>
</html>
