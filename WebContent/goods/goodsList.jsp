<%@page import="java.util.List"%>
<%@page import="com.gushipsam.goods.dao.goodsDTO"%>
<%@page import="java.text.DecimalFormat"%> 	<!--  숫자에 콤마 붙이기 위한 숫자포맷 라이브러리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <c:set var="goodsList" value="${requestScope.goodsList }"/> --%>
<%
	DecimalFormat df = new DecimalFormat("###,###"); // df.format(숫자)로 콤마 보이게 가능
	List<goodsDTO> goodsList = (List<goodsDTO>) request.getAttribute("goodsList"); 
	
	String foldername = null;
	
	
	if (goodsList.get(0).getgCatg().equals("냉장고")){
		foldername= "fridge";
	} else if (goodsList.get(0).getgCatg().equals("세탁기")){
		foldername= "washer";
	} else if (goodsList.get(0).getgCatg().equals("TV")){
		foldername= "tv";
	} else if (goodsList.get(0).getgCatg().equals("에어컨")){
		foldername= "ac";
	} else if (goodsList.get(0).getgCatg().equals("컴퓨터")){
		foldername= "pc";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼 상품목록</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="shortcut icon" href="gu_icon.ico">	
<link rel="stylesheet" type="text/css" href="goodsList.css">
</head>
<%@ include file= "../header/header.jsp" %>
<body>
	<section>	
		<div class="content">
			<div id="catg">
				<h2> <%= goodsList.get(0).getgCatg()%></h2>
				<hr/>
				 
				<% for (goodsDTO g : goodsList ){ %>
					<li class="items" border="1" align="center">
					<!-- gID값을 상세페이지로 넘겨줌 -->
						<a class="itemlink" href="${pageContext.request.contextPath }/goods/goodsDetail.goods?gID=<%= g.getgID() %>" >
							<img src="${pageContext.request.contextPath }/img/<%=foldername %>/<%= g.getgImgs()%>" class="img_prod" width="300" height="300"><br>
							<span class="name"><%= g.getgName() %></span><br>
							<span class="price"><%= df.format(g.getgPRICE()) %> 원</span><br>
						</a>
					</li>
				<% } %>
				
			</div>
		</div>		
		<br>
	</section>
	 <%@ include file= "/footer/footer.jsp" %>
</body>
</html>
