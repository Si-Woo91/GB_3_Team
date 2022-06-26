package com.gushipsam.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.PaymentDAO;

public class CheckoutListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("CheckoutListAction 도착");
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();

		String mID = "test1234";
		//String mID = req.getParameter("mID"); 으로 변경 예정
		String[] cIDs = req.getParameter("cids").split(",");
		
		req.setAttribute("checkoutList", pdao.getCheckoutList(mID, cIDs));
		req.setAttribute("memberInfo", pdao.getMemberInfo(mID));
		System.out.println("조회완료");
		
	
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/payment/checkout06.jsp");
		
		return forward;
	}

}







