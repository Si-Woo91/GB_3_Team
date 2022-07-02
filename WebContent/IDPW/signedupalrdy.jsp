<%@page import="com.gushipsam.shoppingmall.dao.ShoppingMallDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼 회원가입 여부 확인</title>
<link rel="shortcut icon" href="../img/gushipsam_icon.ico">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<link href="../css/id.css" rel="stylesheet" type="text/css">
<body>
	<div class="roundblock">
		<div id="joincheckresult">
			<div style="height: 50px"></div>
			<div style="height: 50px;">
				<a href="${pageContext.request.contextPath}/main/main.jsp"> <img
					src="${pageContext.request.contextPath}/img/logo_short.png"
					style="height: 100%">
				</a>
			</div>
			<div style="height: 30px"></div>
			<div style="color: black; font-weight: bold; font-size: 30px;">
				<span style="color: orange;">${username }</span> 님!<br> 이미 구십삼
				회원으로 등록되어 있습니다.
			</div>
			<div style="height: 20px"></div>
			<div style="color: grey; font-weight: bold; font-size: 18px;">
				회원아이디(
				<% List<ShoppingMallDTO> user_id = (List) request.getAttribute("user_id");
					int listlen = user_id.size();
				
				if( listlen == 1 ){
					String userid = user_id.get(0).getUserid();
					int len = userid.length();%>
					<%= userid.substring(0,len-2) %>**
				<%} else{
					int count = 0;
					for (ShoppingMallDTO sdto : user_id){
					
						String userid = sdto.getUserid();
						int len = userid.length();%>
						<%= userid.substring(0,len-2) %>**
						<% if(count != listlen-1) %> ,
						<% count++;
					}
				}%>

				)로 로그인하시거나<br> 아이디 찾기를 진행해주세요.
			</div>
			<div style="height: 50px"></div>
		</div>
</body>
</html>