<%@page import="java.util.List"%>
<%@page import="com.gushipsam.goods.dao.goodsDTO"%>
<%@page import="java.text.DecimalFormat"%> 	<!--  숫자에 콤마 붙이기 위한 숫자포맷 라이브러리 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%-- <c:set var="goodsList" value="${requestScope.goodsList }"/> --%>
<%
	DecimalFormat df = new DecimalFormat("###,###"); // df.format(숫자)로 콤마 보이게 가능
	List<goodsDTO> goodsList = (List<goodsDTO>) request.getAttribute("goodsList");
	
	//검색결과 중 상품이름이 길어서 박스 크기가 큰 상품은 중간에 있으면 상품간격이 늘어나므로 맨 아래로 보내기
	int maxlen = 0;
	for ( int i = 0; i < goodsList.size(); i++){
		goodsDTO g_ = goodsList.get(i);
		if( g_.getgName().length() > maxlen){
			maxlen = g_.getgName().length();
			goodsList.remove(i);
			goodsList.add(g_);
		}
	}
	int goodsCnt = (Integer) request.getAttribute("goodsCnt"); 
	String searchtext = (String) request.getAttribute("searchtext"); 
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
		<c:choose>
        <c:when test="${goodsList != null and fn:length(goodsList) > 0 }">
		<div class="content">
			<div id="catg">
				<h2> <em><%=searchtext %></em> 검색결과 (<%=goodsCnt%>개)</h2>

				<%
				for (goodsDTO g : goodsList ){
					
					String foldername = null;
					
					switch( g.getgCatg() ){
						case "냉장고": foldername = "fridge"; break;
						case "세탁기": foldername = "washer"; break;
						case "TV": foldername = "tv"; break;
						case "에어컨": foldername = "ac"; break;
						case "컴퓨터": foldername = "pc"; break;
					}
					
				%>
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
		</c:when>
		<c:otherwise>
			<div class="content">
			<div id="catg">
				<h2> <em><%=searchtext %></em> 검색결과 (<%=goodsCnt%>개)</h2>
			</div>
		</div>
		<div style="margin-top: 50px; text-align:center; font-size:30px; font-weight:bold;">
				검색 결과가 없습니다.</div>
		</c:otherwise>
		</c:choose>	
		<br>
	</section>
	 <%@ include file= "/footer/footer.jsp" %>
</body>
<script>
$(document).ready(function() {
	$('#searchtext').val( '${requestScope.searchtext}');
});
</script>
</html>
