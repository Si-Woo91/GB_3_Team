<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String gCatg = request.getParameter("gCatg"); 
	String gImgl = request.getParameter("gImgl"); 
	
	
	String foldername = null;

	if (gCatg.equals("냉장고")){
		foldername= "fridge";
	} else if (gCatg.equals("세탁기")){
		foldername= "washer";
	} else if (gCatg.equals("TV")){
		foldername= "tv";
	} else if (gCatg.equals("에어컨")){
		foldername= "ac";
	} else if (gCatg.equals("컴퓨터")){
		foldername= "pc";
	}
	
	%>
	<section id="container">
		<!-- 제품설명 -->
		<div class="prod_img">
			<img src="${pageContext.request.contextPath }/img/<%=foldername %>/<%= gImgl%>" width="750">
		</div>
	</section>
</body>
</html>