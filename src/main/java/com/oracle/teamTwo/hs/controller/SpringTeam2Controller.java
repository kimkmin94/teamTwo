package com.oracle.teamTwo.hs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.dh.service.dhUserServiceImpl;
import com.oracle.teamTwo.hs.service.UserInfoService;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Community;

@Controller
public class SpringTeam2Controller {
	
	@Autowired
	private UserInfoService us;
	
	   // teamtwo user model 끝
	   @Autowired
	   dhUserServiceImpl dus;
	   
	   @ModelAttribute("user_model")
	   public void user_model(Model model, User_info user_model, HttpServletRequest request) {
		   
		   HttpSession session = request.getSession();
		   
		   session.setAttribute("user_id_email", session.getAttribute("user_id_email"));
		   session.setAttribute("user_nickname", session.getAttribute("user_nickname"));
		   session.setAttribute("user_image", session.getAttribute("user_image"));
		   
	   } // teamtwo user model 시작
	
	@GetMapping(value = "admin")
	public String index(Model model, User_info user) {
		List<User_info> listUser = us.listUser(user);
		System.out.println("listUser. size : "+listUser.size());
		model.addAttribute("listUser", listUser);
		return "hs/list";
	}
	
	@RequestMapping(value = "userlist")
	public String list(Model model,User_info user) {
		System.out.println("유저Controller list start... ");
		
		List<User_info> listUser = us.listUser(user);
		System.out.println("listUser. size : "+listUser.size());
		model.addAttribute("listUser", listUser);
		
		return "hs/list";
	}
	
	
	@RequestMapping(value = "cmlist")
	public String list(Model model, Community com) {
		System.out.println("커뮤니티 컨트롤러 시작~");
		List<Community> listCm = us.listCm(com);
		model.addAttribute("listCm", listCm);
		return "hs/cmlist";
	}
	
	
	@GetMapping(value= "updateForm")
	public String updateForm(int b_num, Model model) {
		Community com = us.detail(b_num);
		model.addAttribute("com", com);
		
		return "forward:cmlist";
	}
	
	@GetMapping(value = "userUpdate")
	public String userUpdate(String user_id_email, Model model) {
		User_info user = us.stop(user_id_email);
		model.addAttribute("user", user);
		
		return "forward:userlist";
	}
	
	
	@GetMapping(value = "userUpdate2")
	public String userUpdate2(String user_id_email, Model model) {
		User_info user = us.run(user_id_email);
		model.addAttribute("user", user);
		
		return "forward:userlist";
	}
	
	
	@RequestMapping(value = "chlist")
	public String list(Model model,Challenge ch) {
		System.out.println("챌린지컨트롤러 list start... ");
		
		List<Challenge> listCh = us.listCh(ch);
		System.out.println("챌린지 사이즈 : "+listCh.size());
		model.addAttribute("listCh", listCh);
		

		return "hs/chlist";
	}
	
	@GetMapping(value = "updateCh")
	public String updateCh(int chg_num, Model model) {
		Challenge ch = us.delete(chg_num);
		model.addAttribute("ch", ch);
		return "forward:chlist";
	}

}
