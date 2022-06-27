<%@page import="com.gushipsam.shoppingmall.dao.ShoppingMallDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	ShoppingMallDAO sdao = new ShoppingMallDAO();
	
	if( !sdao.login(userid, userpw) ){
		// 아이디, 비밀번호가 db테이블에 잇을때
		out.print("ok");
	}else{
		// 아이디, 비밀번호가 db테이블에 없을때
		out.print("non-ok");
	}
%>

