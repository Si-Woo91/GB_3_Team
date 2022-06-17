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
<form action="doJoin" method="POST" class="joinForm" onsubmit="DoJoinForm__submit(this); return false;">
                                                                                               
      <h2>회원가입</h2>
      <div class="textForm">
        <input name="loginId" type="text" class="id" placeholder="아이디">
      </div>
      <div class="textForm">
        <input name="loginPw" type="password" class="pw" placeholder="비밀번호">
      </div>
       <div class="textForm">
        <input name="loginPwConfirm" type="password" class="pw" placeholder="비밀번호 확인">
      </div>
      <div class="textForm">
        <input name="name" type="text" class="name" placeholder="이름">
      </div>
       <div class="textForm">
        <input name="email" type="text" class="email" placeholder="이메일">
      </div>
      <div class="textForm">
        <input name="cellphoneNo" type="number" class="cellphoneNo" placeholder="전화번호">
      </div><br><br>
      <input type="submit" class="btn" value="회원가입완료">
</form>
</body>
</html>