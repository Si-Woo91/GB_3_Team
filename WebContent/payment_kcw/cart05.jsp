<%@page import="java.util.ArrayList"%>
<%@page import="com.gushipsam.cart.CartBean"%>
<%@page import="java.text.DecimalFormat"%> 	<!--  숫자에 콤마 붙이기 위한 숫자포맷 라이브러리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
		
	DecimalFormat df = new DecimalFormat("###,###"); 						// df.format(숫자)로 콤마 보이게 가능
	
	//카드 아이템 정보 담는 bean 객체 선언 (이후 DAO 속에서 선언하여 DB데이터 받아들일 예정)
	CartBean item1 = new CartBean("LG UHD TV 50인치 벽걸이, 스탠드", "LG",
										"https://tinyurl.com/lgtelev01","/img/cart_tv1.png",700000,3);
	CartBean item2 = new CartBean("삼성 BESPOKE 냉장고 4도어 프리스탠딩 875L", "Samsung",
										"https://tinyurl.com/samsungbskp01","/img/cart_fridge1.png",2400000,1);
	CartBean item3 = new CartBean("LG UHD TV 50인치 벽걸이, 스탠드", "코스텔",
										"https://tinyurl.com/costelfridge01","/img/cart_fridge2.png",17900,2);
	
	//bean객체들을 for문으로 돌리고자 생성한 arraylist
	ArrayList<CartBean> cart = new ArrayList<CartBean>();
	cart.add(item1);
	cart.add(item2);
	cart.add(item3);
	
	//session.setAttribute("cart",cart);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구심삽 장바구니</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="shortcut icon" href="gu_icon.ico">
<link rel="stylesheet" type="text/css" href="common05.css">
<link rel="stylesheet" type="text/css" href="cart05.css">
</head>
<body>
	<header> <%@ include file= "../header/header.jsp" %> </header>
	<section>
		<br>
		<div id="title_big">장바구니</div>
		<br>
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
						<h3 class="title">구십삼 주문상품</h3>
						<div style="height:10px"></div>
					</td>
				</tr>
				<tr class="table_top">
					<td>
						<div class="align_center"><input type="checkbox" name="chk_all" id="chk_all"></div>
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
				<% for (CartBean item : cart ) { %>
				<tr>
					<td>
						<div class="align_center"><input type="checkbox" name="chk"></div>
					</td>
					<td>
						<table class="goods_tb">
							<colgroup>
								<col width="20%">
								<col width="80%">
							</colgroup>
							<tr>
								<td rowspan="2">
									<a href="<%=item.getItemLink()%>"><img src="<%=item.getItemImage()%>" style="width:100%"></a>
								</td>
								<td><%=item.getItemBrand()%></td>
							</tr>
							<tr>
								<td><%=item.getItemName()%></td>
							</tr>
						</table>
					</td>
					<td>
						<div class="align_center"><%= df.format(item.getItemPrice()) %></div>
					</td>
					<td>
						<div class="align_center"><%= item.getItemQty() %></div>
					</td>
					<td>
						<div class="align_center"><%= df.format(item.getItemPrice()*item.getItemQty())%></div>
					</td>
				</tr>
				<% } %>
				<tr>
					<td colspan="5" style="height: 150px" id="zerocart">
						<div class="align_center" style="font-size:30px">¯\_(ツ)_/¯</div>
						<div class="align_center" style="font-size:17px; font-weight:bold;">장바구니에 저장된 상품이 없습니다.</div>
					</td>
				</tr>
			</tbody>
		</table>
		
		<p><form><input type="button" class="select_button" value=" 선택 삭제  " onclick="deleteTableRow(); remove();"></form></p>
		<br>
		<div class="align_center">
				<input type="button" class="order_button1" id="order_button1" value="선택주문" onclick="jumpPageSome()"> &nbsp;
				<input type="button" class="order_button2" id="order_button2"  value="전체주문" onclick="jumpPageAll()">
		</div>
		
	</section>
	<div style="height:130px"></div>
	<footer><%@ include file= "../footer/footer.jsp" %></footer>
</body>
<script src="cart05.js"></script>
</html>