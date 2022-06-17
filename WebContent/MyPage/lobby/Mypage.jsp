<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연매출구심3조-구십삼-마이로비</title>
<link rel="stylesheet" type="text/css" href="..\css\Mypage.css">
</head>
<body>

	<header> <jsp:include page="..\common\header.jsp"/> </header>
	<div class="design_part">마이페이지</div>
	
	
	<!-- 마이페이지 메뉴 시작-->
		<div class="my-nav">
			<ul>
				<li><a
					onclick="location.href='..\\OrderList\\OrderList-Page.jsp'"
					style="cursor: pointer;">주문내역</a></li>
				<li><a
					onclick="window.open('shopping_basket.html', '장바구니','width=1200, height=800, left=0, top=0');"
					style="cursor: pointer;">장바구니</a></li>
				<li><a href="review.html" style="cursor: pointer;">상품리뷰</a></li>
				<li><a
					onclick="location.href='..\\Info\\User-Info.jsp'"
					style="cursor: pointer;">회원정보수정</a></li>
			</ul>
		</div>
		<!-- 마이페이지 메뉴 끝-->
		
		<br> <br>
	
		<div class="order">
			<h3 style="width: 150px; text-align: center; font-weight: bold;">최근
				주문 목록</h3>
			<a class="more_view"
				onclick="location.href='..\\OrderList\\OrderList-Page.jsp'"
				style="font-size: 13px; cursor: pointer;">더보기 +</a>
		</div>
		<table class="order_tb" summary="주문일자, 상품명, 결제금액, 주문상세"
			style="border-top: 1px solid black;">
			<colgroup>
				<col width="150">
				<col width="*">
				<col width="140">
				<col width="140">
			</colgroup>
			<!-- 표의 제목 부분  시작-->
			<thead>
				<tr>
					<td>
						<div class="tab-center">주문일자</div>
					</td>
					<td>
						<div class="tab-center">상품명</div>
					</td>
					<td>
						<div class="tab-center">결제금액</div>
					</td>
					<td>
						<div class="tab-center">상세정보</div>
					</td>
				</tr>
			</thead>
			<!-- 표의 제목 부분  끝-->
			<!-- 표의 본문 시작 -->
			<tbody class="table-body">
				<tr>
<!-- 				<td colspan=""> -->
<!-- 					<div class="tab-center">주문 내역이 없습니다.</div> -->
<!-- 				</td> -->
					<td>
						YY-MM-DD
					</td>
					<td>
						test product
					</td>
					<td>
						test price
					</td>
					<td>
						more information
					</td>
				</tr>
				<tr>
					<td>
						YY-MM-DD
					</td>
					<td>
						test product2
					</td>
					<td>
						test price
					</td>
					<td>
						more information
					</td>
				</tr>
				<tr>
					<td>
						YY-MM-DD
					</td>
					<td>
						test product3
					</td>
					<td>
						test price
					</td>
					<td>
						more information
					</td>
				</tr>
			</tbody>
			<!-- 표의 본문 끝-->
		</table>
		
	<br> <br>

	<footer> <jsp:include page="..\common\footer.jsp"/> </footer>

</body>
</html>