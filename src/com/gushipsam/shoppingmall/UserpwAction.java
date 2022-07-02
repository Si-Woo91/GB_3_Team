package com.gushipsam.shoppingmall;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;
import com.gushipsam.shoppingmall.dao.ShoppingMallDTO;

public class UserpwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("ActionForward 도착");
		ShoppingMallDAO udao = new ShoppingMallDAO();
		ShoppingMallDTO user = new ShoppingMallDTO();
		ActionForward forward = new ActionForward();
		
		String userid = req.getParameter("userid");
		
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");
		String useremail = req.getParameter("useremail");
		
		String user_pw = udao.pw(userid, username, userphone, useremail);
		System.out.println("udao");
		
		req.setAttribute("user_pw", user_pw);
		
		if(udao.pw(userid, username, userphone, useremail) != null) {
			forward.setPath("/IDPW/ID.jsp?flagpw2=false");
			req.setAttribute("mag2", "귀하의 비밀번호는 " + user_pw + "입니다.");
			System.out.println(user_pw);
			
		} else {
			forward.setPath("/IDPW/ID.jsp?flagpw=false");
		}
		
		forward.setRedirect(false);
		return forward;
	}

}