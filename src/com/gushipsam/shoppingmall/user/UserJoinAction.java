package com.gushipsam.shoppingmall.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;
import com.gushipsam.shoppingmall.dao.ShoppingMallDTO;

public class UserJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ShoppingMallDAO udao = new ShoppingMallDAO();
		ShoppingMallDTO user = new ShoppingMallDTO();
		ActionForward forward = new ActionForward();
		int result;
		
		user.setUserid(req.getParameter("userid"));
		System.out.println("0");
		user.setUserpw(req.getParameter("userpw"));
		System.out.println("1");
		user.setUsername(req.getParameter("username"));
		System.out.println("2");
		user.setUserphone(req.getParameter("userphone"));
		System.out.println("3");
		user.setUserdata(req.getParameter("userdata"));
		System.out.println("4");
		user.setUseremail(req.getParameter("useremail"));
		System.out.println("5");
		
		

		result= udao.join(user);
		
		if( result == 1 ) {	// 회원가입 성공시
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/IDPW/login.jsp");
			
		} else {				// 회원가입 실패시
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/IDPW/signup.jsp?flag=false");
			
		}
			
		return forward;
	}
	
	
}
