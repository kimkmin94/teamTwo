package com.oracle.teamTwo.ban.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oracle.teamTwo.ban.model.byPointUserinfo;
import com.oracle.teamTwo.ban.service.banChallengeService;
import com.oracle.teamTwo.ban.service.banRankingService;
import com.oracle.teamTwo.dh.service.dhUserServiceImpl;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Controller
public class banRankingController {

	@Autowired
	private banRankingService brs;

	@Autowired
	private banChallengeService bcs;

	// teamtwo user model 끝
	@Autowired
	dhUserServiceImpl dus;

	@ModelAttribute("user_model")
	public User_info user_model(User_info user_info) {
		User_info user_model = user_info;
		return user_model;
	} // teamtwo user model 시작

	@RequestMapping(value = "showrank")
	public String showrank(Model model, String user_id_email) {

		// user 정보 확인
		User_info userinfo = bcs.readUserInfo(user_id_email);
		model.addAttribute("userinfo", userinfo);
		
		
		// top10 리스트 읽어오기
		System.out.println("Banya : banRankingController > getPointUser() start");
		List<byPointUserinfo> list_PointUser = brs.getPointUser();
		model.addAttribute("pulist", list_PointUser);


		return "ban/showrank";
	}

}
