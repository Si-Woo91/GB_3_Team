package com.gushipsam.app.service.dao;

public class ReplyDTO {
	private int replynum;
	private String replycontent;
	private String servicename;
	private String password	;
	private int servicenum;
	
	public int getReplynum() {
		return replynum;
	}
	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}
	public String getReplycontent() {
		return replycontent;
	}
	public void setReplycontent(String replycontent) {
		this.replycontent = replycontent;
	}
	public String getServicename() {
		return servicename;
	}
	public void setServicename(String servicename) {
		this.servicename = servicename;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getServicenum() {
		return servicenum;
	}
	public void setServicenum(int servicenum) {
		this.servicenum = servicenum;
	}
	
}
