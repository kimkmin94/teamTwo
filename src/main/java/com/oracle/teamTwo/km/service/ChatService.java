package com.oracle.teamTwo.km.service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.teamTwo.km.dao.ChatRoomRepository;
import com.oracle.teamTwo.km.model.ChatMessage;
import com.oracle.teamTwo.km.model.ChatRoom;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ChatService {
	private static final String CHAT_ROOMS = "CHAT_ROOM"; // 채팅룸 저장
	
	private final ChannelTopic channelTopic;
	private final RedisTemplate redisTemplate;
	private final ChatRoomRepository chatRoomRepository;
	
	@Resource(name = "redisTemplate")
	private HashOperations<String, String, String> hashOpsEnterInfo;

	/**
	 * destination정보에서 roomId 추출
	 */
	public String getRoomId(String destination) {
		int lastIndex = destination.lastIndexOf('/');
		if (lastIndex != -1)
			return destination.substring(lastIndex + 1);
		else
			return "";
	}

	/**
	 * 채팅방에 메시지 발송
	 */
	public void sendChatMessage(ChatMessage chatMessage) {
		String nickname = chatMessage.getSender();
		System.out.println("ChatService chatMessage.getSender-->"+nickname);
		chatMessage.setUserCount(chatRoomRepository.getUserCount(chatMessage.getRoomId()));
		if (ChatMessage.MessageType.ENTER.equals(chatMessage.getType())) {
			chatMessage.setMessage("[알림]"+nickname + "님이 방에 입장했습니다.");
	
		} else if (ChatMessage.MessageType.QUIT.equals(chatMessage.getType())) {
			chatMessage.setMessage("[알림]"+nickname + "님이 방에서 나갔습니다.");
			
		}
		redisTemplate.convertAndSend(channelTopic.getTopic(), chatMessage);
	}
}
