<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>구십삼 회원정보</title>
</head>
<jsp:include page="../header/header.jsp" />
<body>
	<c:set var="result" value="${requestScope.result }" />
	<c:choose>
		<c:when test="${ ! empty result }">
			<script>
				alert("잘못된 비밀번호입니다.");
			</script>
		</c:when>
	</c:choose>
	
	<div class="info-member-container">
		<div class="my-design_part">회원정보 확인</div>
		<div class="usermodify-msg">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번
			확인합니다.</div>
		<br>
		<table class="info-UserModify-table">
			<colgroup>
				<col width="200">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">아이디</th>
					<td>${sessionScope.sessionId}</td>
				</tr>
				<tr>
					<th scope="row">비밀번호</th>
					<td>
						<form
							action="${pageContext.request.contextPath }/info/confirmpw.info"
							method="post" name="pwForm">
							<input type="password" name="userpw" onkeyup="if(event.keyCode==13){confirmpw();}">
						</form>
					</td>
				</tr>

			</tbody>
		</table>
		<br>
		<div class="info-usermodify-btn">
			<button type="button" id="confirm_btn" onclick="confirmpw();">확인</button>
			&nbsp;
			<button type="button" id="goback_btn" onclick="location.href='${pageContext.request.contextPath}/lobby/mypage.spm';">마이페이지</button>
		</div>

	</div>
	<jsp:include page="../footer/footer.jsp" />
</body>
<script>
	function confirmpw() {
		let f = document.pwForm;
		let pw = f.userpw.value;
		if (pw == '') {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		f.submit();
	}
</script>
</html>