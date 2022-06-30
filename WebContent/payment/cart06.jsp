<%@page import="com.gushipsam.payment.dao.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%> 	<!--  숫자에 콤마 붙이기 위한 숫자포맷 라이브러리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	DecimalFormat df = new DecimalFormat("###,###"); 						// df.format(숫자)로 콤마 보이게 가능
	
	
	List<CartDTO> cartList = (List) request.getAttribute("cartList");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구심삽 장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<%@ include file= "../header/header.jsp" %>
<body id="payment">
	<section id='cart'>
		<br>
		<div id="title_big">장바구니</div>
		<span id="ajaxed_span">
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
					<% for (CartDTO item : cartList) { %>
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
										<%
										String foldername = null;
										String catg = item.getgCATG();
										String img = item.getgIMGS();
										
										switch (catg) {
										case "냉장고" : foldername= "fridge"; break;
										case "세탁기" : foldername= "washer"; break;
										case "TV" : foldername= "tv"; break;
										case "에어컨" : foldername= "ac"; break;
										case "컴퓨터" : foldername= "pc"; break;
										}
										%>
										<a href="${pageContext.request.contextPath }/goods/goodsDetail.goods?gID=<%=item.getgID() %>">
											<img src="${pageContext.request.contextPath }/img/<%=foldername %>/<%=img %>" style="width:100%">
										</a>
									</td>
									<td id="brand"><%=item.getgBRAND()%></td>
								</tr>
								<tr>
									<td><%=item.getgNAME()%></td>
								</tr>
							</table>
						</td>
						<% int price = item.getgPRICE(); int qty = item.getcQTY(); %>
						<td>
							<div class="align_center"><%= df.format(price) %></div>
						</td>
						<td>
							<div class="align_center"><%= qty %></div>
						</td>
						<td>
							<div class="align_center"><%= df.format(price*qty) %></div>
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
		</span>
		<input type="button" class="select_button" id="select_button" value=" 선택상품 삭제  " onclick="deleteTableRow();">
		<br>
		<div class="align_center">
				<input type="button" class="order_button1" id="order_button1" value="선택주문" onclick="jumpPageSome();"> &nbsp;
				<input type="button" class="order_button2" id="order_button2"  value="전체주문" onclick="jumpPageAll()">
		</div>
		
	</section>
	<div style="height:100px"></div>
	<%@ include file= "../footer/footer.jsp" %>
</body>
<script>
//------------cid_arr 배열 사용하는 함수 모음 시작-----------------------//
	
	//결제페이지에 전달할 파라미터 저장 배열 (현재 브랜드 저장하며, 나중에는 상품id 전달할 예정)
	let cid_arr = [];
	
	//cid_arr 최초 생성
	<% for (CartDTO item : cartList ) {
		pageContext.setAttribute("cID",item.getcID());
	%>
		cid_arr.push("${cID}");
	<%}%>
	
	//선택 상품 삭제. 맨 뒷 번호부터 차례대로 체크박스 확인. 체크되었을 경우 해당 테이블 열 삭제 + 해당 브랜드 brandarr에서 삭제. 완료되면 reset() 함수 실행
	function deleteTableRow() {
		
		if (confirm("선택된 상품을 삭제하시겠습니까?") == false){    
			return false;
		}
		
		checks = $('input[name="chk"]');
		let len = checks.length;
		let del_cids=[];
		let count = 0;
		
		for( var i = len-1; i >= 0  ; i--) {		//1부터 시작하면 중간에 테이블 길이 줄어들어서 index가 맞지 않아 에러남
			if( checks[i].checked == true){
				count++;
				del_cids.push(cid_arr.splice(i,1));
			}
		}
		
		if(count==0){
			alert("상품을 선택해주세요.");
		} else {
			// ajax 통신
			let xhr = new XMLHttpRequest();
			xhr.open("GET", '${pageContext.request.contextPath }/payment/cartdel.pay?delcids='+del_cids, true);
			xhr.send();
			xhr.onreadystatechange = function(){
				if( xhr.readyState == XMLHttpRequest.DONE 
						&& xhr.status == 200 ){
// 					alert(xhr.responseText);
// 					console.log(xhr.responseText);
					$('#ajaxed_span').html(xhr.responseText);
				}			
			}
		}
	
	}	
	
	// 선택한 상품의 브랜드만 파라미터로 전송하기
	function jumpPageSome(){
		checks = $('input[name="chk"]');
		let checked = $("input[name=chk]:checked").length;
		if( checked == 0 ) {
			alert("주문 가능한 상품이 없습니다.")
			return false;
		} else {
			let cid_arr_checked = [];
			for(let i=0; i<cid_arr.length;i++){
				if( checks[i].checked == true) cid_arr_checked.push(cid_arr[i]);
			}
			location.href='${pageContext.request.contextPath }/payment/checkout.pay?cids='+cid_arr_checked;
		}
	}	
	
	// 모든 상품의 브랜드를 파라미터로 전송하기
	function jumpPageAll(){
		var exist = $("input[name=chk]").length;
		if( exist == 0 ) {
			alert("주문가능한 상품이 없습니다.");
			return false;
		} else{
			location.href='${pageContext.request.contextPath }/payment/checkout.pay?cids='+cid_arr;
		}
	}
//------------cid_arr 배열 사용하는 함수 모음 끝-----------------------//
</script>
<script src="${pageContext.request.contextPath }/js/cart06.js"></script>
</html>