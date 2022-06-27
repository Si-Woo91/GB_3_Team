package com.gushipsam.shoppingmall;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.gushipsam.action.Action;
import com.gushipsam.action.ActionForward;
import com.gushipsam.shoppingmall.dao.ShoppingMallDAO;


public class UserCheckIdOk implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		String userid = req.getParameter("userid");
		ShoppingMallDAO sdao = new ShoppingMallDAO();
		JSONObject obj = new JSONObject();
		PrintWriter out = resp.getWriter();

		if(sdao.checkId(userid)) {
			obj.put("status", "not-ok");
		}else {
			obj.put("status", "ok");
		}
		
		out.println(obj.toJSONString());
		out.close();
		return null;
	}
	
}
