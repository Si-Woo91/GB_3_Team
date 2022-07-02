package com.gushipsam.shoppingmall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;
import com.gushipsam.shoppingmall.dao.ShoppingMallDTO;

public class SignupCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp){
		ShoppingMallDAO udao = new ShoppingMallDAO();
		ActionForward forward = new ActionForward();
		
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");
		String useremail = req.getParameter("useremail");
		
		
		List<ShoppingMallDTO> user_id = udao.id(username, userphone, useremail);
		System.out.println(user_id);
		
		if( user_id == null || user_id.size() ==0 ) {	//가입 기록이 없는 경우
			System.out.println("가입 기록이 없는 경우");
			forward.setRedirect(true);
			forward.setPath("/IDPW/signup.jsp");
			
		} else {										//가입 기록이 존재하는 경우
			System.out.println("가입 기록이 존재하는 경우");
		
			req.setAttribute("username", username);
			req.setAttribute("user_id", user_id);
			forward.setRedirect(false);
			forward.setPath("/IDPW/signedupalrdy.jsp?result=notjoined");
		}
		
		return forward;
	}

}
