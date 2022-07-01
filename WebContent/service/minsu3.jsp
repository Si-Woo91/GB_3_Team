<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼 고객센터</title>
<style> 
	table{
		margin: 0 auto;
		width: 900px;
	}
</style>
</head>
<%@ include file= "../header/header.jsp" %>
<!-- <link href="minsu.css" rel="stylesheet" type="text/css"> -->
<body>
<div style="height:50px;"></div>
<div id = 'service'>
	<c:set var="service" value="${requestScope.service }"/>
	<c:set var="replylist" value="${requestScope.replylist }"/>
<div id='service'>
<div class=test>
	<div class=title2>문의내역</div>
		<table class="table-main" border="3" cellspacing="3" bordercolor="#eeeeee">
			<tr class="a">
				<th class="table_title">
					제목
				</th>
				<td>
					${service.servicetitle }
							
				</td>
			</tr>
			<tr class="a">
				<th class="table_title">
					작성자
				</th>
				<td>
					${service.servicename }
				
				</td>
			</tr>
			<tr class="b">
				<th class="table_title">
					내용
				</th>
				<td class="test2" valign="top">
					${service.servicecontent }
			
				<td>
			</tr>	
		</table>
	<table style="border: 0px; width:95%">
			<tr class="a" align="right" valign="middle">
				<td>
				<br><br>
					<!-- 목록 : boardlist.jsp -->
					<a href="${pageContext.request.contextPath}/service/minsu1.sv">[목록]</a>
					<a href="${pageContext.request.contextPath}/service/Delete.sv?svnum=${service.servicenum}" 
						onclick="alert('게시물이 삭제 되었습니다');">[삭제]</a>
				</td>
			</tr>
		</table>   
		<hr><br>
			<form action="${pageContext.request.contextPath}/service/AddReply.sv" name="replyForm" method="post">
			<input type="hidden" name="servicenum" value="${service.servicenum }">
			<table border="1" cellspacing="1" style=" background: #eeeeee">
				<tr>
					<td align="center" width="200px" >
						댓글<br>
						이름 &nbsp;&nbsp;&nbsp;<input name="servicename" maxlength="10" size="10"><br>
						비밀번호<input name="password" type="password" size="10">
					</td>
					<td style="padding-left: 10px;">
						<textarea style="width: 680px; height: 85px; resize: none; color:#C3BDBB" name="replycontent"></textarea><br>
						<a href="javascript:document.replyForm.submit()">[등록]</a>
					</td>
				</tr>
			</table>
			
		 	<!-- 댓글 리스트 -->
		
			<table border="1" cellspacing="1" style="background: #eeeeee;">
				<c:choose>
					<c:when test="${replylist != null and fn:length(replylist) > 0 }">
						<c:forEach var="reply" items="${replylist }">
							<tr>
								<td align="center" width="200px;">${reply.servicename }</td>
								<td valign="top" style="padding-left: 10px;">
									<textarea id="reply${reply.replynum }" name="reply${reply.replynum }" 
									style="background: #eeeeee; text-align: left; border: 0px;width: 680px;height: 85px;resize: none;" readonly>${reply.replycontent }</textarea><br>
									<a href="javascript:updateReply(${reply.password },${reply.replynum } );">[수정]</a>
									&nbsp;&nbsp;&nbsp;
									<a href="javascript:updateReadonlyReply(${reply.replynum });">[수정하기]</a>
									&nbsp;&nbsp;&nbsp;
									<a href="javascript:deleteReply(${reply.password },${reply.replynum });">[삭제]</a>
								</td>
							</tr>
						</c:forEach> 
					</c:when>	
					<c:otherwise>
						<tr><br>
							<td align="center" >댓글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>			
		</form>
	</div>
</div>
</div>
<%@ include file= "../footer/footer.jsp" %>
</body>

<script>
	function deleteReply(password, replynum){
		let pw = prompt("댓글 비밀번호를 입력하세요.");
		if(pw == password){
			document.replyForm.action = "${pageContext.request.contextPath}/service/DeleteReply.sv?replynum="+replynum;
			document.replyForm.submit();
		}
		
	}
	
	function updateReply(password, replynum){
		let pw = prompt("댓글 비밀번호를 입력해주세요!");
		if( pw == password ){
			document.replyForm.action = "${pageContext.request.contextPath}/service/UpdateReply.sv?replynum="+replynum;
			document.replyForm.submit();			
		}
	}

	function updateReadonlyReply( replynum ){
		document.getElementById('reply' + replynum).readOnly = false;
	}
	
</script> 
</html>