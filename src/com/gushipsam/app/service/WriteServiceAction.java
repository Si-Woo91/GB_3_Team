package com.gushipsam.app.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.app.service.dao.ServiceDAO;
import com.gushipsam.app.service.dao.ReplyDTO;

public class WriteServiceAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ServiceDAO sdao = new ServiceDAO();
		
		HttpSession session = req.getSession();			
		String userid = (String) session.getAttribute("sessionId");
		
		if( userid == null || userid.equals("")) {				//로그인 안 했을 
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/IDPW/login.jsp");
		} else {
			req.setAttribute("username", sdao.getUsername(userid));
			forward.setRedirect(false);
			forward.setPath(req.getContextPath() + "/service/minsu2.jsp");
		}
		
		return forward;
}

}










