package com.oracle.teamTwo.ban.model;

import java.sql.Date;
import java.sql.Timestamp;

public class byPointUserinfo {

	// rownum
	private int rownum;

	// Point table
	private String user_id_email;
	private int point_balance;
	private Timestamp point_timestamp;

	// User_info table
	private String user_nickname;
	private String user_image;
	private Date user_regdate;
	private String user_intro;

	// getters and setters
	public String getUser_id_email() {
		return user_id_email;
	}

	public void setUser_id_email(String user_id_email) {
		this.user_id_email = user_id_email;
	}

	public int getPoint_balance() {
		return point_balance;
	}

	public void setPoint_balance(int point_balance) {
		this.point_balance = point_balance;
	}
	
	
	public Timestamp getPoint_timestamp() {
		return point_timestamp;
	}

	public void setPoint_timestamp(Timestamp point_timestamp) {
		this.point_timestamp = point_timestamp;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}

	public Date getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}

	public String getUser_intro() {
		return user_intro;
	}

	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}
	
	

}
