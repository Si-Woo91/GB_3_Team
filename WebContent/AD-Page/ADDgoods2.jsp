<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첨부 업로드</title>
</head>
<body>
	<form action="<%=application.getContextPath()%>/NewFile.spm" method="post" enctype="multipart/form-data">
	상품이름 : <input type="text" name="description"> <br>
	브랜드 : <input type="text" name="brand"> <br> 
	가격   : <input type="text" name="price"> <br>
	파일 1 : <input type="file" name="file1"> <br>	
	파일 2 : <input type="file" name="file2"> <br>	
	
	<input type="submit" value="전송">
	</form>
	
</body>
</html>