package com.gushipsam.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.PaymentDAO;

public class CartDelAction implements Action{

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp ) {
		System.out.println("CartDelAction 도착");
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();

		String userid = "test1234";
//		HttpSession session = req.getSession();
//		userid = (String) session.getAttribute("sessionId"); 로 변경 예정
		
		String[] del_cIDs = req.getParameter("delcids").split(",");
		
		if(pdao.deleteCartItem(userid,del_cIDs)) {
			
			req.setAttribute("cartList", pdao.getCartList(userid));

			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/payment/cart_tb.jsp");
			System.out.println("삭제완료");

		} else {
			req.setAttribute("cartList", pdao.getCartList(userid));

			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/payment/cart_tb.jsp");
			System.out.println("CART 데이터베이스 삭제 실패!");
		}
	
		
		return forward;
	}

}








