
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼 회원가입 여부 확인</title>
<link rel="shortcut icon" href="../img/gushipsam_icon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<link href="../css/id.css" rel="stylesheet" type="text/css">
<body>
	<form action="${pageContext.request.contextPath }/IDPW/signupcheck.spm"
		method="POST" name="frm" class="joinForm">

		<div class="join">
			<div style="height: 50px; margin-top: 40px;">
				<a href="${pageContext.request.contextPath}/main/main.jsp"> <img
					src="${pageContext.request.contextPath}/img/logo.png"
					style="height: 100%">
				</a>
			</div>
			<h2>회원가입 여부 안내</h2>
			<h5>
				기존 회원가입 정보와 일치하는 정보를 입력하셔야<br> 회원가입 여부를 정확하게 확인하실 수 있습니다.
			</h5>
			<h5 style="color: orange;">입력하신 정보는 회원가입 여부에만 사용되며 저장되지 않습니다.</h5>
			<div class="textForm">
				<input name="username" type="text" class="username" placeholder="이름">
			</div>
			<div class="textForm">
				<input name="userphone" type="number" class="userphone"
					placeholder="전화번호 ( ' - ' 없이 숫자만 입력 ex) 01012345678 )">
			</div>
			<div class="textForm">
				<input name="useremail" type="text" class="useremail"
					placeholder="이메일">
			</div>
			<input type="button" id="id-btn" class="btn" value="가입여부 확인"
				onclick="signup_search()">
		</div>
	</form>
	<script src="../js/user1.js"></script>
</body>
</html>