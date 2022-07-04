package com.gushipsam.app.service;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.app.service.dao.ServiceDAO;

public class minsu3Action implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ServiceDAO sdao = new ServiceDAO();
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("sessionId");
		
		if(userid == null || userid.equals("")) {
			HashMap<String, String> userdata = new HashMap<>();
			userdata.put("USERNAME", "");
			userdata.put("USERPW","");
			req.setAttribute("userdata", userdata);
		} else {
			req.setAttribute("userdata", sdao.getUserdata(userid));
		}
		
		
		int servicenum = Integer.parseInt(req.getParameter("servicenum"));
		System.out.println(servicenum);
		req.setAttribute("replylist",sdao.getReplys(servicenum));
		req.setAttribute("service", sdao.getDetail(servicenum));
	
		forward.setRedirect(false);
		forward.setPath("/service/minsu3.jsp");		
		
		return forward;
}
}
