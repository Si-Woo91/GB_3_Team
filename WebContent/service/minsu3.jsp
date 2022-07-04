<%@page import="com.gushipsam.app.service.dao.ReplyDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<%@ include file= "../header/header.jsp" %>
<!-- <link href="minsu.css" rel="stylesheet" type="text/css"> -->
<body>
<%
	List<ReplyDTO> replylist = (List) request.getAttribute("replylist");
	
	HashMap<String, String> userdata = (HashMap) request.getAttribute("userdata");
	String username = userdata.get("USERNAME");
	String userpw = userdata.get("USERPW");	
%>
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
				<td id="servicename">
					${service.servicename }
				
				</td>
			</tr>
			<tr class="b">
				<th class="table_title">
					내용
				</th>
				<td class="test2" valign="top" style="height:120px;">
					${service.servicecontent }
			
				<td>
			</tr>	
		</table>
	<table style="border: 0px; width:95%">
			<tr class="a" align="right" valign="middle">
				<td>
				<br><br>
					<!-- 목록 : boardlist.jsp -->
					<a class="link" href="${pageContext.request.contextPath}/service/minsu1.sv">[목록으로 돌아가기]</a>
					<a class="link" href="javascript:deleteService('${sessionScope.sessionId}','${service.servicenum }');">[게시물 삭제]</a>
				</td>
			</tr>
		</table>   
		<hr><br>
			<form action="${pageContext.request.contextPath}/service/AddReply.sv" name="replyForm" method="post">
			<input type="hidden" name="servicenum" value="${service.servicenum }">
			<table border="1" cellspacing="1" style=" background: #eeeeee">
				<tr>
					<td width="200px" >
						&nbsp;<b>댓글</b><br>
						&nbsp;이름 &nbsp; &nbsp; &nbsp; &nbsp;  
							<input name="servicename" id="replyname" maxlength="10" size="10" value="<%=username %>" style="font-size:16px;" readonly><br>
							&nbsp;비밀번호 &nbsp;
						<input name="password" id="pwd" type="password" size="10" value="<%=userpw %>" style="font-size:16px;" readonly>
					</td>
					<td style="padding-left: 10px;">
						<textarea style="width: 680px; height: 85px; resize: none; color:black; font-size:16px;" name="replycontent" id="replycontent"></textarea><br>
						<a class="link" href="javascript:submitForm('${sessionScope.sessionId}')">[등록]</a>
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
									style="background: #eeeeee; text-align: left; border: 0px;width: 680px;height: 85px; color:grey;
									resize: none; font-size:16px;" readonly>${reply.replycontent }</textarea><br>
									<a id="updateReadonlyReply" class="link" href="javascript:updateReply(${reply.replynum });">[수정완료]</a>
									&nbsp;&nbsp;&nbsp;
									<a class="link" href="javascript:updateReadonlyReply('${reply.password }',${reply.replynum } );">[수정하기]</a>
									&nbsp;&nbsp;&nbsp;
									<a class="link" href="javascript:deleteReply('${reply.password }',${reply.replynum });">[댓글 삭제]</a>
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

<%
	pageContext.setAttribute("username",username);
%>
<script>
	$(document).ready(function() {
		if('${username}' == ''){
			$('#replyname').attr('disabled',true);
			$('#pwd').attr('disabled',true);
			$('#replycontent').attr('disabled',true);
		}
	});
	
	function submitForm(userid){
		let f  = document.replyForm;
		
		if(userid == null || userid == ""){
			location.href="${pageContext.request.contextPath}/IDPW/login.jsp";
			return false;
		} else if ($('#replycontent').val() == ''){
			alert("아무 내용도 작성하지 않았습니다.\n작성 내용을 확인해주세요."); return false;
		}
		
		alert("댓글이 등록되었습니다.");
		f.submit();
	}
	


	function deleteReply(password, replynum){
		let pw = prompt("댓글을 삭제하기 위해 귀하의 비밀번호를 입력하세요.");
		if(pw == password){
			document.replyForm.action = "${pageContext.request.contextPath}/service/DeleteReply.sv?replynum="+replynum;
			document.replyForm.submit();
			alert("댓글이 삭제되었습니다.");
		}
		
	}
	
	function updateReply(replynum){
		if( $('#reply'+replynum).is('[readonly]') ) return false;
		document.replyForm.action = "${pageContext.request.contextPath}/service/UpdateReply.sv?replynum="+replynum;
		alert('댓글이 수정 완료되었습니다.');
		document.replyForm.submit();			
	}

	function updateReadonlyReply(password, replynum ){
		let pw = prompt("댓글을 수정하기 위해 귀하의 비밀번호를 입력하세요.");
		if( pw == password ){
			document.getElementById('reply' + replynum).readOnly = false;
			document.getElementById('reply' + replynum).style.color = "black";
			document.getElementById('reply' + replynum).style.backgroundColor = "white";
		} else {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		
	}
	
	function deleteService( userid, servicenum ){
		let userid_writer = $('#servicename').html();
		userid_writer = "김연습";
		if( userid_writer.split('(').length ==1){
			userid_writer = userid_writer.split('(')[0];
		} else {
			userid_writer = userid_writer.split('(')[1];
		}
		
		userid_writer = userid_writer.split(')')[0];
			
		if(userid != userid_writer){
			alert('본인이 작성한 게시물이 아니므로 삭제할 수 없습니다.');
			return false;
		} else{
			if(! confirm('게시물을 삭제하시겠습니까?')) return false;
			
			let replycount = 0;
			<c:forEach var="reply" items="${replylist }">
			  	replycount++;
			</c:forEach>
			
			if( !( "${replylist }" == null ||  replycount == 0 )){
				let deleteall = confirm('해당 게시물에는 댓글이 게시되어 있습니다.\n전부 삭제하시겠습니까?');
				if(! deleteall) return false;
			}
			
			location.href="${pageContext.request.contextPath}/service/Delete.sv?svnum=" + servicenum + "&replycount="+replycount;
		}
	}
	
	

</script> 
</html>