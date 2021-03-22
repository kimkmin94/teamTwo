package com.oracle.teamTwo.jy.model;

import java.sql.Timestamp;

public class ChgChatBox {
	//User_info 일부
	private String user_id_email;
	private String user_nickname;
	private String user_image;
	private int user_state;

	//Chg_chat 전체
	private int chat_num;
	private int chg_num;
	private String chat_id_email;
	private Timestamp chat_timestamp;
	private String chat_contents;
	
	
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
