<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구심삽 푸터</title>
<link rel="shortcut icon" href="/img/gushipsam_icon.ico">
<style>
	/*----------------------공통 스타일 시작------------------------------*/
	body {
		margin: 0 auto;
	}
	
	@font-face { 													/* 폰트 설정 (회의후 변경예정) */
		font-family: 'GowunDodum-Regular';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunDodum-Regular.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	
	@font-face {
		font-family: 'GowunBatang-Bold';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/GowunBatang-Bold.woff')
			format('woff');
		font-weight: normal;
		font-style: normal;
	}
	/*----------------------공통 스타일 끝------------------------------*/
	
	
	/*----------------------푸터만의 스타일 시작------------------------------*/
	#footer *{																/* 폰트 설정 (회의후 변경예정) */
		font-family: 'GowunDodum-Regular';	
	}
	
	#footer {
		width: 100%;
		height: 130px;
		bottom: 0px;
		border-top: 1px solid #c4c4c4;
		padding-top: 15px;
		color: #FFFFFF;
		font-size: 15px;
		display: flex;
		background-color: #383b40;
		margin: auto;
	}
	
	#footer a {
		display: inline-block;
		margin: 0 20px 10px 210px;
		color: #808080;
		font-size: 17px;
		text-decoration: none;							/*헤더와 일관성을 위해 추가 - 찬우 */
	}
	
	#footer a:visited {
		color: #808080;
	}
	
	#footer p {
		margin-top: 0;
		margin-bottom: 0;
	}
	
	#footer p span {
		display: inline-block;
		margin-left: 100px;
	}
	
	#footer nav {
		text-align: right;
	}
	/*----------------------푸터만의 스타일 끝------------------------------*/
</style>
</head>
<body>
	<span id="footer">
		<p>
			<span>상호명 : 구십삼</span><br> <span>이메일 :
				rlaeogns0706@gmail.com</span><br> <span>주소 : 테헤란로 3길 어디어디어디</span><br>
			<span>Copyright 2022. cocoder. All Rights Reserved.</span>
		</p>
		<nav>
			<a href="" target='blank'>Blog</a><br /> <a href="" target='blank'>Github</a>
		</nav>
	</span>
</body>
</html>