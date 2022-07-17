package com.gushipsam.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.info.dao.InfoDAO;

public class ConfirmPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		InfoDAO idao = new InfoDAO();
		HttpSession session = req.getSession();

		String userid = (String) session.getAttribute("sessionId");
		String userpw = req.getParameter("userpw");


		if (idao.checkMember(userid, userpw)) { 	// 해당 회원 존재할 시
			
			req.setAttribute("member", idao.getMember(userid));
			forward.setPath("/Info/User-InfoUp.jsp");
		} else {
			req.setAttribute("result", "nomatch");
			forward.setPath("/Info/User-Info.jsp");
		}
		
		forward.setRedirect(false);
		return forward;
	}

}
