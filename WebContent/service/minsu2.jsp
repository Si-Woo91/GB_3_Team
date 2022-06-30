<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> --%>
<!DOCTYPE html>
<html>
<head>
<!-- <link href="minsu.css" rel="stylesheet" type="text/css"> -->
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<%@ include file= "../header/header.jsp" %>
<body>
<div style="height:50px;"></div>
<div id='service'>
	<div class="title">문의하기</div>
		<form action="${pageContext.request.contextPath }/service/minsu2Ok.sv" method="post" name="serviceForm">
	<div class="oo">
	
		<table class="table-main" border="3" cellspacing="1" bordercolor="#eeeeee">
			<tr class="a">
				<th class="table_title">
					제목
				</th>
				<td>
					<input name="servicetitle"  placeholder="제목을 입력하세요">
				</td>
			</tr>
			<tr class="a">
				<th class="table_title">
					작성자
				</th>
				<td>
					<input name="servicename"  placeholder="이름을 입력하세요">
				</td>
			</tr>

			<tr class="b">
				<th class="table_title">
					내용
				</th>
				<td>
					<textarea name="servicecontent" cols= "70" rows="20" placeholder="내용"></textarea>
				<td>
			</tr>
		</table>
			<tr class="c">	
					<td>
						<a href="javascript:document.serviceForm.submit()">[등록]</a>&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/service/minsu1.sv">[목록]</a>
					</td>
			</tr>
		</div>
		</form>
	</div>
	<%@ include file= "../footer/footer.jsp" %>
</body>

</html>