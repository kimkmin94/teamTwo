package com.oracle.teamTwo.km.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.teamTwo.km.dao.ChatRoomRepository;
import com.oracle.teamTwo.km.model.ChatMessage;
import com.oracle.teamTwo.km.service.ChatService;
import com.oracle.teamTwo.teamtwo.model.User_info;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
public class ChatController {
	// teamtwo user model 시작
	   @SuppressWarnings("null")
	   @ModelAttribute("user_model")
	   public void user_model(User_info user_model, HttpServletRequest request) {
		   
		   HttpSession session = request.getSession();
		   
			   session.setAttribute("user_id_email", session.getAttribute("user_id_email"));
			   session.setAttribute("user_nickname", session.getAttribute("user_nickname"));
			   session.setAttribute("user_image", session.getAttribute("user_image"));

	   } // teamtwo user model 끝
	   
	private final ChatService chatService;
	private final ChatRoomRepository chatRoomRepository;
	
	/**
	 * websocket "/pub/chat/message"로 들어오는 메시징을 처리한다.
	 */
	@MessageMapping("/chat/message")
	public void message(ChatMessage message) {
		
		// 채팅방 인원수 세팅
		message.setUserCount(chatRoomRepository.getUserCount(message.getRoomId()));
		
		// Websocket에 발행된 메시지를 redis로 발행(publish)
		chatService.sendChatMessage(message);
	}

}
