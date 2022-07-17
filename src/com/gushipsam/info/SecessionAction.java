package com.gushipsam.info;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.info.dao.InfoDAO;

public class SecessionAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		InfoDAO idao = new InfoDAO();
		HttpSession session = req.getSession();

		String userid = (String) session.getAttribute("sessionId");

		idao.secession(userid);
		forward.setPath("/main/sessionInitialization.jsp");

		forward.setRedirect(true);
		return forward;
	}

}
