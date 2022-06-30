<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/secession.css"> -->
</head>
<body>
	<header> <jsp:include page="../header/header.jsp"/> </header>
	<span class="secession">
	<div class="wrap">
		<header class="secession-title"> <h1 class="title-text">회원 탈퇴</h1> </header>
		<div class="secession-text">
			<p><span>회원님 구십삼 서비스를 이용하는데 불편함이 있으셨나요?</span></p>
			"1)이용 불편 및 각종 문의 사항은 고객센터로 문의주시면 성심 성의껏 답변 드리겠습니다."<br>
			"- 전화 문의: 1577-0093 (366일 오전 10시 ~ 오후 6시)"
		</div>
		<div class="secession-box">
			<div class="secession-box-text">
				<section>
					<h1>1. 회원탈퇴 전, 유의사항을 확인해 주시기 바랍니다.</h1>
						<ul>
							<li>
							- 회원탈퇴 시 회원전용 웹 서비스 이용이 불가합니다.
							</li>
							<li>
							- 거래정보가 있는 경우, 전자상거래 등에서의 소비자 보호에 관한 법률에 따라 계약 또는 청약철회에 관한 기록, 대금결제 및 재화 등의 공급에 관한 기록은 5년동안 보존됩니다.
							</li>
							<li>
							- 회원탈퇴 후 쿠팡 서비스에 입력하신 상품문의 및 후기, 댓글은 삭제되지 않으며, 회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제처리가 원천적으로 불가능 합니다.<br>
							상품문의 및 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청하시기 바랍니다.
							</li>
							<li>이미 결제가 완료된 건은 탈퇴로 취소되지 않습니다.</li>
						</ul>
				</section>
			</div>
				<div class="secession-confirm">
					<label class="secession-confirm-checkbox">
						<input class="secession-checkbox" type="checkbox" name="secessioncheckbox" data-type="checked" data-err="alert" data-err-msg="탈퇴 처리사항 안내 확인에 동의해주세요.">
						<span>상기 구십삼 회원탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.</span>
					</label>
				</div>
		
		</div>
		<div class="secession-validate-user">
            <p class="secession-validate-user-msg">
                <strong>보안을 위해 회원님의 이름과 계정 이메일 및 비밀번호를 확인 합니다.</strong>
            </p>
            <label>
                <span>이름 : </span>
                <input class="secession-validate-user-name" type="text" readonly="" value="#" style="background-color: #eae0ed; border: 1px solid black;">
            </label>
            <label>
                <span>이메일 : </span>
                <input class="secession-validate-user-email" type="text" readonly="" value="ksh980326@naver.com" style="background-color: #eae0ed; border: 1px solid black;">
            </label>
            <label>
                <span>비밀번호 : </span>
                <input class="secession-validate-user-password" type="password" id="password" name="password" data-err-target="alert" data-err-msg="비밀번호를 입력하세요." >
            </label>
            <button type="submit" class="secession-validate-user-submit">본인확인 & 회원탈퇴</button>
        </div>
	</div>
	</span>

	<footer> <jsp:include page="../footer/footer.jsp"/> </footer>
</body>
</html>