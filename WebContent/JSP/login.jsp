<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath } /JSP/id.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 	<c:if test="${not empty param.flag }">
		<c:if test="${not param.flag }">
			<script>
				alert("로그인 실패");
				location.href='/JSP/login.jsp';
			</script>
		</c:if>
	</c:if> 
	
<%-- 	<c:if test="${not empty param.flag }">
		<c:if test="${not param.flag }">
			<script>
				alert("로그인 성공");
			</script>
		</c:if>
	</c:if> --%>
	
	<form action="${pageContext.request.contextPath }/JSP/main/main.spm" method="POST" name="loginform">
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
						<a href="signup.jsp">회원가입</a>
					</div>
					<div class="forgot_id">
						<a href="ID.jsp">아이디/비밀번호찾기</a>
					</div>
				</div>
				<br>
				<br> <input type="button" id="login-btn" class="btn"
					value="로그인 " onclick="loginOn()">
			</div>
	</div>
		</form>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="user1.js"></script>
</body>
</html>