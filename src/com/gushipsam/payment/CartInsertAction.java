package com.gushipsam.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.PaymentDAO;

public class CartInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("CartInsertAction 도착");
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();

		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("sessionId");
		
		int gID = Integer.parseInt(req.getParameter("gid"));
		int gQTY = Integer.parseInt(req.getParameter("gqty"));
		
		if(pdao.insertCart(userid,gID,gQTY)) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/payment/cart_tb.jsp");
			System.out.println("cartInsert 완료");
		} else {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/payment/cart_tb.jsp");
			System.out.println("cartInsert 실패!");
		}
		
		
		return forward;
	}

}