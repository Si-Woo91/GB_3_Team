<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구십삼</title>
<link rel="stylesheet" type="text/css" href="../header/header.css">
</head>
<body>
	<div class= header>
			<div class="login_search">
			<a href="#" onclick="location.href='../main/main.jsp'" class= logo><img src= ../img/logo.png></a>
			<ul class = nav1>
				<li class= service><a href= "center">고객센터</a></li>
				<li class= basket><a href= "${pageContext.request.contextPath }/payment/cart.pay">장바구니</a></li>
				<li class= login><a href= "login">로그인</a></li>
			</ul>
			<br>
		<div class="search1">
			<input type="text" placeholder="Search" class= search>
			<a class="btn" href="serch.html" role="button">
			<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
			</a>
		</div>
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
	<script>

/* 	<a href="#" onclick="delchk();">삭제하기</a>
	
	<script type="text/javascript">
	function delchk(){
	    if(confirm("삭제하시겠습니까?")){
	        location.href = "write_del_ok.jsp?num=1";
	        return true;
	    } else {
	        return false;
	    }
	} */
	</script>
</body>
</html>