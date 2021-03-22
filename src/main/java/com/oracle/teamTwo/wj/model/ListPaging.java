package com.oracle.teamTwo.wj.model;

import java.sql.Date;


public class ListPaging {

	
	private int chg_num;
	private int lc_num;
	private int mc_num;
	private int sc_num;
	private String chg_master;
	private String master_nickname;
	private Date chg_regdate;
	private Date chg_startdate;
	private Date chg_enddate;
	private int chg_capacity;
	private String chg_title;
	private String chg_contents;
	private String chg_image;
	private int chg_like_count;
	private int chg_state;
	private String chg_sample_image;
	private String chg_sample_text;
	private int chg_now_parti;
	private String chg_confirm_time;
	
	//송우재님 검색용 변수
	private String hashtag_text;
	//송우재님 리스트 카운트
    private int count;
    private int pageSize;    
    private int blockSize;    
    private int currentPage;    
    private int startRow;    
    private int endRow;   
    private int startNum;    
    private int pageCnt;
    private int startPage;
    private int endPage;
	
    
	public int getChg_num() {
		return chg_num;
	}
	public void setChg_num(int chg_num) {
		this.chg_num = chg_num;
	}
	public int getLc_num() {
		return lc_num;
	}
	public void setLc_num(int lc_num) {
		this.lc_num = lc_num;
	}
	public int getMc_num() {
		return mc_num;
	}
	public void setMc_num(int mc_num) {
		this.mc_num = mc_num;
	}
	public int getSc_num() {
		return sc_num;
	}
	public void setSc_num(int sc_num) {
		this.sc_num = sc_num;
	}
	public String getChg_master() {
		return chg_master;
	}
	public void setChg_master(String chg_master) {
		this.chg_master = chg_master;
	}
	public String getMaster_nickname() {
		return master_nickname;
	}
	public void setMaster_nickname(String master_nickname) {
		this.master_nickname = master_nickname;
	}
	public Date getChg_regdate() {
		return chg_regdate;
	}
	public void setChg_regdate(Date chg_regdate) {
		this.chg_regdate = chg_regdate;
	}
	public Date getChg_startdate() {
		return chg_startdate;
	}
	public void setChg_startdate(Date chg_startdate) {
		this.chg_startdate = chg_startdate;
	}
	public Date getChg_enddate() {
		return chg_enddate;
	}
	public void setChg_enddate(Date chg_enddate) {
		this.chg_enddate = chg_enddate;
	}
	public int getChg_capacity() {
		return chg_capacity;
	}
	public void setChg_capacity(int chg_capacity) {
		this.chg_capacity = chg_capacity;
	}
	public String getChg_title() {
		return chg_title;
	}
	public void setChg_title(String chg_title) {
		this.chg_title = chg_title;
	}
	public String getChg_contents() {
		return chg_contents;
	}
	public void setChg_contents(String chg_contents) {
		this.chg_contents = chg_contents;
	}
	public String getChg_image() {
		return chg_image;
	}
	public void setChg_image(String chg_image) {
		this.chg_image = chg_image;
	}
	public int getChg_like_count() {
		return chg_like_count;
	}
	public void setChg_like_count(int chg_like_count) {
		this.chg_like_count = chg_like_count;
	}
	public int getChg_state() {
		return chg_state;
	}
	public void setChg_state(int chg_state) {
		this.chg_state = chg_state;
	}
	public String getChg_sample_image() {
		return chg_sample_image;
	}
	public void setChg_sample_image(String chg_sample_image) {
		this.chg_sample_image = chg_sample_image;
	}
	public String getChg_sample_text() {
		return chg_sample_text;
	}
	public void setChg_sample_text(String chg_sample_text) {
		this.chg_sample_text = chg_sample_text;
	}
	public int getChg_now_parti() {
		return chg_now_parti;
	}
	public void setChg_now_parti(int chg_now_parti) {
		this.chg_now_parti = chg_now_parti;
	}
	public String getChg_confirm_time() {
		return chg_confirm_time;
	}
	public void setChg_confirm_time(String chg_confirm_time) {
		this.chg_confirm_time = chg_confirm_time;
	}
	public String getHashtag_text() {
		return hashtag_text;
	}
	public void setHashtag_text(String hashtag_text) {
		this.hashtag_text = hashtag_text;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getPageCnt() {
		return pageCnt;
	}
	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
    
    
}
