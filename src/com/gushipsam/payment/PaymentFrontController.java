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
			//특정 회원에 대한 장바구니 조회
			case "/payment/cart.pay":
				System.out.println("/payment/cart.pay 도착");
				forward = new CartListAction().execute(req, resp);
				break;
				
			//체크한 장바구니 품목을 주문결제페이지로 보내기	
			case "/payment/checkout.pay":
				System.out.println("/payment/checkout.pay 도착");
				forward = new CheckoutListAction().execute(req, resp);
				break;
			
			//주문결제 완료 후 마이페이지 과거 주문 조회 페이지로 보내기
			case "/payment/payresult.pay":
				System.out.println("/payment/payresult.pay 도착");
				forward = new PaymentPushAction().execute(req, resp);
				break;
			
			//"선택삭제" 버튼 누르면 장바구니 테이블에서도 삭제한 후 최신화된 테이블로 보내기(해서 그걸 ajax 응답으로 본보내기)
			case "/payment/cartdel.pay":
				System.out.println("/payment/cartdel.pay 도착");
				forward = new CartDelAction().execute(req, resp);
				break;
				

			case "/payment/checkoutdirect.pay":
				System.out.println("/payment/checkoutdirect.pay 도착");
				forward = new DirectCheckoutAction().execute(req, resp);
				break;
				
			case "/payment/cartinsert.pay":
				System.out.println("/payment/cartinsert.pay 도착");
				forward = new CartInsertAction().execute(req, resp);
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