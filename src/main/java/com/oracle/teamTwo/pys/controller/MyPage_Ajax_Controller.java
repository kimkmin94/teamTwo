package com.oracle.teamTwo.pys.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.oracle.teamTwo.pys.service.MyPageService;
import com.oracle.teamTwo.pys.service.MyPage_Service;
import com.oracle.teamTwo.teamtwo.model.Follower;
import com.oracle.teamTwo.teamtwo.model.User_info;

@RestController
public class MyPage_Ajax_Controller {
	
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping("/getFollowerAjax")
	public HashMap<String, Object> getFollowerAjax(HttpServletRequest request) {
		
		String follower_button_background_color = request.getParameter("Follower_button_background_color");
		String following_button_background_color = request.getParameter("Following_button_background_color");
		
		System.out.println("Test 1 : " + follower_button_background_color);
		System.out.println("Test 1 : " + following_button_background_color);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (follower_button_background_color.equals("rgb(255, 250, 250)")) {
			map.put("Follower_button_background_color", "rgb(238, 232, 170)");
			map.put("Following_button_background_color", "rgb(255, 250, 250)");
		}
		
		return map;
	}
	
	@RequestMapping("/getFollowingAjax")
	public HashMap<String, Object> getFollowingAjax(HttpServletRequest request) {
		
		String follower_button_background_color = request.getParameter("Follower_button_background_color");
		String following_button_background_color = request.getParameter("Following_button_background_color");
		
		System.out.println("Test 2 : " + follower_button_background_color);
		System.out.println("Test 2 : " + following_button_background_color);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if (following_button_background_color.equals("rgb(255, 250, 250)")) {
			map.put("Follower_button_background_color", "rgb(255, 250, 250)");
			map.put("Following_button_background_color", "rgb(238, 232, 170)");
		}
		
		return map;
	}
	
	@RequestMapping("/getFollowing_haeseumAjax")
	public String getFollowing_haeseumAjax(HttpServletRequest request) {
		
		String follower_list_follower_id_email = request.getParameter("follower_list_follower_id_email");
		String follower_list_user_id_email = request.getParameter("follower_list_user_id_email");
		
		myPageService.follower_insert(follower_list_follower_id_email, follower_list_user_id_email);
		myPageService.following_insert(follower_list_user_id_email, follower_list_follower_id_email);
		
		String num = myPageService.following(follower_list_user_id_email);
		System.out.println(num);
		
		return num;
	}
	
	@RequestMapping("/getFollowing_delAjax")
	public String getFollowing_delAjax(HttpServletRequest request) {
		
		String following_list_following_id_email = request.getParameter("following_list_following_id_email");
		String following_list_user_id_email = request.getParameter("following_list_user_id_email");
		
		myPageService.follower_del(following_list_user_id_email, following_list_following_id_email);
		myPageService.following_del(following_list_user_id_email, following_list_following_id_email);
		
		String num = myPageService.following(following_list_user_id_email);
		System.out.println(num);
		
		return num;
	}
	
	
	@RequestMapping("/getFollowing_reAjax")
	public String getFollowing_re(HttpServletRequest request) {
		
		String following_list_following_id_email = request.getParameter("following_list_following_id_email");
		String following_list_user_id_email = request.getParameter("following_list_user_id_email");
		
		myPageService.follower_insert(following_list_following_id_email, following_list_user_id_email);
		myPageService.following_insert(following_list_user_id_email, following_list_following_id_email);
		
		String num = myPageService.following(following_list_user_id_email);
		System.out.println(num);
		
		return num;
	}
	
	@RequestMapping("/getFollower_searchAjax")
	public String getFollower_searchAjax(HttpServletRequest request) {
		
		String search = request.getParameter("search");
		String user_id_email = request.getParameter("user_id_email");
		
		System.out.println(search);
		System.out.println(user_id_email);
		
//		List<User_info> followers = new ArrayList<User_info>();
//		followers = myPageService.floower_search(user_id_email, search);
		
		return search;
	}
	
	@RequestMapping("/getFollowing_searchAjax")
	public String getFollowing_searchAjax(HttpServletRequest request) {
		
		String search = request.getParameter("search");
		String user_id_email = request.getParameter("user_id_email");
		
		System.out.println(search);
		System.out.println(user_id_email);
		
//		List<User_info> followers = new ArrayList<User_info>();
//		followers = myPageService.floower_search(user_id_email, search);
		
		return search;
	}
	
	@RequestMapping(value = "/getFollow_logintopageAjax")
	public String getFollow_logintopageAjax(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String user_id_email = (String) session.getAttribute("user_id_email");
		String page_id_email = request.getParameter("page_id_email");
		
		System.out.println("Test1 : " + user_id_email);
		System.out.println("Test1 : " + page_id_email);
		
		myPageService.follower_insert(page_id_email, user_id_email);
		myPageService.following_insert(user_id_email, page_id_email);
		
		model.addAttribute("page_id_email", page_id_email);
		
		return page_id_email;
	}
	
	@RequestMapping(value = "/getFollow_logintopage_delAjax")
	public String getFollow_logintopage_delAjax(Model model, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		String user_id_email = (String) session.getAttribute("user_id_email");
		String page_id_email = request.getParameter("page_id_email");
		
		System.out.println("Test2 : " + user_id_email);
		System.out.println("Test2 : " + page_id_email);
		
		myPageService.follower_del(user_id_email, page_id_email);
		myPageService.following_del(user_id_email, page_id_email);
		
		model.addAttribute("page_id_email", page_id_email);
		
		return page_id_email;
	}
}
