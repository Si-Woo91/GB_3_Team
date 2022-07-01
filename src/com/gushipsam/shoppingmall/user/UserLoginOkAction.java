package com.gushipsam.shoppingmall.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;

public class UserLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");

		ActionForward forward = new ActionForward();
		ShoppingMallDAO udao = new ShoppingMallDAO();
		HttpSession session = req.getSession();

		String userid = req.getParameter("userid");
		String userpw = req.getParameter("userpw");

		forward.setRedirect(true);

		if (userid.equals("adminid") && userpw.equals("adminpw")) {
			forward.setRedirect(true);
			forward.setPath("/AD-Page/adHome.spm");
		} else {

			if (udao.login(userid, userpw)) { // 로그인 성공시
				session.setAttribute("sessionId", userid);
				forward.setPath("/main/main.jsp");
			} else { // 로그인 실패시
				forward.setPath("/IDPW/login.jsp?flag=false");
			}
			forward.setRedirect(false);
		}
		return forward;
	}

}
