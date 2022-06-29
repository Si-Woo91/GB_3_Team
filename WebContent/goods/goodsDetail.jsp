<%@page import="java.util.List"%>
<%@page import="com.gushipsam.goods.dao.goodsDTO"%>
<%@page import="java.text.DecimalFormat"%>
<!--  숫자에 콤마 붙이기 위한 숫자포맷 라이브러리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="goodsDetail" value="${requestScope.goodsDetail }" />
<%
	DecimalFormat df = new DecimalFormat("###,###"); // df.format(숫자)로 콤마 보이게 가능
	goodsDTO goodsDetail = (goodsDTO) request.getAttribute("goodsDetail");
	
	String foldername = null;

	if (goodsDetail.getgCatg().equals("냉장고")){
		foldername= "fridge";
	} else if (goodsDetail.getgCatg().equals("세탁기")){
		foldername= "washer";
	} else if (goodsDetail.getgCatg().equals("TV")){
		foldername= "tv";
	} else if (goodsDetail.getgCatg().equals("에어컨")){
		foldername= "ac";
	} else if (goodsDetail.getgCatg().equals("컴퓨터")){
		foldername= "pc";
	}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구심삽 주문결제</title>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="goodsDetail.css">
<link rel="shortcut icon" href="gu_icon.ico">
</head>
		<header> <%@ include file="../header/header.jsp" %> </header>
<body>
	<div style="height: 200px;"></div>

	<section>
		<table id="skeleton">
			<tr>
				<td>
					<div class="photo">
						<img src="${pageContext.request.contextPath }/imgs/<%=foldername %>/${goodsDetail.gImgs }" width="500" height="500">
					</div>

				</td>
				<td id="details_td">
					<div class="details">
						<div class="name">
							<a>${goodsDetail.gName }</a>
						</div>
						<div id="name2_table">
						<table class="name2">
							<tr>
								<th>브랜드</th>
								<td>${goodsDetail.gBrand }</td>
							</tr>
							<tr>
								<th>모델명</th>
								<td>${goodsDetail.gModel}</td>
							</tr>
							<tr>
								<th>판매가</th>
								<td><%=df.format(goodsDetail.getgPRICE())%> 원</td>
							</tr>
							<tr>
								<th>크기</th>
								<td>${goodsDetail.gSize}</td>
							</tr>
							<tr>
								<th>기타정보</th>
								<td>${goodsDetail.gEtc}</td>
							</tr>
						</table>
						</div>
					</div>
					<div class="quantity">
						<div id="qty_title">주문수량</div>
						<span class=btn>
							<button type="button" id="mbtn">-</button>
								<input type="text"id="qty" readonly value="1">
							<button type="button" id="pbtn">+</button>
						</span>
					</div>
					<div class="payment">
						<div class="btn1">
							<a href="${pageContext.request.contextPath }/payment/cart.pay">바로구매</a>
						</div>
						<div class="btn2">
							<a
								href="${pageContext.request.contextPath }/payment/checkout.pay">장바구니</a>
						</div>
					</div>
					<div class="extra_detail">
						<a onclick="window.open('explanation.jsp?gCatg=${goodsDetail.gCatg}&gImgl=${goodsDetail.gImgl}', '제품상세설명',
													'width=800, height=600, left=100, top=0');">제품 상세 페이지로 이동</a>
					</div>
				</td>
			</tr>
		</table>
		<div style="height:100px"></div>
	</section>
		<footer><%@ include file= "../footer/footer.jsp" %></footer>
</body>
<script>
	/* input값 */
	var gcnt = document.getElementById('qty');
	/* 버튼 클릭시 변동값 */
	var mbtn = document.getElementById('mbtn');
	var pbtn = document.getElementById('pbtn');

	mbtn.addEventListener('click', function() {
		if (qty.value >= 2) {
			qty.value = Number(qty.value) - 1;
		}
	});
	pbtn.addEventListener('click', function() {
		qty.value = Number(qty.value) + 1;
	});
</script>
</html>