package com.oracle.teamTwo.jy.model;

import java.sql.Timestamp;

public class ChgReviewBox {
	//User_info 일부
	private String user_id_email;
	private String user_nickname;
	private String user_image;
	private int user_state;

	//Chg_chat 전체
	private int chg_num;
	private String review_contents;
	private int review_score;
	private Timestamp review_timestamp;
	
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
	public String getUser_image() {
		return user_image;
	}
	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}
	public int getUser_state() {
		return user_state;
	}
	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}
	public int getChg_num() {
		return chg_num;
	}
	public void setChg_num(int chg_num) {
		this.chg_num = chg_num;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	public Timestamp getReview_timestamp() {
		return review_timestamp;
	}
	public void setReview_timestamp(Timestamp review_timestamp) {
		this.review_timestamp = review_timestamp;
	}
	
	
}
