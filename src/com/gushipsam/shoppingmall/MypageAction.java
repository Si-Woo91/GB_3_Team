package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;

public class MypageAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("MypageAction 도착");
		ActionForward forward = new ActionForward();
		ShoppingMallDAO shopDAO = new ShoppingMallDAO();
		
		
		// mypage 최근 주문 리스트
		req.setAttribute("recentList", shopDAO.getRecentList());	//object타입의 객체를 통으로 담아줌.
		forward.setRedirect(false);		// forward방식이 Redirect인지 물어봄 
		forward.setPath( req.getContextPath() + "/lobby/Mypage.jsp");		// 어디로 보낼지 지정해줌
		
		return forward;
	}
}
