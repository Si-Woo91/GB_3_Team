package com.gushipsam.info.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gushipsam.info.mybatis.SqlMapConfig;


public class InfoDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public InfoDAO() {
		// autocommit
		sqlsession = factory.openSession(true);
	}
	
	//회원정보 존재하는지 확인
	public boolean checkMember(String userid, String userpw) {
		boolean result = false;
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		
		if((Integer)sqlsession.selectOne("info.checkMember", datas) == 1) {
			result = true;
		}
		
		return result;
	}
	
	// 회원정보수정 위한 회원정보 불러오기
	public InfoDTO getMember(String userid) {
		
		InfoDTO member = sqlsession.selectOne("info.getMember", userid);
		
		return member;
	}	
	
	// 이메일 변경하기
	public boolean modifyEmail(String userid, String newEmail) {
		boolean result = false;
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("newEmail", newEmail);
		
		if(sqlsession.update("info.modifyEmail", datas) == 1) result = true;
		
		return result;
	}	
	
	// 전화번호 변경하기
	public boolean modifyPhone(String userid, String newPhone) {
		boolean result = false;
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("newPhone", newPhone);
		
		if(sqlsession.update("info.modifyPhone", datas) == 1) result = true;
		
		return result;
	}	
	
	// 비밀번호 변경하기
	public boolean modifyPassword(String userid, String username, String newPassword) {
		boolean result = false;
		
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("username", username);
		datas.put("newPassword", newPassword);
		
		if(sqlsession.update("info.modifyMembersPassword", datas) == 1) result = true;
		sqlsession.update("info.modifyServicePassword", datas);
		
		return result;
	}	
	
	
	// 회원 탈퇴하기
	public boolean secession(String userid) {
		boolean result = false;
				
		if(sqlsession.delete("info.secession", userid) == 1) result = true;
		
		return result;
	}	
	
}


















