package com.gushipsam.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.PaymentDAO;

public class CartDelAction implements Action{

	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp ) {
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();

		String userid = "test1234";
		//String userid = req.getParameter("userid"); 으로 변경 예정
		String del_cID_ = req.getParameter("delcid");
		int del_cID = Integer.parseInt(del_cID_);
		
		if(pdao.deleteCartItem(userid,del_cID)) {
			forward.setRedirect(true);
			forward.setPath(null);

		} else {
			forward.setRedirect(true);
			forward.setPath(null);
		}
	
		
		return forward;
	}

}








