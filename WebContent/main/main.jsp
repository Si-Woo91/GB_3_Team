<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼 메인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script type="text/javascript" src="../js/slick.min.js"></script> 
	<script type="text/javascript" src="../js/slide.js"></script>
</head>
	<%@ include file= "../header/header.jsp" %>
<body>
	<section id='main_section'>
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
				<div>
					<img src="../img/slide2.png">
				</div>
			</div>
		</div>
	</div>

	<!-- 인기제품목록  -->
	<div class="main_popular1">
	<div class="main_popular-item"><a href="${pageContext.request.contextPath }/goods/goodsDetail.goods?gID=17" ><img src="../img/ac2.png">BESPOKE 무풍에어컨 갤러리</a></div>
	<div class="main_popular-item"><a href="${pageContext.request.contextPath }/goods/goodsDetail.goods?gID=11" ><img src="../img/tv1.png">Neo QLED 4K TV (55인치)</a></div><br>
	</div>
	<div class="main_popular2">
	<div class="main_popular-item"><a href="${pageContext.request.contextPath }/goods/goodsDetail.goods?gID=21" ><img src="../img/pc1.png">LG gram 16 </a></div><br>
	<div class="main_popular-item"><a href="${pageContext.request.contextPath }/goods/goodsDetail.goods?gID=7" ><img src="../img/washer2.png">그랑데 AI[올인원컨트롤]</a></div>
	</div>
	</section>
		<%@ include file= "../footer/footer.jsp" %>
</body>
</html>