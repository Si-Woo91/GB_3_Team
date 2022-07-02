package com.gushipsam.app.service;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.ActionForward;
import com.gushipsam.app.service.DeleteAction;

@WebServlet("*.sv")
public class ServiceFrontController extends HttpServlet{
	
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
			throws ServletException, IOException{
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		switch(requestURI) {
			case "/service/minsu1.sv":
				System.out.println("321321");
				forward = new ServiceListAction().execute(req, resp); 
				break;
			case "/service/minsu2.sv":
				forward = new WriteServiceAction().execute(req, resp); 
				break;
			case "/service/minsu2Ok.sv":
				System.out.println("12");
				forward = new minsu2OkAction().execute(req, resp);
				break;
			case "/service/minsu3.sv":
				System.out.println("13");
				forward = new minsu3Action().execute(req, resp);
				break;
			case "/service/AddReply.sv":
				System.out.println("14");
				forward = new AddReplyAction().execute(req, resp);
				break;
			case "/service/UpdateReply.sv":
				System.out.println("15");
				forward = new UpdateReplyAction().execute(req, resp);
				break;
			case "/service/DeleteReply.sv":
				System.out.println("16");
				forward = new DeleteReplyAction().execute(req, resp);
				break;
			case"/service/Delete.sv":
				forward = new DeleteAction().execute(req,resp);
				break;
		}
		
		
				
		if ( forward != null ) {
			if ( forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
				System.out.println("17");
			}else {
				RequestDispatcher disp = req.getRequestDispatcher(forward.getPath());
				disp.forward(req, resp);
				}
		}
	}
}
