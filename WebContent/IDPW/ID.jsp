<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="id.css" rel ="stylesheet" type="text/css">
<body>
<div class = first>
	<div class = one>
	<h2>아이디 찾기</h2>
	<div class="textForm1">
		<input name="name" type="text" class="name" placeholder="이름">
	</div>
	<div class="textForm1">
		<input name="cellphoneNo" type="number" class="cellphoneNo" placeholder="전화번호">
	</div>
	<div class="textForm1">
		<input name="email" type="text" class="email" placeholder="이메일">
	</div>
	<input type="submit" class="btn" value="아이디 찾기" onclick="alert('아이디');" style="cursor:pointer">
	</div>
	
	<div class = two>
	<h2>비밀번호 찾기</h2>	
	<div class="textForm2">
		<input name="id" type="text" class="id" placeholder="아이디">
	</div>
	<div class="textForm2">
		<input name="name" type="text" class="name" placeholder="이름">
	</div>
	<div class="textForm2">
		<input name="cellphoneNo" type="number" class="cellphoneNo" placeholder="전화번호">
	</div>
	<div class="textForm2">
		<input name="email" type="text" class="email" placeholder="이메일">
	</div>
<input type="submit" class="btn" value="비밀번호 찾기" onclick="alert('비밀번호');" style="cursor:pointer">
</body>
</html>