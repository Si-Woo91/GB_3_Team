package com.gushipsam.shoppingmall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;
import com.gushipsam.shoppingmall.dao.ShoppingMallDTO;

public class UseridAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp){
		ShoppingMallDAO udao = new ShoppingMallDAO();
		ActionForward forward = new ActionForward();
		
		String username = req.getParameter("username");
		String userphone = req.getParameter("userphone");
		String useremail = req.getParameter("useremail");
		
		
		List<ShoppingMallDTO> user_id = udao.id(username, userphone, useremail);
		System.out.println(user_id);
		
		if( user_id == null || user_id.size() ==0 ) {								//해당 회원이 존재하지 않는 경우
			System.out.println("해당 회원이 존재하지 않는 경우");
			forward.setPath("/IDPW/ID.jsp?flagid=false");
			
		} else if ( user_id.size() > 1){					//해당 회원이 2명 이상 존재하는 경우
			System.out.println("해당 회원이 2명 이상 존재하는 경우");
			forward.setPath("/IDPW/ID.jsp?flagid2=false");
			
		} else {											//해당 회원이 1명 존재하는 경우
			System.out.println("해당 회원이 1명 존재하는 경우");
			forward.setPath("/IDPW/ID.jsp?flagid3=false");
			req.setAttribute("mag", "귀하의 아이디는 " + user_id.get(0).getUserid() + "입니다.");
			System.out.println(user_id);
		}
		
		forward.setRedirect(false);
		return forward;
	}

}
