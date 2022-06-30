<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연매출구심3조-구십삼-마이로비</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/Mypage.css"> -->
</head>
<body>
<%-- requestScope 범위에 있는 recentList를 가져와서 새로 선언한 변수 recentList에 넣음 --%>
	<c:set var="recentList" value="${requestScope.recentList }"/>
<%-- <c:set var="listCnt" value="${requestScope.listCnt }"/> --%>

	<header> <jsp:include page="../header/header.jsp"/> </header>
	<div class="my-design_part">마이페이지</div>
	
	<!-- 마이페이지 메뉴 시작-->
		<div class="my-my-nav">
			<ul>
				<li><a
					onclick="location.href='/OrderList/OrderList.spm'"
					style="cursor: pointer;">주문내역</a></li>
<!-- 					onclick="window.open('shopping_basket.html', '장바구니','width=1200, height=800, left=0, top=0');"-->
				<li><a
					onclick="window.open('shopping_basket.html', '장바구니','width=1200, height=800, left=0, top=0');"
					style="cursor: pointer;">장바구니</a></li>
				<li><a href="review.html" style="cursor: pointer;">상품리뷰</a></li>
				<li><a
					onclick="location.href='../Info/User-Info.jsp'"
					style="cursor: pointer;">회원정보수정</a></li>
			</ul>
		</div>
		<!-- 마이페이지 메뉴 끝-->
		
		<br> <br>
	
		<div class="my-order">
			<h3 class="my-h3" style="width: 150px; text-align: center; font-weight: bold;">최근
				주문 목록</h3>
			<a class="more_view"
				onclick="location.href='../OrderList/OrderList-Page.jsp'"
				style="font-size: 13px; cursor: pointer;">더보기 +</a>
		</div>
		<table class="my-order_tb" summary="주문일자, 상품명, 결제금액, 주문상세"
			style="border-top: 1px solid black;">
			<colgroup>
				<col width="150">
				<col width="*">
				<col width="140">
				<col width="140">
			</colgroup>
			<thead>
				<tr>
					<td>
						<div class="my-tab-center">상품이미지</div>
					</td>
					<td>
						<div class="my-tab-center">상품명</div>
					</td>
					<td>
						<div class="my-tab-center">결제금액</div>
					</td>
					<td>
						<div class="my-tab-center">주문날짜</div>
					</td>
				</tr>
			</thead>
			
			<tbody class="my-table-body">
				<c:choose>
					<c:when test="${recentList != null and fn:length(recentList) > 0 }">
						<c:forEach var="recentdata" items="${recentList }">
							<tr>
								<td>
									${recentdata.gIMG }
								</td>
								<td>
									${recentdata.gNAME }
								</td>
								<td>
									${recentdata.gPRICE }
								</td>
								<td>
									${recentdata.oDate }
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">
	 							<div class="tab-center">주문 내역이 없습니다.</div>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			
		</table>
		
	<br> <br>

	<footer> <jsp:include page="../footer/footer.jsp"/> </footer>

</body>
</html>