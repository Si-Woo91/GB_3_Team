package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;

public class ADHomeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("ADHomeAction 도착");
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/AD-Page/adHome.jsp");
		
		return forward;
	}

}
