<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼 회원정보</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/User-Info.css"> -->
</head>
<jsp:include page="../header/header.jsp"/>
<body>
	
	<div class="info-member-container">
		<h1 class="info-usermodify-auth-title">회원정보확인</h1>
		<p class="usermodify-msg" style="margin-left: 18%">
			<strong class="usermodify=mail">
				testEmail@google.com
			</strong>
		"님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
		</p>
		
		<form action="#" name="user-info-certification">
			<table class="info-UserModify-table">
				<tbody>
					<tr style="height: 37px;">
						<th scope="row">아이디(이메일)</th>
						<td> testId </td>
					</tr>
					<tr>
						<th scope="row">비밀번호</th>
						<td>
							<input type="password" id="testpw">
						</td>
					</tr>
				
				</tbody>
			</table>	
		</form>
		<div class="info-usermodify-btn">
			<button type="submit" class="info-usermodify-submit" onclick="location.href='User-InfoUp.jsp'">확인</button>
			<button type="button" class="info-usermodify-cancel">취소</button>		</div>

	</div>
<jsp:include page="../footer/footer.jsp"/>
</body>
</html>