package com.gushipsam.payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.CartDTO;
import com.gushipsam.payment.dao.PaymentDAO;

public class CartInsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		System.out.println("CartInsertAction 도착");
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();
		boolean result = false;
		
		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("sessionId");
		
		int gID = Integer.parseInt(req.getParameter("gid"));
		int gQTY = Integer.parseInt(req.getParameter("gqty"));
		
		List<CartDTO> cartList = pdao.getCartList(userid);
		boolean is_there_same = false;
		int samecID = 0;
		
		for( CartDTO item: cartList) {				//지금 넣는 상품이 이미 존재할 때, 수량만 추가하여 수정해주는 updateCart 기능 실행
			if( item.getgID() == gID ) {
				is_there_same = true;
				samecID = item.getcID();
				gQTY += item.getcQTY();
				break;
			}
		}
		
		if (is_there_same) {							//수량만 수정해주는 updateCart 기능
			result = pdao.updateCart(samecID,gQTY);
		} else {										//새로운 행을 추가해주는 insertCart 기능 
			result = pdao.insertCart(userid,gID,gQTY);
		}
		
		
		
		if(result) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/payment/cart_tb.jsp");
			System.out.println("cartInsert 완료");
		} else {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/payment/cart_tb.jsp");
			System.out.println("cartInsert 실패!");
		}
		
		return forward;
	}

}