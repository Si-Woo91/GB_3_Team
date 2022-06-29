package com.gushipsam.payment.dao;

public class MemberDTO {
	
	private String userid;	
	private String userpw;
	private String username;
	private String userphone;
	private String userdata;
	private String useremail;
	
	public MemberDTO(String userid, String userpw, String username, String userphone, String userdata,
			String useremail) {
		super();
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
		this.userphone = userphone;
		this.userdata = userdata;
		this.useremail = useremail;
	}
	
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUserdata() {
		return userdata;
	}
	public void setUserdata(String userdata) {
		this.userdata = userdata;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	
	
	
	
}
    

    
