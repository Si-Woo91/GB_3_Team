<%@page import="com.gushipsam.shoppingmall.dao.ShoppingMallDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	ShoppingMallDAO sdao = new ShoppingMallDAO();
	
	if(!sdao.checkId(userid)){
		// 중복된 아이디가 없을경우
		out.print("ok");
	} else {
		// 중복된 아이디가 있을 경우
		out.print("not-ok");
	}
%>

