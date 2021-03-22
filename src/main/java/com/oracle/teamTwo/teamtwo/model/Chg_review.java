package com.oracle.teamTwo.teamtwo.model;

public class Chg_review {

	private int chg_num;
	private String user_id_email;
	private String review_contents;
	private int review_score;

	public int getChg_num() {
		return chg_num;
	}

	public void setChg_num(int chg_num) {
		this.chg_num = chg_num;
	}

	public String getUser_id_email() {
		return user_id_email;
	}

	public void setUser_id_email(String user_id_email) {
		this.user_id_email = user_id_email;
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

}
