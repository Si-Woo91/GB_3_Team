package com.gushipsam.payment;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;

@WebServlet("*.pay")
public class PaymentFrontController extends HttpServlet{
	
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
			throws IOException, ServletException {
		String requestURI = req.getRequestURI();
		ActionForward forward = null;
		
		switch (requestURI) {
			case "/payment/cart.pay":
				System.out.println("/payment/cart.pay 도착");
				
//				String del_cID_ = req.getParameter("delcid");
//				if (del_cID_ == null || del_cID_ == "") {
//					forward = new CartDelAction().execute(req, resp, del_cID_);
//				} else {
					forward = new CartListAction().execute(req, resp);
//				}
				break;
			case "/payment/checkout.pay":
				System.out.println("/payment/checkout.pay 도착");
				forward = new CheckoutListAction().execute(req, resp);
				break;
		}
	
	
		
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














