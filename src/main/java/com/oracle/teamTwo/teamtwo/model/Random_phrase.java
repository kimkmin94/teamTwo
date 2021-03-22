package com.oracle.teamTwo.teamtwo.model;

import java.sql.Date;

public class Random_phrase {

	private int phrase_num;
	private String phrase_contents;
	private Date today_record;

	public int getPhrase_num() {
		return phrase_num;
	}
	public void setPhrase_num(int phrase_num) {
		this.phrase_num = phrase_num;
	}

	public String getPhrase_contents() {
		return phrase_contents;
	}

	public void setPhrase_contents(String phrase_contents) {
		this.phrase_contents = phrase_contents;
	}

	public Date getToday_record() {
		return today_record;
	}

	public void setToday_record(Date today_record) {
		this.today_record = today_record;
	}

}
