<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
	String result = (String) request.getAttribute("result");
	System.out.println(result);
	out.print(result);
%>
