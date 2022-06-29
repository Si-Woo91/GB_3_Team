<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 페이지 전체 넓이 설정 */
* { /* 전체 초기화 */
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'GowunDodum-Regular';
}

@font-face { /* 폰트 설정 (회의후 변경예정) */
	font-family: 'GowunDodum-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'GowunBatang-Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}



li {
	list-style: none;
}

a {
	text-decoration: none;
}

body {
	margin: 0 auto;
}




/* body(전체) 넓이 및 가운데 정렬(마진) */
#wrap {
	width: 800px;
	margin: 0 auto;
}

/* menu1 박스 css */
.menu1 {
	width: 100%;
	height: 30px;
	border-bottom: 3px solid #E3E3E3;
}

/* menu1 li css */
.menu1 li {
	float: right;
	list-style: none;
	letter-spacing: 3px;
	/* 	li태그간 띄움 거리 */
	margin-left: 10px;
}

/* a태그 텍스트 css */
.menu1 a {
	text-decoration: none;
	color: #92B1F0;
}

.ad-menu {
	width: 100%;
	height: 200px;
}

.ad-menu li {
	list-style: none;
	margin-top: 20px;
	font-size: 17px;
}

.ad-menu a {
	color: #92B1F0;
	text-decoration: none;
	padding-left: 10px;
}



</style>
</head>
<body>
	<!-- 전체 포장지 -->
	<div id="wrap">
		<br>
		<h3>관리자 페이지</h3>
		<div class="menu1">
			<ul>
				<li><a href="#">일반 화면</a></li>
				<li><a href="#">로그아웃</a></li>	<!-- main으로 이동후 '관리자계정이 로그아웃되었습니다' 라는 경고창 출력 -->
			</ul>
		</div>
		<br>
		<div class="ad-menu">
			<ul>
				<li><a href="${pageContext.request.contextPath}/admin/Goodslist.spm">상품 관리</a>
				<li><a href="#">회원 목록</a>
			</ul>
		</div>
	</div>
	

</body>
</html>