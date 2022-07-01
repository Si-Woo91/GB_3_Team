<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세</title>
<link rel="stylesheet" type="text/css" href="goodsDetail.css">
<body>
	<%@ include file= "../header/header.jsp" %>
	<!-- 상품사진 -->
	<div class="goodsDetail">
			<div class="photo">
				<img src="ac5.png" alt="" width="500" height="500">
			</div>
			<a class="name">
 				BESPOKE 무풍에어컨 체온풍
 			</a>
 			<table class = "name2"> 
	 			<tr> 
	 				<th>브랜드</th> 
	 				<td>삼성</td> 
	 			</tr>
	 			<tr> 
	 				<th>모델명</th> 
	 				<td>AF19BX890NFRS</td> 
	 			</tr> 
	 			<tr> 
	 				<th>판매가</th> 
	 				<td>4,434,000 원</td> 
	 			</tr> 
	 			<tr>
	 				<th>크기</th> 
	 				<td>(415X1910X309mm)+(820X345X215mm)</td> 
	 			</tr>
	 			<tr>
	 				<th>냉방면적</th> 
	 				<td>(62.6㎡)+(18.7㎡)</td> 
	 			</tr> 
	 	</table> 
	</div>
	<div class="cnt" >
		<a class=ordercnt>주문수량</a>
			<!-- 	<span class="minus"> -->
		<a class = btn>
			<button type="button" onclick="">-</button>
			<!-- 	</span> -->
			<input type="text" readonly value="1">
		<!-- 		<span class="plus"> -->
			<button type="button" onclick="">+</button>
		</a>	
		<!-- 		</span> -->
	</div>
	<div class="select_btn">			
		<div class="btn1">
			<a href="login.html" color="black">바로구매</a>	
		</div>
		<div class="btn2">
			<a href="login.html">장바구니</a>	
		</div>		
	</div>
		<div class="one2">
		 		<a onclick="window.open('explanation.jsp', '제품설명',
					'width=800, height=600, left=100, top=0');" style="border-bottom: 1px solid #000; background-color: ;">제품 상세 페이지</a>
		</div>
	<%@ include file= "../footer/footer.jsp" %>
</body>
</html>