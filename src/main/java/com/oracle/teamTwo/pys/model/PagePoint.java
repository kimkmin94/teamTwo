package com.oracle.teamTwo.pys.model;

import java.sql.Timestamp;

public class PagePoint {

	private String user_id_email;
	private int point_plus;
	private int point_minus;
	private int point_balance;
	private Timestamp point_timestamp;
	private int chg_num;
	private String point_memo;
	
	//페이징
	private int start; 		 private int end;
		
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

	public String getUser_id_email() {
		return user_id_email;
	}

	public void setUser_id_email(String user_id_email) {
		this.user_id_email = user_id_email;
	}

	public int getPoint_plus() {
		return point_plus;
	}

	public void setPoint_plus(int point_plus) {
		this.point_plus = point_plus;
	}

	public int getPoint_minus() {
		return point_minus;
	}

	public void setPoint_minus(int point_minus) {
		this.point_minus = point_minus;
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

	public int getChg_num() {
		return chg_num;
	}

	public void setChg_num(int chg_num) {
		this.chg_num = chg_num;
	}

	public String getPoint_memo() {
		return point_memo;
	}

	public void setPoint_memo(String point_memo) {
		this.point_memo = point_memo;
	}

		
}
