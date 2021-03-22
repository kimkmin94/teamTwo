package com.oracle.teamTwo.km.dao;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.data.redis.core.HashOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.data.redis.listener.ChannelTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.teamTwo.km.model.ChatMessage;
import com.oracle.teamTwo.km.model.ChatRoom;
import com.oracle.teamTwo.km.service.RedisSubscriber;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Repository
public class ChatRoomRepository {
	// Redis CacheKeys
	private static final String CHAT_ROOMS = "CHAT_ROOM"; // 채팅룸 저장
	public static final String USER_COUNT = "USER_COUNT"; // 채팅룸에 입장한 클라이언트수 저장
	public static final String ENTER_INFO = "ENTER_INFO"; // 채팅룸에 입장한 클라이언트의 sessionId와 채팅룸 id를 맵핑한 정보 저장

	@Resource(name = "redisTemplate")
	private HashOperations<String, String, ChatRoom> hashOpsChatRoom;
	@Resource(name = "redisTemplate")
	private HashOperations<String, String, String> hashOpsEnterInfo;
	@Resource(name = "redisTemplate")
	private ValueOperations<String, String> valueOps;

	public List<ChatRoom> findAllRoom() {
		return hashOpsChatRoom.values(CHAT_ROOMS);
	}

	public ChatRoom findRoomById(String roomId) {
		return hashOpsChatRoom.get(CHAT_ROOMS, roomId);
	}

	/**
	 * 채팅방 생성 : 서버간 채팅방 공유를 위해 redis hash에 저장한다.
	 */
	public ChatRoom createChatRoom(String name, String nickname) {
		ChatRoom chatRoom = ChatRoom.create(name, nickname);
		hashOpsChatRoom.put(CHAT_ROOMS, chatRoom.getRoomId(), chatRoom);
		
		return chatRoom;
	}

	// 유저가 입장한 채팅방ID와 유저 세션ID 맵핑 정보 저장
	public void setUserEnterInfo(String sessionId, String roomId) {
		hashOpsEnterInfo.put(ENTER_INFO, sessionId, roomId);
	}

	// 유저 세션으로 입장해 있는 채팅방 ID 조회
	public String getUserEnterRoomId(String sessionId) {
		return hashOpsEnterInfo.get(ENTER_INFO, sessionId);
	}

	// 유저 세션정보와 맵핑된 채팅방ID 삭제
	public void removeUserEnterInfo(String nameId) {
		hashOpsEnterInfo.delete(ENTER_INFO, nameId);
	}

	// 채팅방 유저수 조회
	public long getUserCount(String roomId) {
		return Long.valueOf(Optional.ofNullable(valueOps.get(USER_COUNT + "_" + roomId)).orElse("0"));
	}

	// 채팅방에 입장한 유저수 +1
	public long plusUserCount(String roomId) {
		return Optional.ofNullable(valueOps.increment(USER_COUNT + "_" + roomId)).orElse(0L);
	}

	// 채팅방에 입장한 유저수 -1
	public long minusUserCount(String roomId) {
		return Optional.ofNullable(valueOps.decrement(USER_COUNT + "_" + roomId)).filter(count -> count > 0).orElse(0L);
	}

}
