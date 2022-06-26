package com.gushipsam.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.PaymentDAO;

public class CartDelAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("CartDelAction 도착");
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();

		String mID = "test1234";
		//String mID = req.getParameter("mID"); 으로 변경 예정
		int del_cID = Integer.parseInt(req.getParameter("delcid"));
		
		if(pdao.deleteCartItem(mID,del_cID)) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/payment/cart06.jsp");
			System.out.println("삭제완료");

		} else {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/payment/cart06.jsp" );
			System.out.println("CART 데이터베이스 삭제 실패!");
		}
	
		
		return forward;
	}

}








