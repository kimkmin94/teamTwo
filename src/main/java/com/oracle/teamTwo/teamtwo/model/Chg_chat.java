package com.oracle.teamTwo.teamtwo.model;

import java.sql.Timestamp;

public class Chg_chat {

	private int chat_num;
	private int chg_num;
	private String chat_id_email;
	private Timestamp chat_timestamp;
	private String chat_contents;

	public int getChat_num() {
		return chat_num;
	}

	public void setChat_num(int chat_num) {
		this.chat_num = chat_num;
	}

	public int getChg_num() {
		return chg_num;
	}

	public void setChg_num(int chg_num) {
		this.chg_num = chg_num;
	}

	public String getChat_id_email() {
		return chat_id_email;
	}

	public void setChat_id_email(String chat_id_email) {
		this.chat_id_email = chat_id_email;
	}

	public Timestamp getChat_timestamp() {
		return chat_timestamp;
	}

	public void setChat_timestamp(Timestamp chat_timestamp) {
		this.chat_timestamp = chat_timestamp;
	}

	public String getChat_contents() {
		return chat_contents;
	}

	public void setChat_contents(String chat_contents) {
		this.chat_contents = chat_contents;
	}

}
