<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 세션 초기화
	/* session.invalidate(); */
	/* System.out.println("sessionInitialization : " + session.getAttribute("sessionId")); */
	session.removeAttribute("sessionId");
	/* System.out.println(session.getAttribute("sessionId")); */
	response.sendRedirect("main.jsp");
%>
<script>
// 	location.href = 'main.jsp';
</script>
</body>
</html>