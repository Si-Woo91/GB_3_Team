<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.List"%>
<%@page import="com.gushipsam.goods.dao.goodsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%
	DecimalFormat df = new DecimalFormat("###,###");
	List<goodsDTO> goodsList = (List<goodsDTO>) request.getAttribute("goodsList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 상품관리</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/admingoods.css">
<link rel="shortcut icon" href="../img/admin_icon.ico">
</head>

<body>
	<c:set var="goodsList" value="${requestScope.goodsList }" />
	<c:set var="goodCnt" value="${requestScope.goodsCnt }" />

	<!-- 포장 시작 -->
	<div class="wrap">
		<div class=wrap1-1>
			<!-- 타이틀 문구 -->
			<header class="page-title">
				<h3>상품재고관리</h3>
			</header>

			<menu>
				<ul>
					<li><a class="adminlink"
						href="${pageContext.request.contextPath}/AD-Page/adHome.spm">홈</a></li>
					<li><a class="adminlink" href="#" onclick="logout();">로그아웃</a></li>
					<li>상품 개수 : ${goodCnt }</li>
				</ul>
			</menu>
			<!-- 상다 메뉴 문구 끝-->

			<br> <br>

			<!-- 검색창 -->
			<div>
				<input type="text" id="searchtext" placeholder="상품 검색"
					onkeyup="if(event.keyCode==13){searchgoods();}"> &nbsp; <input
					type="button" id="search_btn" value="검색" onclick="searchgoods()">
				&nbsp; <input type="button" id="return_btn" value="전체 보기"
					onclick="returntogoods()">
			</div>
			<div class="btn1">
				<button type="button" class="delete_btn" onclick="delgid();">선택
					상품 삭제</button>
			</div>
			<div class="btn2">
				<input type="button" class="add_btn" value="상품 추가"
					onclick="location.href='${pageContext.request.contextPath}/AD-Page/addgoods.jsp'">
				&nbsp; <input type="button" class="edit_btn" value="재고 일괄수정"
					onclick="updateStockAll();">
			</div>
			<!-- 검색창 끝 -->

			<!-- 표 시작 -->
			<table id="goods_list" class="stock-list"
				summary="상품명, 재고 주문대기, 재고수정">
				<colgroup>
					<!-- 테이블   의 각 열의 크기 조절 가능 -->
					<col width="50">
					<col width="200">
					<col width="550">
					<col width="150">
					<col width="200">
					<col width="150">
					<col width="250">
				</colgroup>

				<thead>
					<tr class="list-title-tr">
						<td class="editable"><input type="checkbox" name="allCheck"
							id="allCheck"></td>
						<td class="editable">상품 이미지</td>
						<td class="editable">상품명</td>
						<td class="editable">브랜드</td>
						<td class="editable">가격</td>
						<td class="editable">재고량</td>
						<td class="editable"
							style="background-color: #92B1F0; color: white;">재고량 수정</td>
					</tr>
				</thead>

				<tbody>
					<c:choose>
						<c:when test="${goodsList != null and fn:length(goodsList) > 0 }">

							<%
								for (goodsDTO g : goodsList) {

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
								<th><input type="checkbox" name="chBox" class="chBox"></th>
								<th><img style="height: 100px; width: 100px;"
									src="${pageContext.request.contextPath }/img/<%=foldername %>/<%= g.getgImgs()%>"></th>
								<th><%=g.getgName()%></th>
								<th><%=g.getgBrand()%></th>
								<th><%=df.format(g.getgPRICE())%></th>
								<th><%=g.getgSTOCK()%></th>
								<th class="edit-part"><input class="updatecell"
									name="updatecell" id="stock<%=g.getgID()%>" type="text"
									onkeyup="if(event.keyCode==13){updateStockOne('<%=g.getgName()%>',<%=g.getgSTOCK()%>,<%=g.getgID()%>);}"
									numberOnly></th>
							</tr>
							<%
								}
							%>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="7">
									<div class="ad-goodslist-text">상품이 존재하지 않습니다.</div>
								</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="btn3">
				<button type="button" class="delete_btn" onclick="delgid();">선택
					상품 삭제</button>
			</div>
			<div class="btn4">
				<input type="button" class="add_btn" value="상품 추가"
					onclick="location.href='${pageContext.request.contextPath}/AD-Page/addgoods.jsp'">
				&nbsp; <input type="button" class="edit_btn" value="재고 일괄수정"
					onclick="updateStockAll();">
			</div>
		</div>
	</div>
</body>
<script>
	//로그아웃
	function logout() {
		alert('로그아웃되었습니다.');
		location.href = '${pageContext.request.contextPath}/main/sessionInitialization.jsp'
	}

	// 전체선택
	$("#allCheck").click(function() {
		var chk = $("#allCheck").prop("checked");
		if (chk) {
			$(".chBox").prop("checked", true);
		} else {
			$(".chBox").prop("checked", false);
		}
	});

	// 개별 선택시 전체 선택 해제
	$(".chBox").click(function() {
		$("#allCheck").prop("checked", false);
	});

	//상품 검색
	function searchgoods() {
		let searchtext = $('#searchtext').val().trim();
		if (searchtext == null || searchtext == '') {
			alert("검색어를 입력해주세요.");
			return false;
		} else {
			location.href = '${pageContext.request.contextPath}/AD-Page/SearchGoods.spm?searchtext='
					+ searchtext;
		}
	}

	//전체 상품 다시 조회
	function returntogoods() {
		location.href = '${pageContext.request.contextPath}/admin/adminGoods.spm';
	}

	// 선택된 상품 삭제
	let gid_arr = [];

	<c:forEach var="goods" items="${goodsList }">
	gid_arr.push("${goods.gID}");
	</c:forEach>

	function delgid() {
		chBox = $('input[name="chBox"]');
		let len = chBox.length;
		let count = 0;
		let del_gids = [];

		for (var i = len - 1; i >= 0; i--) {
			if (chBox[i].checked == true) {
				count++;
				let del_gid = gid_arr.splice(i, 1); // 삭제할 gid 하나씩 del_gids배열에 넣기
				del_gids.push(del_gid);
			}
		}

		//삭제할 gid 다 넣은 del_gids 완성됨

		if (count == 0) { //만약 삭제할 gid가 없으면(체크가 아예 없으면) 함수 발동 취소
			alert("제거할 상품을 선택해주세요");
			return false;
		} else { //하나라도 존재한다면
			if (!confirm(count + "개의 상품을 데이터베이스에서 삭제하시겠습니까?"))
				return false;

			// ajax 통신
			let xhr = new XMLHttpRequest();
			xhr.open("GET",
					'${pageContext.request.contextPath }/AD-Page/DELgoodsConfirm.spm?delgids='
							+ del_gids, true);
			xhr.send();
			xhr.onreadystatechange = function() {
				if (xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200) {
					if (xhr.responseText.trim() == "exist") {
						alert("존재함");
						if (!confirm('삭제하려는 상품 중 장바구니 및 주문내역에 존재하는 상품이 있습니다.\n삭제를 계속 진행하시겠습니까?')) {
							//존재하므로 삭제 승인 불허
							return false;
						} else {
							//존재해도 삭제 승인
							alert('선택한 상품이 성공적으로 삭제되었습니다.');
							location.href = '${pageContext.request.contextPath }/AD-Page/DELgoodsOk.spm?delgids='
									+ del_gids;
						}
					} else if (xhr.responseText.trim() == "nonexist") {
						//존재하지 않으므로 삭제 승인
						alert('선택한 상품이 성공적으로 삭제되었습니다.');
						location.href = '${pageContext.request.contextPath }/AD-Page/DELgoodsOk.spm?delgids='
								+ del_gids;
					}
				}
			};

		}
	}

	//재고 수정란 숫자만 기입되게 함
	$("input:text[numberOnly]").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	
	//상품 1품목 재고량 변경 
	function updateStockOne(gName, gSTOCK, gID) {
 		let newstock = $('#stock'+gID).val();
		if( newstock == '') return false;
		if( newstock == gSTOCK ){
			alert('현 재고량과 동일합니다.');
			return false;
		}
		if(! confirm("상품 <" + gName + ">의 재고량을\n" + gSTOCK + "개에서 " + newstock + "개로 변경하시겠습니까?" )) return false;
		location.href = '${pageContext.request.contextPath }/AD-Page/UpdateStockOne.spm?gid='+gID+'&newstock='+newstock;
	}
	
	//상품 다품목 재고량 변경
	function updateStockAll() {
		updates = $('input[name="updatecell"]');
		let len = updates.length;
		updates_gid = [];
		updates_newstock = [];
		
		for (var i = 0; i < len; i++) {
			if (updates[i].value != '') {
				updates_gid.push(gid_arr[i]);
				updates_newstock.push(updates[i].value);
			}
		}
		
 		let update_count = updates_gid.length;
 		 		
		if( update_count == 0){
			alert("수정된 재고량이 없습니다."); return false;
		}
		if(! confirm( "상품 " +update_count + "개의 재고량을 변경하시겠습니까?" )) return false;
		location.href = '${pageContext.request.contextPath }/AD-Page/UpdateStockAll.spm?gids='+updates_gid+'&newstocks='+updates_newstock;
	}
	
	
</script>
</html>