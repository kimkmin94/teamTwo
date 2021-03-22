package com.oracle.teamTwo.teamtwo.model;

public class Part_challenge {

	private String user_id_email;
	private int chg_num;
	private int batting_point;
	private double chg_days;
	private double confirm_count;

	// 박용수 첼린지 제목/이미지
	private String chg_title;
	private String chg_image;
	
	// 박용수 닉네임/프로필 이미지
	private String user_nickname;
	private String user_image;
	
	public String getUser_id_email() {
		return user_id_email;
	}

	public void setUser_id_email(String user_id_email) {
		this.user_id_email = user_id_email;
	}

	public int getChg_num() {
		return chg_num;
	}

	public void setChg_num(int chg_num) {
		this.chg_num = chg_num;
	}

	public int getBatting_point() {
		return batting_point;
	}

	public void setBatting_point(int batting_point) {
		this.batting_point = batting_point;
	}

	public double getConfirm_count() {
		return confirm_count;
	}

	public void setConfirm_count(double confirm_count) {
		this.confirm_count = confirm_count;
	}

	public double getChg_days() {
		return chg_days;
	}

	public void setChg_days(double chg_days) {
		this.chg_days = chg_days;
	}

	/**
	 * @return the chg_title
	 */
	public String getChg_title() {
		return chg_title;
	}

	/**
	 * @param chg_title the chg_title to set
	 */
	public void setChg_title(String chg_title) {
		this.chg_title = chg_title;
	}

	/**
	 * @return the user_nickname
	 */
	public String getUser_nickname() {
		return user_nickname;
	}

	/**
	 * @param user_nickname the user_nickname to set
	 */
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	/**
	 * @return the chg_image
	 */
	public String getChg_image() {
		return chg_image;
	}

	/**
	 * @param chg_image the chg_image to set
	 */
	public void setChg_image(String chg_image) {
		this.chg_image = chg_image;
	}

	/**
	 * @return the user_image
	 */
	public String getUser_image() {
		return user_image;
	}

	/**
	 * @param user_image the user_image to set
	 */
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}


}
