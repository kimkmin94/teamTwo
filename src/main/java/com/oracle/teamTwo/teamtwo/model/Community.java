package com.oracle.teamTwo.teamtwo.model;

import java.sql.Date;

public class Community {

	private int b_num;
	private int b_c_num;
	private String b_id_email;
	private String b_nickname;
	private String b_title;
	private String b_contents;
	private String b_image;
	private Date b_regdate;
	private int b_like_count;
	private int b_view_count;
	private int b_state;

	// hj 변수 - 프로필 사진 조회용
	private String user_image;
	   
	// hj 변수 -커뮤니티 카테고리 join 용
	private String b_subject;
		
	// hj 변수 - 조회용
	private String search;
	private String keyword;
	private String pageNum;
	private int start;
	private int end;


	public int getB_num() {
		return b_num;
	}

	public void setB_num(int b_num) {
		this.b_num = b_num;
	}

	public int getB_c_num() {
		return b_c_num;
	}

	public void setB_c_num(int b_c_num) {
		this.b_c_num = b_c_num;
	}

	public String getB_id_email() {
		return b_id_email;
	}

	public void setB_id_email(String b_id_email) {
		this.b_id_email = b_id_email;
	}

	public String getB_nickname() {
		return b_nickname;
	}

	public void setB_nickname(String b_nickname) {
		this.b_nickname = b_nickname;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_contents() {
		return b_contents;
	}

	public void setB_contents(String b_contents) {
		this.b_contents = b_contents;
	}

	public String getB_image() {
		return b_image;
	}

	public void setB_image(String b_image) {
		this.b_image = b_image;
	}

	public Date getB_regdate() {
		return b_regdate;
	}

	public void setB_regdate(Date b_regdate) {
		this.b_regdate = b_regdate;
	}

	public int getB_like_count() {
		return b_like_count;
	}

	public void setB_like_count(int b_like_count) {
		this.b_like_count = b_like_count;
	}

	public int getB_view_count() {
		return b_view_count;
	}

	public void setB_view_count(int b_view_count) {
		this.b_view_count = b_view_count;
	}

	public int getB_state() {
		return b_state;
	}

	public void setB_state(int b_state) {
		this.b_state = b_state;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	/**
	 * @return the b_subject
	 */
	public String getB_subject() {
		return b_subject;
	}

	/**
	 * @param b_subject the b_subject to set
	 */
	public void setB_subject(String b_subject) {
		this.b_subject = b_subject;
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
