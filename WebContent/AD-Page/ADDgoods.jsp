<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 업로드</title>
</head>
<body>
 <form action="${pageContext.request.contextPath }/AD-Page/ADDgoodsOk.spm" method="post" name="listForm" enctype="multipart/form-data"> 
	<%-- <form action="${pageContext.request.contextPath }/AD-Page/ADDgoodsOk.spm" method="post" name="listForm"> --%>
<!-- 	상품 이미지 및 파일 : <input type="file" name="file1"> <br>	 -->
	상품 이미지 및 파일 : <input type="file" name="file1"> <br>	
	상품이름 : <input type="text" name="description"> <br>
	브랜드 : <input type="text" name="brand"> <br> 
	가격	: <input type="text" name="price"> <br>
	재고	: <input type="text" name="stock"> <br>
	
	<a class="btn" href="javascript:document.listForm.submit()" role="button">[추가]</a>
	</form>
<!-- 	<script type="text/javascript">
		function push(){
			let frm = document.frm;
			frm.submit();
		}
	</script> -->
</body>
</html>