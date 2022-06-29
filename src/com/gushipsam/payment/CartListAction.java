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
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();

		String userid = "test1";
		
//		HttpSession session = req.getSession();
//		userid = (String) session.getAttribute("sessionId");
		
		req.setAttribute("cartList", pdao.getCartList(userid));
	
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/payment/cart06.jsp");
		
		return forward;
	}

}








