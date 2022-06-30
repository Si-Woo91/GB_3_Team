<%@page import="java.util.List"%>
<%@page import="com.gushipsam.shoppingmall.dao.ShoppingMallDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	List<ShoppingMallDTO> orderList = (List<ShoppingMallDTO>) request.getAttribute("orderList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="orderList" value="${requestScope.orderList }"/>
	<c:set var="orderCnt" value="${requestScope.orderCnt }"/>
	<c:set var="nowPage" value="${requestScope.nowPage }"/>
	<c:set var="totalPage" value="${requestScope.totalPage }"/>
	<c:set var="startPage" value="${requestScope.startPage }"/>
	<c:set var="endPage" value="${requestScope.endPage }"/>

	<header> <jsp:include page="../header/header.jsp"/> </header>
	
	<div class="order" style="padding-top: 230px;">
			<h3 class="order-order-h3" style="width: 150px; text-align: center; font-weight: bold;">
				주문 목록</h3>
		</div>
		<table class="order-order_tb" summary="주문일자, 상품명, 결제금액, 주문상세"
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
						<div class="order-tab-center">상품이미지</div>
					</td>
					<td>
						<div class="order-tab-center">상품명</div>
					</td>
					<td>
						<div class="order-tab-center">결제금액</div>
					</td>
					<td>
						<div class="order-tab-center">주문날짜</div>
					</td>
				</tr>
			</thead>

			<!-- 표의 본문 시작 -->
			<tbody class="order-table-body">
				<c:choose>
				<c:when test="${orderList != null and fn:length(orderList) > 0 }">
					<%
						for (ShoppingMallDTO g : orderList) {

									String foldername = null;
									String gCatg = g.getgCatg();

									if (gCatg.equals("냉장고")) {
										foldername = "fridge";
									} else if (gCatg.equals("세탁기")) {
										foldername = "washer";
									} else if (gCatg.equals("TV")) {
										foldername = "tv";
									} else if (gCatg.equals("에어컨")) {
										foldername = "ac";
									} else if (gCatg.equals("컴퓨터")) {
										foldername = "pc";
									}
					%>
						<tr>
						<td><img style="height: 100px; width: 100px;"
							src="${pageContext.request.contextPath }/img/<%=foldername %>/<%= g.getgIMGS()%>"></td>
						<td><%=g.getgName()%></td>
						<td><%=g.getgPRICE()%></td>
						<td><%=g.getoDate()%></td>
					</tr>
					<%
						}
					%>
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
		<br>
		
		<!-- 페이징 처리 -->
		<table class="order-paging" style="border: 0px; width: 900px;">
			<tr align="center" valign="middle">
				<td>
					<c:if test="${nowPage > 1 }">
						<a href="${pageContext.request.contextPath}/OrderList/OrderList.spm?page=${nowPage-1}">[&lt;]</a>
					</c:if>
					
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<%-- 현재 보고있는 페이지는 a tag 제거 --%>
							<c:when test="${i == nowPage }">[${i }]</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/OrderList/OrderList.spm?page=${i}">[${i }]</a>							
							</c:otherwise>
						</c:choose>	
					</c:forEach>
					
					<c:if test="${nowPage < totalPage }">
						<a href="${pageContext.request.contextPath}/OrderList/OrderList.spm?page=${nowPage+1}">[&gt;]</a>
					</c:if>	
				</td>
			</tr>
		</table>
		
		<footer> <jsp:include page="../footer/footer.jsp"/> </footer>

</body>
</html>