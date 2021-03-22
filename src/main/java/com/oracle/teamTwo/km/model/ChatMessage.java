package com.oracle.teamTwo.km.model;

import lombok.Builder;

public class ChatMessage {
	public ChatMessage() {
		
	}
	
	@Builder
	public ChatMessage(MessageType type, String roomId, String sender, String message, long userCount) {
		this.type = type;
		this.roomId = roomId;
		this.sender = sender;
		this.message = message;
		this.userCount = userCount;
	}
	public enum MessageType{
		ENTER, QUIT, TALK
	}
	
	private MessageType type; //메시지타입
	private String roomId; //방번호
	private String sender; //보낸사람
	private String message; //내용
	private long userCount; //채팅방인원수
	
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
	public String getRoomId() {
		return roomId;
	}
	public void setRoomId(String roomId) {
		this.roomId = roomId;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	public long getUserCount() {
		return userCount;
	}

	public void setUserCount(long userCount) {
		this.userCount = userCount;
	}
	
	
}
