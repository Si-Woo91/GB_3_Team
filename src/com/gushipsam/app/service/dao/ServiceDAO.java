package com.gushipsam.app.service.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.gushipsam.app.service.dao.ServiceDTO;
import com.gushipsam.app.service.dao.ReplyDTO;
import com.gushipsam.app.service.mybatis.SqlMapConfig;


public class ServiceDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public ServiceDAO() {
		// autocommit
		sqlsession = factory.openSession(true);
	}

	public List<ServiceDTO> getServiceList( int startRow, int endRow) {
		HashMap<String, Integer> datas = new HashMap<>();
		datas.put("startRow", startRow);
		datas.put("endRow", endRow);
		List<ServiceDTO>serviceList = sqlsession.selectList("Service.getServiceList", datas);
		return serviceList;
	}

	public int getServiceCnt() {
		return sqlsession.selectOne("Service.getServiceCnt");
	}

	public boolean insertService(ServiceDTO service) {
		boolean result = false;
		
		if(sqlsession.insert("Service.insertService", service) == 1) {
			result = true;
		}
				
		return result;
	}

	public ServiceDTO getDetail(int servicenum) {
		return (ServiceDTO)sqlsession.selectOne("Service.getDetail", servicenum);
	}

	public void updateReadCount(int servicenum) {
		sqlsession.update("Service.updateReadCount",servicenum);
	}

	public int getSeq() {
		return sqlsession.selectOne("Service.getSeq");
	}

	public boolean addReply(ReplyDTO reply) {
		boolean result = false;
		
		if(sqlsession.insert("Service.addReply", reply) != 0) {
			result = true;
		}
		
		return result;
	}

	public List<ReplyDTO> getReplys(int servicenum) {
		List<ReplyDTO> list =  sqlsession.selectList("Service.getReplys",servicenum);
		return list;
	}

	public boolean updateReply(int replynum, String replycontent) {
		boolean result = false;
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("replynum", replynum);
		datas.put("replycontent", replycontent);
		
		if(sqlsession.update("Service.updateReply", datas) != 0) {
			result = true;
		}
		
		return result;
	}

	public boolean deleteReply(int replynum) {
		boolean result  = false;
		
		if(sqlsession.delete("Service.deleteReply", replynum) == 1) {
			result = true;
		}
		return result;
	}
	public boolean delservice(int svnum) {
		boolean result = false;
				
		
		if (sqlsession.delete("Service.delser", svnum) != 0) {
			result = true;
			
		}
		return result;

}

	public String getUsername(String userid) {
		String username = null;
		username = sqlsession.selectOne("Service.getUsername", userid);
		return username;
	}
}

	
	
	
	
	

