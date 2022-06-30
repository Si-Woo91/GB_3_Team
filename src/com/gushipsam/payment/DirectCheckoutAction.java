package com.gushipsam.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.PaymentDAO;

public class DirectCheckoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("CheckoutListAction 도착");
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();

		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("sessionId");
		
		int gID = Integer.parseInt(req.getParameter("gid"));
		int gQTY = Integer.parseInt(req.getParameter("gqty"));

		//장바구니 넣지 않고 바로 주문결제 페이지에 넣을 attribute 생성 및 할당
		req.setAttribute("checkoutList", pdao.getCheckoutDirect(gID, gQTY));
		req.setAttribute("memberInfo", pdao.getMemberInfo(userid));
		System.out.println("조회완료");
		
	
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/payment/checkout06.jsp");
		
		return forward;
	}

}