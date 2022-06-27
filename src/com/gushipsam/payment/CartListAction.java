package com.gushipsam.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.PaymentDAO;

public class CartListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("CartListAction 도착");
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();

		String userid = "test1234";
		
//		HttpSession session = req.getSession();
//		userid = (String) session.getAttribute("sessionId");
		
		req.setAttribute("cartList", pdao.getCartList(userid));
		System.out.println("조회완료");
		
	
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/payment/cart06.jsp");
		
		return forward;
	}

}








