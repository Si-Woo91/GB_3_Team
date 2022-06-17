<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>연매출구십3조-구십삼-회원정보수정</title>
<link rel="stylesheet" type="text/css" href="..\css\User-InfoUp.css">
</head>
<body>
	<header> <jsp:include page="..\common\header.jsp"/> </header>

<!-- 본문 포장지 -->
	<div class="body-wrap">
		<section class="member-container">
			<h1 class="usermodify-title">회원정보수정</h1>
		<table class="usermodify-table">
			<tbody>
				<tr>
				    <th scope="row" style="height: 37px;">아이디</th>
					<td>
						<div class="usermodify-id">
							<span class="usermodify-id-id">testId</span>
						</div>
					</td>
				</tr>
				<tr>
				    <th scope="row" style="height: 37px;">이메일</th>
					<td>
						<div class="usermodify-email">
							<span class="usermodify-email-email">testEmail</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" style="height: 37px;">이름</th>
					<td>
						<div class="usermodify-name">
							<span class="usermodify-name-name">testName</span>
						</div>
					</td>
				</tr>
				<tr>
					<th scope="row" style="height: 37px;">전화번호</th>
					<td>
						<div class="usermodify-name">
							<span class="usermodify-phone-phone">testPhoneNum</span>
						</div>
					</td>
				</tr>
				<tr>
                <th scope="row">비밀번호변경</th>
                <td>
                <div class="usermodify-password">
                	<form action="#" method="post" name="info-PWchange-Form">
					    <table class="usermodify-input-table">
					        <tbody><tr>
					            <th> 현재 비밀번호 </th>
					            <td>
					                <input type="password" class="usermodify-currentpassword-tf"><div class="member__input-guide-area"></div>
					            </td>
					        </tr>
					        <tr>
					            <th> 새 비밀번호 </th>
					            <td>
					                <input type="password" class="usermodify-newpassword-tf"><div class="member__input-guide-area"></div>
					            </td>
					        </tr>
					        <tr>
					            <th>  비밀번호 다시 입력 </th>
					            <td>
					                <input type="password" class="usermodify-newpassword-confirm-tf"><div class="member__input-guide-area"></div>
					            </td>
					        </tr>
					        <tr>
					            <td></td>
					            <td>
					                <button type="button" class="usermodify-password-submit" onclick="PWsendit()">비밀번호 변경</button>
					            </td>
		       				</tr>
		    				</tbody>
		    			</table>
		    			<script src="info-change.jsp"></script>
    				</form>
				</div>
			</td>
            </tr>
			</tbody>
		</table>		
		</section>
	<div class="usermodify-secession">
        탈퇴를 원하시면 우측의 회원탈퇴 버튼을 눌러주세요.
        <a class="usermodify-secession-btn" href="secession.jsp">회원탈퇴</a>
    </div>
    
    <div class="usermodify-foot">
        <button type="button" class="usermodify-cancel" onclick="location.href='..\\lobby\\Mypage.jsp'">나가기</button>
    </div>
	</div>
	
	<footer> <jsp:include page="..\common\footer.jsp"/> </footer>
	
	
</body>
</html>