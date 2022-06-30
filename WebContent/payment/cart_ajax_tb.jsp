<%@page import="com.gushipsam.payment.dao.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	DecimalFormat df = new DecimalFormat("###,###"); 					
	List<CartDTO> cartList = (List) request.getAttribute("cartList");

%>
<table id="order_tb">
	<colgroup>
		<col width="2.5%">
		<col width="60%">
		<col width="15%">
		<col width="7.5%">
		<col width="15%">
	</colgroup>
	<thead>
		<tr>
			<td colspan="5">
				<h3 id="title">구십삼 주문상품</h3>
			</td>
		</tr>
		<tr class="table_top">
			<td>
				<div class="align_center">
					<input type="checkbox" name="chk_all" id="chk_all">
				</div>
			</td>
			<td>
				<div class="align_center">상품정보</div>
			</td>
			<td>
				<div class="align_center">판매가</div>
			</td>
			<td>
				<div class="align_center">수량</div>
			</td>
			<td>
				<div class="align_center">구매가</div>
			</td>
		</tr>
	</thead>
	<tbody>
		<%
			for (CartDTO item : cartList) {
		%>
		<tr>
			<td>
				<div class="align_center">
					<input type="checkbox" name="chk">
				</div>
			</td>
			<td>
				<table class="goods_tb">
					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>
					<tr>
						<td rowspan="2">
							<%
								String foldername = null;
									String catg = item.getgCATG();
									String img = item.getgIMGS();

									switch (catg) {
									case "냉장고":
										foldername = "fridge";
										break;
									case "세탁기":
										foldername = "washer";
										break;
									case "TV":
										foldername = "tv";
										break;
									case "에어컨":
										foldername = "ac";
										break;
									case "컴퓨터":
										foldername = "pc";
										break;
									}
							%> <a
							href="${pageContext.request.contextPath }/goods/goodsDetail.goods?gID=<%=item.getgID() %>">
								<img
								src="${pageContext.request.contextPath }/img/<%=foldername %>/<%=img %>"
								style="width: 100%">
						</a>
						</td>
						<td id="brand"><%=item.getgBRAND()%></td>
					</tr>
					<tr>
						<td><%=item.getgNAME()%></td>
					</tr>
				</table>
			</td>
			<%
				int price = item.getgPRICE();
					int qty = item.getcQTY();
			%>
			<td>
				<div class="align_center"><%=df.format(price)%></div>
			</td>
			<td>
				<div class="align_center"><%=qty%></div>
			</td>
			<td>
				<div class="align_center"><%=df.format(price * qty)%></div>
			</td>
		</tr>
		<%
			}
		%>
		<tr>
			<td colspan="5" style="height: 150px" id="zerocart">
				<div class="align_center" style="font-size: 30px">¯\_(ツ)_/¯</div>
				<div class="align_center"
					style="font-size: 17px; font-weight: bold;">장바구니에 저장된 상품이
					없습니다.</div>
			</td>
		</tr>
	</tbody>
</table>

<script src="${pageContext.request.contextPath }/js/cart06.js"></script>