package com.gushipsam.app.service.dao;

public class ServiceDTO {
	
	private int servicenum;		
	private String servicename;		
	private String servicedate;		
	private String servicetitle;	
	private String servicecontent;
// 안할수도잇음
	private int servicereadcount;

	
	public int getBoardreadcount() {
		return servicereadcount;
	}
	public void setBoardreadcount(int boardreadcount) {
		this.servicereadcount = boardreadcount;
	}
	public int getServicenum() {
		return servicenum;
	}
	public void setServicenum(int servicenum) {
		this.servicenum = servicenum;
	}
	public String getServicename() {
		return servicename;
	}
	public void setServicename(String servicename) {
		this.servicename = servicename;
	}
	public String getServicedate() {
		return servicedate;
	}
	public void setServicedate(String servicedate) {
		this.servicedate = servicedate;
	}
	public String getServicetitle() {
		return servicetitle;
	}
	public void setServicetitle(String servicetitle) {
		this.servicetitle = servicetitle;
	}
	public String getServicecontent() {
		return servicecontent;
	}
	public void setServicecontent(String servicecontent) {
		this.servicecontent = servicecontent;
	}
	
	
}
