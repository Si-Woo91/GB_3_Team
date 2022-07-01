package com.gushipsam.payment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.payment.dao.CartDTO;
import com.gushipsam.payment.dao.OrderDTO;
import com.gushipsam.payment.dao.PaymentDAO;

public class PaymentPushAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) {
		ActionForward forward = new ActionForward();
		PaymentDAO pdao = new PaymentDAO();
		OrderDTO odto = new OrderDTO();
		CartDTO cdto = new CartDTO();

		HttpSession session = req.getSession();
		String userid = (String) session.getAttribute("sessionId");
		
		if( userid == null || userid.equals("")) {
			forward.setRedirect(true);
			forward.setPath(req.getContextPath() + "/IDPW/login.jsp");
		} else {
			String[] cIDs = req.getParameter("cids").split(",");
			String oPHONE = req.getParameter("ophone");
			String oADDRESS = req.getParameter("oaddress");
			int directgID = Integer.parseInt(req.getParameter("directgID"));
			int directoQTY = Integer.parseInt(req.getParameter("directoQTY"));
										
			if( cIDs[0].equals("0") ) {					// CART에 안 넣고 바로 결제하는 경우
				
				odto.setoID(0);
				odto.setUserid(userid);
				odto.setgID(directgID);
				odto.setoQTY(directoQTY);
				odto.setoDATE(null);
				odto.setoPHONE(oPHONE);
				odto.setoADDRESS(oADDRESS);
				
				pdao.insertOrder(odto);
				
				forward.setRedirect(true);
				forward.setPath(req.getContextPath() + "/lobby/mypage.spm");
				
			} else {									// CART를 거쳐  결제하는 경우
				
				for(String cID : cIDs) {
					cdto = pdao.getCartItem(cID);
					
					odto.setoID(0);
					odto.setUserid(userid);
					odto.setgID(cdto.getgID());
					odto.setoQTY(cdto.getcQTY());
					odto.setoDATE(null);
					odto.setoPHONE(oPHONE);
					odto.setoADDRESS(oADDRESS);
					
					pdao.insertOrder(odto);
				}
				
				if( pdao.deleteCartItemAll(cIDs) ) {
					forward.setRedirect(true);
					forward.setPath(req.getContextPath() + "/lobby/mypage.spm");
				} else {
					forward.setRedirect(true);
					forward.setPath(req.getContextPath() + "/lobby/mypage.spm");
				}
			}
		}
		return forward;
	}

}