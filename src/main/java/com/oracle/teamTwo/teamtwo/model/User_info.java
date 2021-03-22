package com.oracle.teamTwo.teamtwo.model;

import java.sql.Date;

public class User_info {

	private String user_id_email;
	private String user_nickname;
	private String user_password;
	private Date user_birth;
	private String user_phone;
	private String user_gender;
	private String user_image;
	private String user_intro;
	private Date user_regdate;
	private int user_state;
	private String user_name;

	// 박용수 팔로우 해슴 ?
	private String haeseum;

	public String getUser_id_email() {
		return user_id_email;
	}

	public void setUser_id_email(String user_id_email) {
		this.user_id_email = user_id_email;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public Date getUser_birth() {
		return user_birth;
	}

	public void setUser_birth(Date user_birth) {
		this.user_birth = user_birth;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public String getUser_intro() {
		return user_intro;
	}

	public void setUser_intro(String user_intro) {
		this.user_intro = user_intro;
	}

	public Date getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}

	public int getUser_state() {
		return user_state;
	}

	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}
	
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	/**
	 * @return the haeseum
	 */
	public String getHaeseum() {
		return haeseum;
	}

	/**
	 * @param haeseum the haeseum to set
	 */
	public void setHaeseum(String haeseum) {
		this.haeseum = haeseum;
	}

}
