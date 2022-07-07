<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet" type="text/css" href="../css/adHome.css">
<link rel="shortcut icon" href="../img/admin_icon.ico">
</head>
<body>
	<!-- 전체 포장지 -->
	<div id="wrap">
		<br>
		<h3>관리자 페이지</h3>
		<div class="menu1">
			<ul>
				<li><a class="adminlink" href="#" onclick="logout();">로그아웃</a>
				</li>
				<!-- main으로 이동후 '관리자계정이 로그아웃되었습니다' 라는 경고창 출력 -->
			</ul>
		</div>
		<br>
		<div class="ad-menu">
			<ul>
				<li><a class="adminlink"
					href="${pageContext.request.contextPath}/admin/Goodslist.spm">상품
						관리</a>
				<li><a class="adminlink"
					href="${pageContext.request.contextPath}/admin/Memberlist.spm">회원
						목록</a>
			</ul>
		</div>
	</div>
</body>
<script>
	function logout(){
		alert('로그아웃되었습니다.');
		location.href='${pageContext.request.contextPath}/main/sessionInitialization.jsp'
	}
</script>
</html>