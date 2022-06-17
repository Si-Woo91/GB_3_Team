<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="..\css\OrderList-Page.css">
</head>
<body>
	<header> <jsp:include page="..\common\header.jsp"/> </header>
	
	<div class="order">
			<h3 style="width: 150px; text-align: center; font-weight: bold;">
				주문 목록</h3>
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
						test product3
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

		</table>
		
		<br><br><br><br>
		<footer> <jsp:include page="..\common\footer.jsp"/> </footer>

</body>
</html>