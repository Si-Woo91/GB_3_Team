package com.gushipsam.app.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.app.service.dao.ServiceDAO;

public class DeleteReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ServiceDAO  sdao = new ServiceDAO();
		
		int replynum = Integer.parseInt( req.getParameter("replynum") );
		String servicenum = req.getParameter("servicenum");
		
		if(sdao.deleteReply(replynum)) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/service/minsu3.sv?servicenum=" + servicenum);
		}
		
		return forward;
}
}






