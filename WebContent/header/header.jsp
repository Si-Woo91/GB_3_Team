<%@page import="com.gushipsam.shoppingmall.dao.ShoppingMallDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼</title>
<script type="text/javascript" src="../js/slick.min.js"></script> 
<script type="text/javascript" src="../js/slide.js"></script> 
<link rel="stylesheet" type="text/css" href="../css/main_css.css">
<link rel="stylesheet" type="text/css" href="../css/slick.css">
	<link rel="stylesheet" type="text/css" href="../css/header.css">
</head>
<body>
<%
   ShoppingMallDTO sdto = new ShoppingMallDTO();
%>

   <div class= header>
      <!-- 로고 -->
      <div class="login_search">
         <a href="#"onclick="location.href='../main/main.jsp'" class= logo><img src= ../img/logo.png></a>
          <!-- 로그인, 로그아웃, 장바구니, 고객센터 -->
          <ul class = nav1>
                <li class= service><a href= "../center(KMS)/minsu1.jsp">고객센터</a></li>
				<li class= basket><a href= "${pageContext.request.contextPath }/payment/cart.pay">장바구니</a></li>
            <c:choose>
               <c:when test="${sessionId eq null}">
                  <li class= login>
                     <a href="${pageContext.request.contextPath}/JSP/login.jsp">로그인</a>
                  </li>
               </c:when>
            <c:otherwise>
                  <li class= login>
                     <a href="${pageContext.request.contextPath}">마이페이지</a>
                  </li>
                  <li class= login>
                      ${ sdto.getUsername } 님 환영합니다.&nbsp;&nbsp;&nbsp;
                      <a href="${pageContext.request.contextPath}/main/main.jsp">로그아웃<%session.invalidate();%></a>
                  </li>
            </c:otherwise>
            </c:choose>
         </ul>
         <!-- 검색창 -->
         <div class="search1">
            <input type="text" placeholder="Search" class= search>
            <a class="btn" href="serch.html" role="button">
               <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
            </a>
         </div>
         <!-- 카테고리 -->
         <div class="category">
            <div class= nav2> 
               <ul>
                  <li><a href="상품페이지 경로" class="a">냉장고</a>
                     <ul>
                        <li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
                        <li><a href="상품페이지 경로" style="color:red;">LG</a></li>
                     </ul>
                  </li>
                  <li><a href="상품페이지 경로" class="a">세탁기</a>
                     <ul>
                        <li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
                        <li><a href="상품페이지 경로" style="color:red;">LG</a></li>
                     </ul></li>
                  <li><a href="" class="a">TV</a>
                     <ul>
                        <li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
                        <li><a href="상품페이지 경로" style="color:red;">LG</a></li>
                     </ul></li>
                  <li><a href="" class="a">에어컨</a>
                     <ul>
                        <li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
                        <li><a href="상품페이지 경로" style="color:red;">LG</a></li>
                        <li><a href="상품페이지 경로" style="color:black;">WINIA</a></li>
                     </ul></li>
      
                  <li><a href="상품페이지 경로" class="a">컴퓨터</a>
                     <ul>
                        <li><a href="상품페이지 경로" style="color:blue;">SAMSUNG</a></li>
                        <li><a href="상품페이지 경로" style="color:red;">LG</a></li>
                        <li><a href="상품페이지 경로" style="color:black;">APPLE</a></li>
                     </ul>
                  </li>
               </ul>
            </div>
         </div>
      </div>
   </div>
</body>
</html>