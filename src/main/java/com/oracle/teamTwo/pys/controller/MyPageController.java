package com.oracle.teamTwo.pys.controller;

import java.sql.Timestamp;
import java.util.ArrayList; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.oracle.teamTwo.pys.dao.DayDao;
import com.oracle.teamTwo.pys.service.MyPageService;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Follower;
import com.oracle.teamTwo.teamtwo.model.Following;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService myPageService;
	
//	@RequestMapping(value = "mypage")
//	public String mypage(Model model, HttpServletRequest request, User_info user_info) {
//		
//		String user_id_email = request.getParameter("user_id_email");
//		String page_id_email = request.getParameter("page_id_email");
//		model.addAttribute("user_id_email", user_id_email);
//		model.addAttribute("page_id_email", page_id_email);
//		
//		List<User_info> userlist_me = new ArrayList<User_info>();
//		userlist_me = myPageService.name(user_id_email);
//		model.addAttribute("userlist_me", userlist_me);
//		
//		String follow_Did = myPageService.follow_Did(user_id_email, page_id_email);
//		model.addAttribute("follow_Did", follow_Did);
//		
//		List<DayDao> calendar = new ArrayList<DayDao>();
//		calendar = myPageService.sysdate();
//		model.addAttribute("calendar", calendar);
//
//		List<User_info> userlist = new ArrayList<User_info>();
//		userlist = myPageService.name(page_id_email);
//		model.addAttribute("userlist", userlist);
//		
//		List<Challenge> calendar_master = new ArrayList<Challenge>();
//		calendar_master = myPageService.calendar_master(page_id_email);
//		model.addAttribute("calendar_master", calendar_master);
//		
//		List<Challenge> challenges = new ArrayList<Challenge>();
//		challenges = myPageService.challenges(page_id_email);
//		model.addAttribute("challenges", challenges);
//		
//		List<Point> points = new ArrayList<Point>();
//		points = myPageService.point_list(page_id_email);
//		model.addAttribute("points", points);
//		
//		String follower = myPageService.follower(page_id_email);
//		model.addAttribute("follower", follower);
//		
//		String following = myPageService.following(page_id_email);
//		model.addAttribute("following", following);
//		
//		String point = myPageService.point(page_id_email);
//		model.addAttribute("point", point);
//		
//		String ch_success = myPageService.ch_success(page_id_email);
//		String ch_progress = myPageService.ch_progress(page_id_email);
//		String ch_fail = myPageService.ch_fail(page_id_email);
//		model.addAttribute("ch_success", ch_success);
//		model.addAttribute("ch_progress", ch_progress);
//		model.addAttribute("ch_fail", ch_fail);
//		
//		int ch_all = Integer.parseInt(ch_success) + Integer.parseInt(ch_progress) + Integer.parseInt(ch_fail);
//		
//		int ch_success_p = 0;
//		try {
//			ch_success_p = Integer.parseInt(ch_success) * 100 / ch_all;
//		} catch (Exception e) {
//			ch_success_p = 0;
//		}
//		
//		int ch_progress_p = 0;
//		try {
//			ch_progress_p = Integer.parseInt(ch_progress) * 100 / ch_all;
//		} catch (Exception e) {
//			ch_progress_p = 0;
//		}
//		
//		int ch_fail_p = 0;
//		try {
//			ch_fail_p = Integer.parseInt(ch_fail) * 100 / ch_all;
//		} catch (Exception e) {
//			ch_fail_p = 0;
//		}
//		
//		if (ch_success_p == 0 && ch_progress_p == 0 && ch_fail_p== 0) {
//			model.addAttribute("ch_success_p_1", "0%");
//			model.addAttribute("ch_success_p_2", "33%");
//			model.addAttribute("ch_progress_p_1", "33%");
//			model.addAttribute("ch_progress_p_2", "67%");
//			model.addAttribute("ch_fail_p_1", "67%");
//			model.addAttribute("ch_fail_p_2", "100%");
//		} else {
//			model.addAttribute("ch_success_p_1", "0%");
//			model.addAttribute("ch_success_p_2", ch_success_p + "%");
//			model.addAttribute("ch_progress_p_1", ch_success_p + "%");
//			model.addAttribute("ch_progress_p_2", ch_success_p + ch_progress_p + "%");
//			model.addAttribute("ch_fail_p_1", ch_success_p + ch_progress_p + "%");
//			model.addAttribute("ch_fail_p_2", "100%");
//		}
//		
//		return "pys/mypage";
//	}
	
	@RequestMapping(value = "mypage_follow")
	public String mypage_follow(User_info user_info, @RequestParam("page_id_email")String page_id_email, @RequestParam("follow_Did")String follow_Did, Model model) {
		
		String user_id_email = user_info.getUser_id_email();
		model.addAttribute("user_id_email", user_id_email);
		model.addAttribute("page_id_email", page_id_email);
		
		System.out.println(user_info.getUser_id_email());
		System.out.println(page_id_email);
		
		if (follow_Did.equals("0")) {
			System.out.println("팔로우하기");
			myPageService.follower_insert(user_id_email, page_id_email);
			myPageService.following_insert(user_id_email, page_id_email);
		} else {
			System.out.println("팔로우해제");
			myPageService.follower_del(user_id_email, page_id_email);
			myPageService.following_del(user_id_email, page_id_email);
		}
		
		return "redirect:mypage?user_id_email=" + user_id_email;
	}
	
	@RequestMapping(value = "mypage_profile")
	public String mypage_profile(User_info user_info, Model model) {
		
		String user_id_email = user_info.getUser_id_email();
		
		List<User_info> userlist = new ArrayList<User_info>();
		userlist = myPageService.name(user_id_email);
		model.addAttribute("userlist", userlist);
		
		return "pys/mypage_profile";
	}
	
	@RequestMapping(value = "mypage_followers")
	public String mypage_followers(User_info user_info, Model model) {
		
		String user_id_email = user_info.getUser_id_email();
		String page_id_email = user_info.getUser_id_email();
		model.addAttribute("user_id_email", user_id_email);
		model.addAttribute("page_id_email", page_id_email);
		
		List<User_info> userlist_me = new ArrayList<User_info>();
		userlist_me = myPageService.name(user_id_email);
		model.addAttribute("userlist_me", userlist_me);
		
		List<User_info> userlist = new ArrayList<User_info>();
		userlist = myPageService.name(page_id_email);
		model.addAttribute("userlist", userlist);
		
		List<Follower> follower_list = new ArrayList<Follower>();
		follower_list = myPageService.follower_list(page_id_email);
		model.addAttribute("follower_list", follower_list);
		
		List<Following> following_list = new ArrayList<Following>();
		following_list = myPageService.following_list(page_id_email);
		model.addAttribute("following_list", following_list);
		
		List<User_info> following_list_user_info = new ArrayList<User_info>();
		following_list_user_info = myPageService.name(page_id_email);
		model.addAttribute("following_list_user_info", following_list_user_info);
		
		List<String> followings_haeseum = new ArrayList<String>();
		
		for (int i = 0; i < follower_list.size(); i ++) {
			
			try {
			followings_haeseum.add(myPageService.followings_haeseum(page_id_email, following_list_user_info.get(i).getUser_id_email()));
			} catch (Exception e) {
				followings_haeseum.add("팔로우");
			}
		}
		
		model.addAttribute("followings_haeseum", followings_haeseum);
		
		String follower = myPageService.follower(page_id_email);
		model.addAttribute("follower", follower);
		
		String following = myPageService.following(page_id_email);
		model.addAttribute("following", following);
		
		return "pys/mypage_followers";
	}
	
	@RequestMapping(value = "mypage_following")
	public String mypage_following(User_info user_info, Model model, @RequestParam("page_id_email")String page_id_email) {
		
		String user_id_email = user_info.getUser_id_email();
		model.addAttribute("user_id_email", user_id_email);
		model.addAttribute("page_id_email", page_id_email);
		
		List<User_info> userlist_me = new ArrayList<User_info>();
		userlist_me = myPageService.name(user_id_email);
		model.addAttribute("userlist_me", userlist_me);
		
		List<User_info> userlist = new ArrayList<User_info>();
		userlist = myPageService.name(page_id_email);
		model.addAttribute("userlist", userlist);
		
		List<Follower> follower_list = new ArrayList<Follower>();
		follower_list = myPageService.follower_list(page_id_email);
		model.addAttribute("follower_list", follower_list);
		
		List<Following> following_list = new ArrayList<Following>();
		following_list = myPageService.following_list(page_id_email);
		model.addAttribute("following_list", following_list);
		
		String follower = myPageService.follower(page_id_email);
		model.addAttribute("follower", follower);
		
		String following = myPageService.following(page_id_email);
		model.addAttribute("following", following);
		
		return "pys/mypage_following";
	}
	
//	@RequestMapping(value = "mypage_point")
//	public String mypage_point(User_info user_info, Model model, @RequestParam("page_id_email")String page_id_email) {
//		
//		String user_id_email = user_info.getUser_id_email();
//		model.addAttribute("user_id_email", user_id_email);
//		model.addAttribute("page_id_email", page_id_email);
//		
//		List<User_info> userlist_me = new ArrayList<User_info>();
//		userlist_me = myPageService.name(user_id_email);
//		model.addAttribute("userlist_me", userlist_me);
//		
//		List<User_info> userlist = new ArrayList<User_info>();
//		userlist = myPageService.name(page_id_email);
//		model.addAttribute("userlist", userlist);
//		
//		List<Follower> follower_list = new ArrayList<Follower>();
//		follower_list = myPageService.follower_list(page_id_email);
//		model.addAttribute("follower_list", follower_list);
//		
//		List<Following> following_list = new ArrayList<Following>();
//		following_list = myPageService.following_list(page_id_email);
//		model.addAttribute("following_list", following_list);
//		
//		String follower = myPageService.follower(page_id_email);
//		model.addAttribute("follower", follower);
//		
//		String following = myPageService.following(page_id_email);
//		model.addAttribute("following", following);
//		
//		return "pys/mypage_point";
//	}
	
	
}
