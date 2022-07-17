package com.gushipsam.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.info.dao.InfoDAO;

public class ModifyPhoneAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		InfoDAO idao = new InfoDAO();
		HttpSession session = req.getSession();

		String userid = (String) session.getAttribute("sessionId");
		String newPhone = req.getParameter("newPhone");

		
		if (idao.modifyPhone(userid, newPhone) ) {
			req.setAttribute("member", idao.getMember(userid));
			req.setAttribute("result", "phoneModified");
			forward.setPath("/Info/User-InfoUp.jsp");
		} else {
			forward.setPath("/Info/User-InfoUp.jsp");
		}
		
		forward.setRedirect(false);
		return forward;
	}

}