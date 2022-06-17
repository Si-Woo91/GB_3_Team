<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼</title>
	<script src="http://code.jquery.com/jquery.min.js"></script> 
	<script type="text/javascript" src="../js/slick.min.js"></script> 
	<script type="text/javascript" src="../js/slide.js"></script> 
	<link rel="stylesheet" type="text/css" href="../css/main_css.css">
	<link rel="stylesheet" type="text/css" href="../css/slick.css">
</head>
	<%@ include file= "../header/header.jsp" %>
<body>
	<section>
	<!-- body  -->
	<!-- 슬라이드 사진 -->
	<div id="slide_image">
		<div class="bannerWrap">
			<div class="banner_img">
				<div>
					<img src="../img/slide1.png">
				</div>
				
				<div>
					<img src="../img/slide2.png">
				</div>
			</div>
		</div>
	</div>

	<!-- 인기제품목록  -->
	<div class="popular">
	<div class="popular-item"><a href=""><img src="../img/test.jpg"></a></div>
	<div class="popular-item"><a href=""><img src="../img/test.jpg"></a></div>
	<div class="popular-item"><a href=""><img src="../img/test.jpg"></a></div>
	<div class="popular-item"><a href=""><img src="../img/test.jpg"></a></div>
	</div>
	</section>
		<%@ include file= "../footer/footer.jsp" %>
</body>
</html>