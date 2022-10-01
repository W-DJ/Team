<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush = "true"%>
<% 
String aId_Session = (String)session.getAttribute("aId_Session");  

%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/style/style.css">
		<link rel="shortcut icon" href="#">
		<script src="https://ajax.googleapis.com/sjax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script src="/script/script_Product.js"></script>
	</head>
	<body>
		<div id="wrap">
			<form action="/product/prodPostProc.jsp" method="post" enctype="multipart/form-data">
				<table id="prodPostTbl">
					<tbody>
						<tr>
							<th>상품명</th>
							<td>
								<input type="text" name="pName" id="pName">
							</td>
						</tr>
						<tr>
							<th>상품종류</th>
							<td>
								<select name="pType" id="pType">
									<option value="">선택해주세요</option>     
									<!-- 선택해주세요를 선택하면 전송 못하도록  JavaScript로 구현하기-->
									<option>스킨케어</option>
									<option>로션</option>
									<option>핸드크림</option>
									<option>기타</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>재고</th>
							<td>
								<input type="number" name="stockVolumn" id="stockVolumn">
							</td>
						</tr>
						<tr>
							<th>가격</th>
							<td>
								<label>
									원래 가격
									<input type="number" name="oriPrice" id="oriPrice">
								</label>
								<label>
									판매 가격
									<input type="number" name="sellPrice" id="sellPrice">
								</label>
							</td>
						</tr>
						<tr>
							<th>상품라벨</th>
							<td>
								<label>
									베스트상품
									<input type="checkbox" name="sellLabel" class="sellLabel" value="BEST">	
								</label>
								<label>
									신상품
									<input type="checkbox" name="sellLabel" class="sellLabel" value="NEW">	
								</label>
								<label>
									할인상품
									<input type="checkbox" name="sellLabel" class="sellLabel" value="SALE">	
								</label>
								<label>
									해당없음
									<input type="checkbox" name="sellLabel" class="sellLabel" value="NONE">	  
									<!--해당없음 누르면 다른 것을 중복 선택 못하도록 JavaScript로 구현하기 -->
								</label>
							</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<textarea name="content" id="content" cols="30" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<th>이미지</th>
							<td>
								<input type="file" name="imgFile" id="imgFile">
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td>
								<input type="hidden" name="regId" value="<%=aId_Session%>">
								<button type="submit">전송</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
		</div>
		<!--div#wrap  -->
	</body>
</html>
