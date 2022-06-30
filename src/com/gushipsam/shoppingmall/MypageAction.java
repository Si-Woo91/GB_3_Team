package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.goods.dao.goodsDAO;
import com.gushipsam.payment.dao.PaymentDAO;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;

public class MypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("MypageAction 도착");
		ActionForward forward = new ActionForward();
		// 주문 정보
		ShoppingMallDAO shopDAO = new ShoppingMallDAO();
		// req.getSession()을 java에서 사용할 수 있게 session에 받아옴
		HttpSession session = req.getSession();
	      String userid = (String) session.getAttribute("sessionId");
		
		
		// mypage 최근 주문 리스트
		req.setAttribute("recentList", shopDAO.getRecentList(userid));	//object타입의 객체를 통으로 담아줌.
		forward.setRedirect(false);		// forward방식이 Redirect인지 물어봄 
		forward.setPath( req.getContextPath() + "/lobby/Mypage.jsp");		// 어디로 보낼지 지정해줌
		
		return forward;
	}
}
