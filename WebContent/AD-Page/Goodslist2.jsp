<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/Goodslist.css">
</head>

<body>

	<!-- 포장 시작 -->
	<div class="wrap">
		<div class=wrap1-1>
			<!-- 타이틀 문구 -->
			<header class="page-title">
				<h3>상품재고관리</h3>
			</header>
			<!-- 타이틀 문구  끝-->

			<!-- 상다 메뉴 문구 -->
			<menu>
				<ul>
					<li>전체 목록</li>
					<li>전체 상품 갯수</li>
				</ul>
			</menu>
			<!-- 상다 메뉴 문구 끝-->

			<br> <br>

			<!-- 검색창 -->
			<div class="search">
				<input type="text" class="textBar"> <i class="fas fa-search"></i>
			</div>
			<!-- 검색창 끝 -->
			<br>

			<!-- 표 시작 -->

			<table class="stock-list" summary="상품명, 재고 주문대기, 재고수정">
				<colgroup>
					<!-- 테이블	의 각 열의 크기 조절 가능 -->
					<col width="50">
					<col width="300">
					<col width="200">
					<col width="200">
					<col width="200">
					<col width="300">
					<col width="300">
				</colgroup>

				<thead>
					<tr class="list-title-tr">
					<td class="editable">x</td>
						<td class="editable">상품 이미지</td>
						<td class="editable">상품명</td>
						<td class="editable">브랜드</td>
						<td class="editable">가격</td>
						<td class="editable">재고</td>
						<td class="editable" style="background-color: #ffeccd;">재고수정</td>
					</tr>
				</thead>

				<tbody>
					<tr>
						<th><input class="selectbox" type="checkbox" name="checkcel"></th>
						<th class="img">img</th>
						<th>상품1</th>
						<th>브랜드1</th>
						<th>1013400</th>
						<th>314</th>
						<th class="edit-part"><input class="update-cell" type="text">
						</th>
					</tr>
					<tr>
						<th><input class="selectbox" type="checkbox" name="checkcel"></th>
						<th class="img">img</th>
						<th>상품2</th>
						<th>브랜드2</th>
						<th>100120</th>
						<th>116</th>
						<th class="edit-part"><input class="update-cell" type="text">
						</th>
					</tr>
					<tr>
						<th><input class="selectbox" type="checkbox" name="checkcel"></th>
						<th class="img">img</th>
						<th>상품3</th>
						<th>브랜드3</th>
						<th>143420</th>
						<th>100</th>
						<th class="edit-part"><input class="update-cell" type="text">
						</th>
					</tr>
					<tr>
						<th><input class="selectbox" type="checkbox" name="checkcel"></th>
						<th class="img">img</th>
						<th>상품4</th>
						<th>브랜드4</th>
						<th>11340</th>
						<th>240</th>
						<th class="edit-part"><input class="update-cell" type="text">
						</th>
					</tr>
					<tr>
						<th><input class="selectbox" type="checkbox" name="checkcel"></th>
						<th class="img">img</th>
						<th>상품5</th>
						<th>브랜드5</th>
						<th>112310</th>
						<th>12</th>
						<th class="edit-part"><input class="update-cell" type="text">
						</th>
					</tr>
					
				</tbody>
			</table>

			<!-- 표 끝 -->

			<br>

			<div>
				<form class="btn">
					<input type="button" value="일괄수정">
					<input onclick="localtion.href='ADDgoods.jsp'" type="button" value="상품추가">
					<input type="button" value="상품삭제"
						onclick="deleteRow(-1)">
				</form>
			</div>
		</div>
	</div>
</body>
<!-- <script src="Goodslist.js"></script> -->
</html>