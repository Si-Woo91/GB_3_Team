<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼</title>
	<link rel="stylesheet" type="text/css" href="../css/main_css.css">
	<link rel="stylesheet" type="text/css" href="../css/slick.css">
	<link rel="stylesheet" type="text/css" href="../css/header.css">
	<link rel="stylesheet" type="text/css" href="../css/footer.css">
	<link rel="stylesheet" type="text/css" href="../css/minsu.css">
	<link rel="stylesheet" type="text/css" href="../css/common06.css">
	<link rel="stylesheet" type="text/css" href="../css/cart06.css">
	<link rel="stylesheet" type="text/css" href="../css/checkout06.css">
	<link rel="shortcut icon" href="../img/gushipsam_icon.ico">	
	<link rel="stylesheet" type="text/css" href="../css/Mypage.css">
	<link rel="stylesheet" type="text/css" href="../css/User-Info.css">
	<link rel="stylesheet" type="text/css" href="../css/User-InfoUp.css">
	<link rel="stylesheet" type="text/css" href="../css/OrderList-Page.css">
	<link rel="stylesheet" type="text/css" href="../css/secession.css">
</head>
<body>
	<c:set var="userID" value="${sessionScope.sessionId}" />

	<div>
		<!-- 로고 -->
		<div class="login_search">
			<a href="#"onclick="location.href='../main/main.jsp'" class= logo><img src= ../img/logo.png></a>
 			<!-- 로그인, 로그아웃, 장바구니, 고객센터 -->
 			<ul class = nav1>
						<li class="service"><a class="link" href= "../service/minsu1.sv">고객센터 </a></li>
						<li class= basket><a class="link" href= "${pageContext.request.contextPath }/payment/cart.pay">장바구니 </a></li>
				<c:choose>
					<c:when test="${sessionId eq null}">
						<li class= login>
							<a class="link" id="log_change" href="${pageContext.request.contextPath}/IDPW/login.jsp">로그인</a>
						</li>
					</c:when>
				<c:otherwise>
						<li class= login>
							<a class="link" href="${pageContext.request.contextPath}/lobby/mypage.spm">마이페이지</a>
						</li>
						<li class= login>
							${sessionId}님 환영합니다.&nbsp;&nbsp;&nbsp;
							<a class="link" href="#" onclick= "location.href='${pageContext.request.contextPath}/main/sessionInitialization.jsp'">로그아웃</a>
						</li>
				</c:otherwise>
				</c:choose>
			</ul>
			<!-- 검색창 -->
		<div class="search1">
			<form action="${pageContext.request.contextPath}/goods/SearchGoods.spm" method="post" name="searchForm">
				<input placeholder="Search" class= 'search_main' name="searchtext">
				<a class="btn" href="javascript:document.searchForm.submit()" role="button">
					<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</a>
			</form>
		</div>
			<!-- 카테고리 -->
			<div class="category">
				<div class= nav2> 
					<ul>
						<li>
							<a class="link fullclick" href="${pageContext.request.contextPath }/goods/goodsList.goods?gCatg=냉장고" class="a">냉장고</a>
							<ul>
								<li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
								<li><a href="상품페이지 경로" style="color:red;">LG</a></li>
							</ul>
						</li>
						<li>
							<a class="link fullclick" href="${pageContext.request.contextPath }/goods/goodsList.goods?gCatg=세탁기" class="a">세탁기</a>
							<ul>
								<li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
								<li><a href="상품페이지 경로" style="color:red;">LG</a></li>
							</ul>
						</li>
						<li>
							<a class="link fullclick" href="${pageContext.request.contextPath }/goods/goodsList.goods?gCatg=TV" class="a">TV</a>
							<ul>
								<li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
								<li><a href="상품페이지 경로" style="color:red;">LG</a></li>
							</ul>
						</li>
						<li>
							<a class="link fullclick" href="${pageContext.request.contextPath }/goods/goodsList.goods?gCatg=에어컨" class="a">에어컨</a>
							<ul>
								<li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
								<li><a href="상품페이지 경로" style="color:red;">LG</a></li>
								<li><a href="상품페이지 경로" style="color:black;">WINIA</a></li>
							</ul>
						</li>
						<li>
								<a class="link fullclick" href="${pageContext.request.contextPath }/goods/goodsList.goods?gCatg=컴퓨터" class="a">컴퓨터</a>
							<ul>
								<li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
								<li><a href="상품페이지 경로" style="color:red;">LG</a></li>
								<li><a href="상품페이지 경로" style="color:black;">APPLE</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div> 
</body>
</html>
