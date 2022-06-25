<%@page import="com.gushipsam.payment.dao.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%> 	<!--  숫자에 콤마 붙이기 위한 숫자포맷 라이브러리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	DecimalFormat df = new DecimalFormat("###,###"); 						// df.format(숫자)로 콤마 보이게 가능
	
	
	
	//카드 아이템 정보 담는 bean 객체 선언 (이후 DAO 속에서 선언하여 DB데이터 받아들일 예정)
	CartBean item1 = new CartBean("LG UHD TV 50인치 벽걸이, 스탠드", "LG",
										"https://tinyurl.com/lgtelev01","../img/cart_tv1.png",700000,3);
	CartBean item2 = new CartBean("삼성 BESPOKE 냉장고 4도어 프리스탠딩 875L", "Samsung",
										"https://tinyurl.com/samsungbskp01","../img/cart_fridge1.png",2400000,1);
	CartBean item3 = new CartBean("코스텔 레트로 에디션 모던 냉장고 107L (빈티지 레드)", "코스텔",
										"https://tinyurl.com/costelfridge01","../img/cart_fridge2.png",17900,2);
	
	//bean객체들을 for문으로 돌리고자 생성한 arraylist
	ArrayList<CartBean> cart = new ArrayList<CartBean>();

	
	session.setAttribute("cart", cart);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구심삽 장바구니</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="shortcut icon" href="gu_icon.ico">
<link rel="stylesheet" type="text/css" href="common06.css">
<link rel="stylesheet" type="text/css" href="cart06.css">
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
				<c:set var="cartList" value="${requestScope.cartList }"/>
				<% List<CartDTO> cartList = (List) request.getAttribute("cartList"); %>
				<% for (CartDTO item : cartList ) { %>
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
									<a href="# "><img src="#" style="width:100%"></a>
								</td>
								<td id="brand"><%=item.getgID()%></td>
							</tr>
							<tr>
								<td><%=item.getgID()%></td>
							</tr>
						</table>
					</td>
					<td>
						<div class="align_center"></div>
					</td>
					<td>
						<div class="align_center"><%= item.getcQTY() %></div>
					</td>
					<td>
						<div class="align_center"></div>
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
		
		<p><form><input type="button" class="select_button" value=" 선택상품 삭제  " onclick="deleteTableRow();"></form></p>
		<br>
		<div class="align_center">
				<input type="button" class="order_button1" id="order_button1" value="선택주문" onclick="jumpPageSome();"> &nbsp;
				<input type="button" class="order_button2" id="order_button2"  value="전체주문" onclick="jumpPageAll()">
		</div>
		
	</section>
	<div style="height:130px"></div>
	<footer><%@ include file= "../footer/footer.jsp" %></footer>
</body>
<script>
//------------brandarr 배열 사용하는 함수 및 자바스크립트 모음 시작-----------------------//
	
	//결제페이지에 전달할 파라미터 저장 배열 (현재 브랜드 저장하며, 나중에는 상품id 전달할 예정)
	let brandarr = [];
	
	//brandarr 최초 생성
	<% for (CartDTO item : cartList ) {
		pageContext.setAttribute("cID",item.getcID());
	%>
		brandarr.push("${cID}");
	<%}%>
	
	//선택 상품 삭제. 맨 뒷 번호부터 차례대로 체크박스 확인. 체크되었을 경우 해당 테이블 열 삭제 + 해당 브랜드 brandarr에서 삭제. 완료되면 reset() 함수 실행
	function deleteTableRow() {
		if (confirm("선택된 상품을 삭제하시겠습니까?") == false){    
			return false;
		}
	
		let table = document.getElementById('order_tb');
		//let table = $('#order_tb');  //왜 안되는지 모르겠음
		checks = $('input[name="chk"]');
		let len = checks.length;
		let count = 0;
		for( var i = len-1; i >= 0  ; i--) {		//1부터 시작하면 중간에 테이블 길이 줄어들어서 index가 맞지 않아 에러남
			if( checks[i].checked == true){
				count++;
				table.deleteRow(i+2);
				brandarr.splice(i,1);
			}
		}
		if(count==0){
			alert("상품을 선택해주세요.");
		}
		
		reset();
	
	}	

	// 선택한 상품의 브랜드만 파라미터로 전송하기
	function jumpPageSome(){
		checks = $('input[name="chk"]');
		let checked = $("input[name=chk]:checked").length;
		if( checked == 0 ) {
			alert("주문 가능한 상품이 없습니다.")
			return false;
		} else {
			let brandarr_checked = [];
			for(let i=0; i<brandarr.length;i++){
				if( checks[i].checked == true) brandarr_checked.push(brandarr[i]);
			}
			location.href='checkout06.jsp?brands='+brandarr_checked;
		}
	}	

	// 모든 상품의 브랜드를 파라미터로 전송하기
	function jumpPageAll(){
		var exist = $("input[name=chk]").length;
		if( exist == 0 ) {
			alert("주문가능한 상품이 없습니다.");
			return false;
		} else{
			location.href='checkout06.jsp?brands='+brandarr;
		}
	}
//------------brandarr 배열 사용하는 함수 및 자바스크립트 모음 끝-----------------------//
</script>
<script src="cart06.js"></script>
</html>