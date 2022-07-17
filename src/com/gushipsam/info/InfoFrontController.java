package com.gushipsam.info;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.ActionForward;

@WebServlet("*.info")
public class InfoFrontController extends HttpServlet{
	
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
		// 마이페이지 - 회원정보 변경 전 본인 확인
		case "/info/confirmpw.info":
			System.out.println("/info/confirmpw.info 도착");
			forward = new ConfirmPwAction().execute(req, resp);
			break;	
			
		// 회원정보 변경 - 이메일 변경
		case "/info/modifyEmail.info":
			System.out.println("/info/modifyEmail.info 도착");
			forward = new ModifyEmailAction().execute(req, resp);
			break;	
		
		// 회원정보 변경 - 전화번호 변경
		case "/info/modifyPhone.info":
			System.out.println("/info/modifyPhone.info 도착");
			forward = new ModifyPhoneAction().execute(req, resp);
			break;	
			
		// 회원정보 변경 - 비밀번호 변경
		case "/info/modifyPassword.info":
			System.out.println("/info/modifyPassword.info 도착");
			forward = new ModifyPasswordAction().execute(req, resp);
			break;	
			
		// 회원 탈퇴
		case "/info/secession.info":
			System.out.println("/info/secession.info 도착");
			forward = new SecessionAction().execute(req, resp);
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


















