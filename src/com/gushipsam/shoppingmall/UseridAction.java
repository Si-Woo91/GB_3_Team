package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;
import com.gushipsam.shoppingmall.dao.ShoppingMallDTO;

public class UseridAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		ShoppingMallDAO udao = new ShoppingMallDAO();
		ShoppingMallDTO user = new ShoppingMallDTO();
		ActionForward forward = new ActionForward();
		
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");
		String useremail = req.getParameter("useremail");
		
		String user_id = udao.id(username, userphone, useremail);
		
		req.setAttribute("user_id", user_id);
		
		if(udao.id(username, userphone, useremail) != null) {
			forward.setPath("/IDPW/ID.jsp?flagid2=false");
			req.setAttribute("mag", "아이디는 " + user_id + "입니다.");
			System.out.println(user_id);
			
		} else {
			forward.setPath("/IDPW/ID.jsp?flagid=false");
		}
		
		forward.setRedirect(false);
		return forward;
	}

}
