<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath }../css/id.css" rel="stylesheet" type="text/css">
<link rel="shortcut icon" href="../img/gushipsam_icon.ico">	
<meta charset="UTF-8">
<title>구십삼 로그인</title>
</head>
<body>

    <c:if test="${not empty param.flag }">
      <c:if test="${not param.flag }">
         <script>
            alert("아이디 또는 비밀번호를 잘못 입력했습니다.\n입력하신 내용을 다시 확인해주세요.");
            location.href='/IDPW/login.jsp';
         </script>
      </c:if>
   </c:if> 
	
	<form action="${pageContext.request.contextPath }/main/main.spm" method="POST" name="loginform">
	<div class="wrap">
			<div class="login">
				<h2>Log-in</h2>
				<div class="login_id">
					<h4>아이디</h4>
					<input type="text" name="userid" id="userid" placeholder="">
				</div>
				<div class="login_pw">
					<h4>비밀번호</h4>
					<input type="password" name="userpw" id="userpw" placeholder="">
				</div>
				<div class="login_etc">
					<div class="signup">
						<a class="link" href="signup.jsp">회원가입</a>
					</div>
					<div class="forgot_id">
						<a class="link" href="ID.jsp">아이디/비밀번호찾기</a>
					</div>
				</div>
				<br>
				<br> <input type="button" id="login-btn" class="btn"
					value="로그인 " onclick="loginOn()">
			</div>
	</div>
		</form>
	<script src="../js/user1.js"></script>
</body>
</html>