package com.gushipsam.app.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.app.service.dao.ServiceDAO;
import com.gushipsam.app.service.dao.ReplyDTO;

public class AddReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		
		ServiceDAO sdao = new ServiceDAO();
		ReplyDTO reply = new ReplyDTO();
		
		int servicenum = Integer.parseInt( req.getParameter("servicenum") );
		
		reply.setServicenum( servicenum );
		reply.setServicename( req.getParameter("servicename") );
		reply.setPassword( req.getParameter("password") );
		reply.setReplycontent( req.getParameter("replycontent") );
		
		if(sdao.addReply(reply)) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/service/minsu3.sv?servicenum=" + servicenum);
		} 
		
		return forward;
}

}










