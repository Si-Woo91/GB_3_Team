<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="../css/id.css" rel="stylesheet" type="text/css">
<body>
	<c:set var="mag" value="${requestScope.mag }" />
	<c:set var="mag2" value="${requestScope.mag2 }" />

	<c:if test="${not empty param.flagid }">
		<c:if test="${not param.flagid }">
			<script>
				alert("아이디 찾기 실패");
			</script>
		</c:if>
	</c:if>
	<c:if test="${not empty param.flagid2 }">
		<c:if test="${not param.flagid2}">
			<script>
				alert("${mag } ");
			</script>
		</c:if>
	</c:if>


	<form action="${pageContext.request.contextPath }/IDPW/id.spm"
		method="POST" name="IDform">
		<div class=first>
			<div class=one>
				<h2>아이디 찾기</h2>
				<div class="textForm1">
					<input name="username" type="text" class="username"
						placeholder="이름">
				</div>
				<div class="textForm1">
					<input name="userphone" type="number" class="userphone"
						placeholder="전화번호">
				</div>
				<div class="textForm1">
					<input name="useremail" type="text" class="useremail"
						placeholder="이메일">
				</div>
				<input type="button" id="id-btn" class="btn" value="아이디 찾기"
					onclick="id_search()">
			</div>
		</div>
	</form>

	<c:if test="${not empty param.flagpw }">
		<c:if test="${not param.flagpw }">
			<script>
				alert("비밀번호 찾기 실패");
			</script>
		</c:if>
	</c:if>
	<c:if test="${not empty param.flagpw2 }">
		<c:if test="${not param.flagpw2}">
			<script>
				alert("${mag2 } ");
			</script>
		</c:if>
	</c:if>
	<form action="${pageContext.request.contextPath }/IDPW/pw.spm"
		method="POST" name="PWform">
		<div class=second>
			<div class=two>
				<h2>비밀번호 찾기</h2>
				<div class="textForm2">
					<input name="userid" type="text" class="userid" placeholder="아이디">
				</div>
				<div class="textForm2">
					<input name="username" type="text" class="username"
						placeholder="이름">
				</div>
				<div class="textForm2">
					<input name="userphone" type="number" class="userphone"
						placeholder="전화번호">
				</div>
				<div class="textForm2">
					<input name="useremail" type="text" class="useremail"
						placeholder="이메일">
				</div>
				<input type="button" id="pw-btn" class="btn" value="비밀번호 찾기"
					onclick="pw_search()">
			</div>
	</form>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="../js/user1.js"></script>
</body>
</html>