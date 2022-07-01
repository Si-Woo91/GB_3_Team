<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 - 회원목록</title>
<link rel="stylesheet" type="text/css" href="../css/Memberlist.css">
</head>
<body>
	<c:set var="memberList" value="${requestScope.memberList }"/>
	<c:set var="memberCnt" value="${requestScope.memberCnt }"/>
	
	
	<div class="wrap">
		<div class="box">
			<h3>회원 리스트</h3><br>
			
			<h5>회원 수 : ${memberCnt }명</h5>
			
			<hr>
			
			<table class="member-list">
				<colgroup>
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="100">
					<col width="100">
				</colgroup>
				
				<thead class="member-list-thead">
					<tr>
						<td>회원아이디</td>
						<td>회원 닉네임</td>
						<td>회원 이메일</td>
						<td>회원 전화번호</td>
						<td>회원 생년월일</td>
					</tr>
				</thead>
				
				<tbody>
					<c:choose>
						<c:when test="${memberList != null and fn:length(memberList) > 0 }">
							<c:forEach var="memberdata" items="${memberList }">
								<tr>
									<th>${memberdata.userid }</th>
									<th>${memberdata.username }</th>
									<th>${memberdata.useremail }</th>
									<th>${memberdata.userphone }</th>
									<th>${memberdata.userdata }</th>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" style="text-align: center;">회원이 없습니다...아무도 없숴..</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		
			<a href="${pageContext.request.contextPath}/AD-Page/adHome.spm">나가기</a>
		
		
		</div>
	</div>
</body>
</html>