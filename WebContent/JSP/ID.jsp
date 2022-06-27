<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="id.css" rel ="stylesheet" type="text/css">
<body>
<form action="" method="POST" name="IDform">
<div class = first>
	<div class = one>
	<h2>아이디 찾기</h2>
	<div class="textForm1">
		<input name="username" type="text" class="username" placeholder="이름">
	</div>
	<div class="textForm1">
		<input name="userphone" type="number" class="userphone" placeholder="전화번호">
	</div>
	<div class="textForm1">
		<input name="useremail" type="text" class="useremail" placeholder="이메일">
	</div>
	<input type="button" id="id-btn" class="btn" value="아이디 찾기" onclick="id_search()">
	</div>
</div>	
</form>	
<form action="" method="POST" name="PWform">
<div class = second>
	<div class = two>
	<h2>비밀번호 찾기</h2>	
	<div class="textForm2">
		<input name="userid" type="text" class="userid" placeholder="아이디">
	</div>
	<div class="textForm2">
		<input name="username" type="text" class="username" placeholder="이름">
	</div>
	<div class="textForm2">
		<input name="userphone" type="number" class="userphone" placeholder="전화번호">
	</div>
	<div class="textForm2">
		<input name="useremail" type="text" class="useremail" placeholder="이메일">
	</div>
<input type="button" id="pw-btn" class="btn" value="비밀번호 찾기" onclick="pw_search()">
</div>
</form>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="user1.js"></script>
</body>
</html>