package com.gushipsam.shoppingmall.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;

public class UserLogoutOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		session.invalidate();
		
		forward.setRedirect(true);
		forward.setPath(req.getContextPath() + "/main/main.spm");
		
		return forward;
	}

}
