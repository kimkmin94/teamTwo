package com.oracle.teamTwo.km.model;

import java.io.Serializable;
import java.util.UUID;

public class ChatRoom implements Serializable{
	private static final long serialVersionUID = 6494678977089006639L;
	private String roomId;
	private String name;
	private String nickname;
	private long userCount;
	
	public static ChatRoom create(String name, String nickname) {
		ChatRoom chatRoom = new ChatRoom();
		chatRoom.roomId = UUID.randomUUID().toString();
		chatRoom.name = name;
		chatRoom.nickname = nickname;
		return chatRoom;
	}

	
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}



	public long getUserCount() {
		return userCount;
	}



	public void setUserCount(long userCount) {
		this.userCount = userCount;
	}



	public String getRoomId() {
		return roomId;
	}

	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public String getNickname() {
		return nickname;
	}



	public void setNickname(String nickname) {
		this.nickname = nickname;
	}








	
}
