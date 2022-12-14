<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" autoFlush="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>문의페이지</title>
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
		
			<div id="select_buy_period" class="dFlex">
				
				<p>구매기간</p>
				<ul id="select_month" class="dFlex">
					<li><button>1개월</button></li>
					<li><button>3개월</button></li>
					<li><button>6개월</button></li>
					<li><button>12개월</button></li>
				</ul>
				
				<div id="select_range">
				
					<select name="" id="">
						<option value="2022">2022</option>
						<option value="2021">2021</option>
					</select>
					<label>년</label>
					
					<select name="" id="start_month">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select><label for="">월</label>
					
					<select name="" id="start_date">
						<option value="01">1</option>
						<option value="02">2</option>
						<option value="03">3</option>
						<option value="04">4</option>
						<option value="05">5</option>
						<option value="06">6</option>
						<option value="07">7</option>
						<option value="08">8</option>
						<option value="09">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
						<option value="13">13</option>
						<option value="14">14</option>
						<option value="15">15</option>
						<option value="16">16</option>
						<option value="17">17</option>
						<option value="18">18</option>
						<option value="19">19</option>
						<option value="20">20</option>
						<option value="21">21</option>
						<option value="22">22</option>
						<option value="23">23</option>
						<option value="24">24</option>
						<option value="25">25</option>
						<option value="26">26</option>
						<option value="27">27</option>
						<option value="28">28</option>
						<option value="29">29</option>
						<option value="30">30</option>
						<option value="31">31</option>
					</select><label for="">일</label>
				
				
				
				
				</div>
			</div>
		<!-- 내가 올린 문의글 -->
		<!-- 회원 정보 DB에 내가 올린 문의글 컬럼도 있어야함. -->
		<button type="button" id="inqBtn" onclick="location.href='/bbs_Inquire/write.jsp'">문의하기</button>
		
		
		</div>
		
		
		
		</main>
    </div>
    <!-- div#wrap  -->
</body>
</html>
