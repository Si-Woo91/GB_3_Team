package com.gushipsam.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.PaymentDAO;

public class DirectCheckoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("CheckoutListAction 도착");
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();

		String userid = "test1234";
		//String userid = req.getParameter("userid"); 으로 변경 예정
		
		int gID = Integer.parseInt(req.getParameter("gid"));
		int gQTY = Integer.parseInt(req.getParameter("gqty"));
		
		req.setAttribute("checkoutItem", pdao.getCheckoutDirect(gID, gQTY));
		req.setAttribute("memberInfo", pdao.getMemberInfo(userid));
		System.out.println("조회완료");
		
	
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/payment/checkout06.jsp");
		
		return forward;
	}

}








