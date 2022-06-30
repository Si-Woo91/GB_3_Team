package com.gushipsam.app.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.app.service.dao.ServiceDAO;

public class ServiceListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		ServiceDAO sdao = new ServiceDAO();
		
		int totalCnt = sdao.getServiceCnt();
		
		
		String temp = req.getParameter("page");
		int page = 0;
		

		page = temp == null ? 1 : Integer.parseInt(temp);
		
		int pageSize = 10;
		
		int endRow = page *10;
		
		int startRow = endRow -9;
		
		int startPage = (page -1) / pageSize*pageSize +1;
		int endPage = startPage + pageSize -1;
 		int totalPage = (totalCnt -1)/pageSize +1;		
 		
		endPage = endPage > totalPage ? totalPage : endPage;
		
		req.setAttribute("totalPage", totalPage );
		req.setAttribute("nowPage", page);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		
		req.setAttribute("serviceList", sdao.getServiceList(startRow, endRow));
		forward.setRedirect(false);
		forward.setPath(req.getContextPath() + "/service/minsu1.jsp");
		
		return forward;
}
}
