package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;

public class ADMemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ShoppingMallDAO shopDAO = new ShoppingMallDAO();
		System.out.println("ADMemberListAction 도착");

		int memberCnt = shopDAO.getMemberCnt();
		
		req.setAttribute("memberCnt", memberCnt);
		req.setAttribute("memberList", shopDAO.getMemberList());
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/AD-Page/Memberlist.jsp");
		
		return forward;
	}

}
