<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
</head>
<style>
* {
	margin : 0;
	padding : 0;
	padding-bottom : 130px;
 }
.content{
	margin-top: 14%;
	padding-bottom: 12%;
    padding-left: 14%;
    padding-right: 14%;
    padding-top: 12%;
    height : 550px;
}

 li {
 	list-style: none;
 }
.img_prod {
 	width : 91%;
 	height: 110%;
 	display: block;
 	margin:auto;
 }
h2 {
	text-align: center;
	font-size: 30px;
	margin: 20px 0 20px 0;
 }	
 hr {
 	border: double 4px orange;
 	margin: 0 7% 0 7%;
 }
.items {
	width: 28%;
	float: left;
 	margin: 4% 2% 10% 2%; 
 	border: 1px solid #ddd;
 	border-radius: 8px;
 	box-shadow: 2px 3px 2px 0 #d8d8d8;
 	padding: 3px;
}
.name {
	font-weight: bold;
	margin-top: 20px;
	text-align: center;
}
.price {
	text-align: center;
	padding: 5px;
}
</style>
<body>
	<%@ include file= "../header/header.jsp" %>
	
	<c:set var="searchlist" value="${requestScope.searchlist }"/>
	
	<div class="content">
		<%-- <h2 >${searchtext} 에 대한 검색결과</h2> --%>
			<br/>
			<div class="catg">
		<c:choose>
			<c:when test="${searchlist != null and fn:length(searchlist) > 0 }">
			<!--  검색결과가 있을 때 -->
				<c:forEach var="search" items="${searchlist }">
			<ul class="items">
				<li><a href=""><img src="ac1.png" class="img_prod" alt="" 
					width="280" height="280"></a></li>
				<li class="name"> ${search.gName } </li>
				<li class="price">${search.gPRICE }원</li>
			</ul>
				</c:forEach>
				
				</c:when>
					<c:otherwise>
					<!-- 게시글 작성 : 글이 없는 경우 -->
					<tr style="height: 50px">
						<td colspan="5" style="text-align: center;">등록된 게시물이 없습니다.</td>
					</tr>
				</c:otherwise>
		</c:choose>
		</div>
	</div>
		<%@ include file= "../footer/footer.jsp" %>
		<script>
			alert(${searchlist});
		</script>
</body>
</html>