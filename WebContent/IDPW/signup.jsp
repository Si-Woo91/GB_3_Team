
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼 회원가입</title>
<link rel="shortcut icon" href="../img/gushipsam_icon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<link href="../css/id.css" rel="stylesheet" type="text/css">
<body>

	<c:if test="${not empty param.result }">
		<c:if test="${param.result } = "notjoined">
			<script>
				alert("회원가입 기록이 없습니다. 회원가입 창으로 이동합니다.");
			</script>
		</c:if>
	</c:if>

	<form action="${pageContext.request.contextPath }/IDPW/login.spm"
		method="POST" name="frm" class="joinForm">

		<div class="join">
			<div style="height: 50px; margin-top: 40px;">
				<a href="${pageContext.request.contextPath}/main/main.jsp"> <img
					src="${pageContext.request.contextPath}/img/logo.png"
					style="height: 100%">
				</a>
			</div>
			<h2>회원가입</h2>
			<div class="textForm">
				<input name="userid" type="text" class="id"
					placeholder="아이디 (4~16자리 영문, 숫자 조합 )"> <input
					name="loginId2" type="button" id="checkid_button" class="id3"
					value="중복확인" onclick="checkId(frm.userid.value)">
			</div>
			<p id="text"></p>
			<div class="textForm">
				<input id="userpw" name="userpw" type="password" class="pw"
					placeholder="비밀번호( 8 ~ 16자 영문, 숫자, 특수문자 조합 )">
			</div>
			<div class="textForm">
				<input id="userpw_two" name="userpw_two" type="password" class="pw"
					placeholder="비밀번호 확인">
			</div>
			<p id="text2">
			<p>
			<div class="textForm">
				<input name="username" type="text" class="name" placeholder="이름">
			</div>
			<div class="textForm">
				<input name="userphone" type="text" class="cellphoneNo"
					placeholder="전화번호 ( ' - ' 없이 숫자만 입력 ex) 01012345678 )" numberOnly>
			</div>
			<div class="textForm">
				<input name="userdata" type="text" class="name"
					placeholder="생년월일 8자리 ( ' - ' 없이 숫자만 입력 ex) 20220623 )" numberOnly>
			</div>
			<div class="textForm">
				<input name="useremail" type="text" class="email" placeholder="이메일">
			</div>
			<input type="button" id="join-btn" class="btn" value="회원가입완료"
				onclick="sendit()">
		</div>
	</form>
	<script src="../js/user1.js"></script>
</body>
</html>