<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼 회원정보수정</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="../css/User-InfoUp.css"> -->
</head>
<jsp:include page="../header/header.jsp" />
<body>
	<c:set var="member" value="${requestScope.member }" />
	<c:set var="result" value="${requestScope.result }" />
	<c:choose>
		<c:when test="${ result eq 'emailModified' }">
			
			<script>
				alert("이메일이 성공적으로 변경되었습니다.");
			</script>
		</c:when>
		<c:when test="${ result eq 'phoneModified' }">
			<script>
				alert("전화번호가 성공적으로 변경되었습니다.");
			</script>
		</c:when>
		<c:when test="${ result eq 'passwordModified' }">
			<script>
				alert("비밀번호가 성공적으로 변경되었습니다.");
			</script>
		</c:when>
	</c:choose>
	
	<!-- 본문 포장지 -->
	<div class="ifup-body-wrap">
		<section class="ifup-member-container">
			<h1 class="ifup-usermodify-title">회원정보수정</h1>
			<table class="ifup-usermodify-table">
				<tbody>
					<tr>
						<th scope="row" style="height: 37px;">아이디</th>
						<td>
							<div class="ifup-usermodify-id">
								<span class="usermodify-id-id">${member.userid }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" style="height: 37px;">이름</th>
						<td>
							<div class="ifup-usermodify-name">
								<span class="usermodify-name-name">${member.username }</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" style="height: 37px;">생년월일</th>
						<td>
							<div class="ifup-usermodify-name">
								<span class="usermodify-name-name">
								${fn:substring(member.userdata,0,4) }.${fn:substring(member.userdata,4,6) }.${fn:substring(member.userdata,6,8) }
								</span>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" style="height: 37px;">이메일</th>
						<td>
							<div class="ifup-usermodify-email">
								<form action="${pageContext.request.contextPath }/info/modifyEmail.info" method="post" name="modifyEmailForm">
									<input type="email" name="newEmail" placeholder="이메일"
										value="${member.useremail }" onkeyup="if(event.keyCode==13){modifyEmail();}"> &nbsp;
									<button type="button" class="usermodify-btn"
										onclick="modifyEmail()">이메일 변경</button>
								</form>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row" style="height: 37px;">전화번호</th>
						<td>
							<div class="ifup-usermodify-name">
								<form action="${pageContext.request.contextPath }/info/modifyPhone.info" method="post" name="modifyPhoneForm">
									<input type="text" name="newPhone" placeholder="전화번호"
										value="${member.userphone }" onkeyup="if(event.keyCode==13){modifyPhone();}" numberOnly> &nbsp;
									<button type="button" class="usermodify-btn"
										onclick="modifyPhone()">전화번호 변경</button>
								</form>
							</div>
						</td>
					</tr>
					<tr>
						<th scope="row">비밀번호변경</th>
						<td>
							<div class="ifup-usermodify-password">
								<form action="${pageContext.request.contextPath }/info/modifyPassword.info" method="post" name="modifyPasswordForm">
									<table class="ifup-usermodify-input-table">
										<tbody>
											<tr>
												<th>현재 비밀번호</th>
												<td><input type="password" name="currentPassword">
												<div class="member__input-guide-area"></div>
												<input type="hidden" name="username" value="${member.username }">
												</td>
											</tr>
											<tr>
												<th>새 비밀번호</th>
												<td><input type="password" name="newPassword">
												<div class="member__input-guide-area"></div></td>
											</tr>
											<tr>
												<th>새 비밀번호 확인</th>
												<td><input type="password" name="confirmPassword">
												<div class="member__input-guide-area"></div></td>
											</tr>
											<tr>
												<td></td>
												<td>
													<button type="button"
														class="usermodify-btn"
														onclick="modifyPassword()">비밀번호 변경</button>
												</td>
											</tr>
										</tbody>
									</table>
								</form>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</section>
		<div class="ifup-usermodify-secession">
			탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요. <a class="ifup-usermodify-secession-btn"
				href="${pageContext.request.contextPath }/Info/secession.jsp">회원탈퇴</a>
		</div>

	</div>

	<jsp:include page="../footer/footer.jsp" />


</body>
<script>
	//숫자만 기입되게 함
	$("input:text[numberOnly]").on("keyup", function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	
	function modifyEmail() {
		let f = document.modifyEmailForm;
		let newEmail = f.newEmail;
		if(newEmail.value ==''){
			alert('변경할 이메일을 입력하세요.');
			return false;
		} else if (newEmail.value == '${member.useremail }'){
			alert('현재 이메일과 같은 이메일을 입력했습니다.');
			return false;
		}
		
		if( !confirm('이메일을 변경하시겠습니까?')) return false;
		
		f.submit();
		
	}
	function modifyPhone() {
		let f = document.modifyPhoneForm;
		let newPhone = f.newPhone;
		if(newPhone.value ==''){
			alert('변경할 전화번호를 입력하세요.');
			return false;
		} else if (newPhone.value == '${member.userphone }'){
			alert('현재 전화번호와 같은 전화번호를 입력했습니다.');
			return false;
		}
		
		if( !confirm('전화번호를 변경하시겠습니까?')) return false;
		
		f.submit();
		
	}
	
	
	function modifyPassword() {
		let f = document.modifyPasswordForm;
		let currentPassword = f.currentPassword;
		let newPassword = f.newPassword;
		let confirmPassword = f.confirmPassword;
		let pwtest = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		
		if(currentPassword.value==''){
			alert("현재 비밀번호를 입력하세요.");
			currentPassword.focus();
			return false;
		} else if ( currentPassword.value!='${member.userpw }'){
			alert("현재 비밀번호가 올바르지 않습니다.");
			currentPassword.focus();
			return false;
		} else if (newPassword.value == ''){
			alert("변경할 비밀번호를 입력하세요.");
			newPassword.focus();
			return false;
		} else if (!pwtest.test(newPassword.value)){
			alert('변경할 비밀번호는8~16자 영문,숫자,특수부호 조합으로 입력해주세요.');
			newPassword.focus();
			return false;
		} else if (newPassword.value =='${member.userpw }'){
			alert('현재 비밀번호와 같은 비밀번호를 입력했습니다.');
			newPassword.focus();
			return false;
		} else if (confirmPassword.value == ''){
			alert("변경할 비밀번호 확인을 입력하세요.");
			confirmPassword.focus();
			return false;
		} else if (newPassword.value != confirmPassword.value){
			alert("변경할 비밀번호가 일치하지 않습니다.");
			confirmPassword.focus();
			return false;
		}
		
		if( !confirm('비밀번호를 변경하시겠습니까?')) return false;
		
		f.submit();
	}

	
	
</script>
</html>