package com.gushipsam.app.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.app.service.dao.ServiceDAO;
import com.gushipsam.app.service.dao.ServiceDTO;

public class minsu2OkAction implements Action {
 
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ServiceDAO sdao = new ServiceDAO();
		
		String servicetitle = req.getParameter("servicetitle");
		String servicename = req.getParameter("servicename");
		String servicecontent = req.getParameter("servicecontent");
		
		ServiceDTO service = new ServiceDTO();
		service.setServicetitle(servicetitle);
		service.setServicename(servicename);
		service.setServicecontent(servicecontent);
		
		forward.setRedirect(true);
		
		if(sdao.insertService(service)) {
			int servicenum = sdao.getSeq();
			forward.setPath(req.getContextPath() + "/service/minsu3.sv?servicenum=" + servicenum );
		}else {
			forward.setPath(req.getContextPath() + "/service/minsu2.sv");
		}
		
		return forward;
}
}
