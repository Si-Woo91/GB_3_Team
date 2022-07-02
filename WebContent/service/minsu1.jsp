<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="minsu.css" rel="stylesheet" type="text/css"> -->
<!-- <link href="../../header/header.jsp" rel="stylesheet" type="text/css">
 -->
 <meta charset="UTF-8">
<title>구십삼 고객센터</title>
</head>
<%@ include file= "../header/header.jsp" %>
<body>
<div id='service'>
	<c:set var="serviceList" value="${requestScope.serviceList }"/>
	<!-- 안쓸수도잇음 -->
	<c:set var="totalCnt" value="${requestScope.totalCnt }"/>
	<!-- 페이징 처리 부분 -->	
	<c:set var="nowPage" value="${requestScope.nowPage }"/>
	<c:set var="totalPage" value="${requestScope.totalPage }"/>
	<c:set var="startPage" value="${requestScope.startPage }"/>
	<c:set var="endPage" value="${requestScope.endPage }"/>

		<div class="div_basic">
			문의내역
		</div>

	<div>
		<table class="table_main1" border="3" cellspacing="2" bordercolor="#eeeeee">
			<tr>
				<th style="background-color:#eeeeee; text-align: center; width: 50px;">번호</th>			
				<th style="background-color:#eeeeee; text-align: center; width: 100px;">작성자</th>			
				<th style="background-color:#eeeeee; text-align: center; width: 200px;">날짜</th>			
				<th style="background-color:#eeeeee; text-align: center; width: 500px;">제목</th>			
			</tr>
		<c:choose>
			<c:when test="${serviceList != null and fn:length(serviceList) > 0 }">	
			<!-- 게시글 작성 : 글이 있는 경우 -->
			<c:forEach var="service" items="${serviceList }">
				<tr align="center" valign="middle">
					<td height="23px;">${service.servicenum }</td>
					<td height="23px;">${service.servicename }</td>
					<td height="23px;">${service.servicedate }</td>
					<td height="23px;">
						<a class="link" href="${pageContext.request.contextPath }/service/minsu3.sv?servicenum=${service.servicenum}">
							${service.servicetitle }
						</a>
					</td>
					</tr>
			</c:forEach>
			</c:when>
			<c:otherwise>
			<!-- 게시글 작성 : 글이 없는 경우 -->
			<tr style="height: 50px">
				<td colspan="5" style="text-align: center;">등록된 게시물이 없습니다.</td>
			</tr>
			</c:otherwise>
		</c:choose>
		</table>
		<br>
		
		<table style="border: 0px; width: 100%;">
			<tr align="center" valign="middle">
				<td>
					<c:if test="${nowPage > 1 }">
						<a class="link" href="${pageContext.request.contextPath }/service/minsu1.sv?page=${nowPage-1}">[&lt;]</a>
					</c:if>
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<c:choose>
							<c:when test="${i == nowPage }"><b>[${i }]</b></c:when>
							<c:otherwise>
								<a class="link" href="${pageContext.request.contextPath }/service/minsu1.sv?page=${i}">[${i }]</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>					
					<c:if test="${nowPage < totalPage }">
						<a class="link" href="${pageContext.request.contextPath }/service/minsu1.sv?page=${nowPage+1}">[&gt;]</a>
					</c:if>
				</td>
			</tr>
		</table>
		<table style="border: 0px; width: 70%;">
			<tr align="right" valign="middle">
				<td><a class="link" href="${pageContext.request.contextPath }/service/minsu2.sv">[글쓰기]</a></td>
			</tr>
		</table>
	</div>
</div>
		<%@ include file= "../footer/footer.jsp" %>
</body>

</html>