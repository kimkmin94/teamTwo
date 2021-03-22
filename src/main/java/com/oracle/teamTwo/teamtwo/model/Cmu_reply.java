package com.oracle.teamTwo.teamtwo.model;

import java.sql.Date;

public class Cmu_reply {

	private int b_num;
	private int re_no;
	private int re_order;
	private int re_depth;
	private String re_contents;
	private String re_writer;
	private Date re_date;
	private int re_state;

	// 윤홍주님 대댓글 처리용
	private int re_parents;
	// hj 변수 - 프로필 사진 조회용
	private String user_image;
	private String user_nickname; 
	
	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public int getRe_no() {
		return re_no;
	}

	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}

	public int getRe_order() {
		return re_order;
	}

	public void setRe_order(int re_order) {
		this.re_order = re_order;
	}

	public int getRe_depth() {
		return re_depth;
	}

	public void setRe_depth(int re_depth) {
		this.re_depth = re_depth;
	}

	public String getRe_contents() {
		return re_contents;
	}

	public void setRe_contents(String re_contents) {
		this.re_contents = re_contents;
	}

	public String getRe_writer() {
		return re_writer;
	}

	public void setRe_writer(String re_writer) {
		this.re_writer = re_writer;
	}

	public Date getRe_date() {
		return re_date;
	}

	public void setRe_date(Date re_date) {
		this.re_date = re_date;
	}

	public int getRe_state() {
		return re_state;
	}

	public void setRe_state(int re_state) {
		this.re_state = re_state;
	}

	/**
	 * @return the re_parents
	 */
	public int getRe_parents() {
		return re_parents;
	}

	/**
	 * @param re_parents the re_parents to set
	 */
	public void setRe_parents(int re_parents) {
		this.re_parents = re_parents;
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

}
