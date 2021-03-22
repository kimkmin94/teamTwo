package com.oracle.teamTwo.km.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.teamTwo.km.dao.ChatRoomRepository;
import com.oracle.teamTwo.km.model.ChatMessage;
import com.oracle.teamTwo.km.model.ChatRoom;
import com.oracle.teamTwo.teamtwo.model.User_info;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/chat")
public class ChatRoomController {
	// teamtwo user model 시작
	@SuppressWarnings("null")
	@ModelAttribute("user_model")
	public void user_model(User_info user_model, HttpServletRequest request) {

		HttpSession session = request.getSession();

		session.setAttribute("user_id_email", session.getAttribute("user_id_email"));
		session.setAttribute("user_nickname", session.getAttribute("user_nickname"));
		session.setAttribute("user_image", session.getAttribute("user_image"));

	} // teamtwo user model 끝

	private final ChatRoomRepository chatRoomRepository;

	// 채팅 리스트 화면
	@GetMapping("/room")
	public String rooms(Model model) {
		return "/km/room";
	}

	// 모든 채팅방 목록 반환
	@GetMapping("/rooms")
	@ResponseBody
	public List<ChatRoom> room() {
		List<ChatRoom> chatRooms = chatRoomRepository.findAllRoom();
		chatRooms.stream().forEach(room -> room.setUserCount(chatRoomRepository.getUserCount(room.getRoomId())));
		return chatRooms;
	}

	// 채팅방 생성
	@PostMapping("/room")
	@ResponseBody
	public ChatRoom createRoom(@RequestParam String name, @RequestParam String nickname) {

		return chatRoomRepository.createChatRoom(name, nickname);
	}


	// 채팅방 입장 화면
	@GetMapping("/room/enter/{roomId}")
	public String roomDetail(Model model, @PathVariable String roomId) {
		model.addAttribute("roomId", roomId);
		return "/km/roomdetail";
	}

	// 특정 채팅방 조회
	@GetMapping("/room/{roomId}")
	@ResponseBody
	public ChatRoom roomInfo(Model model, @PathVariable String roomId) {

		model.addAttribute("roomId", roomId);
		return chatRoomRepository.findRoomById(roomId);
	}
}
