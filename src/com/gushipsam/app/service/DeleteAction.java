package com.gushipsam.app.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.app.service.dao.ServiceDAO;

public class DeleteAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		
	ActionForward forward = new ActionForward();
	ServiceDAO sdao = new ServiceDAO();
	
	int svnum = Integer.parseInt(req.getParameter("svnum"));
	
	if(sdao.delservice(svnum)) {
		forward = new ServiceListAction().execute(req, resp); 
	}else {
		forward = new ServiceListAction().execute(req, resp); 
	}
		return forward;
	} 
}