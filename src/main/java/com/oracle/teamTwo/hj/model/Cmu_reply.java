package com.oracle.teamTwo.hj.model;

import java.util.Date;

public class Cmu_reply {

	private int b_num;
	private int re_no;
	private int re_order;
	private int re_depth;
	private String re_contents;
	private String re_writer;
	private Date re_date;
	private int re_state;

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

}
