package com.oracle.teamTwo.jy.model;

import java.sql.Timestamp;

public class JyChg_photochk {

	private int chg_num;
	private String parti_id_email;
	private Timestamp upload_timestamp;
	private int confirm_state;
	private String confirm_image;
	
	//조회용
	private String search;		private String keyword;
	private String pageNum;
	private int start;			private int end;
	private String user_nickname;
	private String user_image;
	private int photochk_num;
	private String today;

	
	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public int getPhotochk_num() {
		return photochk_num;
	}

	public void setPhotochk_num(int photochk_num) {
		this.photochk_num = photochk_num;
	}

	public String getUser_image() {
		return user_image;
	}

	public void setUser_image(String user_image) {
		this.user_image = user_image;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
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

	public int getChg_num() {
		return chg_num;
	}

	public void setChg_num(int chg_num) {
		this.chg_num = chg_num;
	}

	public String getParti_id_email() {
		return parti_id_email;
	}

	public void setParti_id_email(String parti_id_email) {
		this.parti_id_email = parti_id_email;
	}

	public Timestamp getUpload_timestamp() {
		return upload_timestamp;
	}

	public void setUpload_timestamp(Timestamp upload_timestamp) {
		this.upload_timestamp = upload_timestamp;
	}

	public int getConfirm_state() {
		return confirm_state;
	}

	public void setConfirm_state(int confirm_state) {
		this.confirm_state = confirm_state;
	}

	public String getConfirm_image() {
		return confirm_image;
	}

	public void setConfirm_image(String confirm_image) {
		this.confirm_image = confirm_image;
	}

}
