package com.gushipsam.app.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.app.service.dao.ServiceDAO;

public class minsu3Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ServiceDAO sdao = new ServiceDAO();
		
		int servicenum = Integer.parseInt(req.getParameter("servicenum"));
		
		/*// 안쓸수도잇음
		sdao.updateReadCount(servicenum);
*/		
		System.out.println(servicenum);
		req.setAttribute("replylist",sdao.getReplys(servicenum));
		req.setAttribute("service", sdao.getDetail(servicenum));
		forward.setRedirect(false);
		forward.setPath("/service/minsu3.jsp");
		
		
		
		return forward;
}
}
