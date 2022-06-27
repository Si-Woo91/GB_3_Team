package com.gushipsam.shoppingmall;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.user.UserJoinAction;
import com.gushipsam.shoppingmall.user.UserLoginOkAction;
import com.gushipsam.shoppingmall.user.UserLogoutOk;


@WebServlet("*.spm")
public class ShoppingmMallFrontController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp)  
			throws ServletException, IOException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		System.out.println("requestURI : " + requestURI);
		
		switch (requestURI) {
		case "/JSP/login.spm" :
			forward = new UserJoinAction().execute(req, resp);
			break;
			
		case "/JSP/main/main.spm" : 
			try {
				forward = new UserLoginOkAction().execute(req, resp);
			} catch (Exception e) {
			}
			break;
		
			
			
		} 
		
		
		
		// 일괄처리
		if( forward != null ) {
			if( forward.isRedirect() ) {	// redirect
				resp.sendRedirect(forward.getPath());
			} else {						// forward
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
			}
		}
		
	}
	
}


















