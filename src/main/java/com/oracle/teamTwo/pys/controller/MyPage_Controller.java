package com.oracle.teamTwo.pys.controller;

import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.oracle.teamTwo.dh.service.dhUserServiceImpl;
import com.oracle.teamTwo.pys.dao.DayDao;
import com.oracle.teamTwo.pys.model.PagePoint;
import com.oracle.teamTwo.pys.service.MyPageService;
import com.oracle.teamTwo.pys.service.MyPage_Service;
import com.oracle.teamTwo.pys.service.Paging;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Follower;
import com.oracle.teamTwo.teamtwo.model.Following;
import com.oracle.teamTwo.teamtwo.model.Part_challenge;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Controller
public class MyPage_Controller {

	   
	   @Autowired
	   dhUserServiceImpl dus;
	   
	// teamtwo user model 시작
	   @SuppressWarnings("null")
	   @ModelAttribute("user_model")
	   public void user_model(User_info user_model, HttpServletRequest request) {
		   
		   HttpSession session = request.getSession();
		   	   user_model = dus.user((String)session.getAttribute("user_id_email"));
			   session.setAttribute("user_id_email", session.getAttribute("user_id_email"));
			   session.setAttribute("user_nickname", session.getAttribute("user_nickname"));
			   session.setAttribute("user_image", user_model.getUser_image());
			   System.out.println("session 값 : " + session.getAttribute("user_id_email"));
			   System.out.println("session 값 : " + session.getAttribute("user_nickname"));
			   System.out.println("session 값 : " + user_model.getUser_image());

	   } // teamtwo user model 끝
	   
	@Autowired
	private MyPageService myPageService;
	
	@RequestMapping(value = "mypage")
	public String mypage(Model model, User_info user_info, HttpServletRequest request, HttpSession session) {
		
		String Follower_scroll = request.getParameter("Follower_scroll");
		String Following_scroll = request.getParameter("Following_scroll");
		String Profile_area = request.getParameter("Profile_area");
		
		String user_id_email = (String) session.getAttribute("user_id_email");
	
		String page_id_email = null;
		if (session.getAttribute("page_id_email") == null || "".equals(session.getAttribute("page_id_email"))) {
			page_id_email = request.getParameter("page_id_email");
			model.addAttribute("page_id_email", page_id_email);
		} else {
			session.setAttribute("page_id_email", page_id_email);
			page_id_email = (String) session.getAttribute("page_id_email");
			model.addAttribute("page_id_email", page_id_email);
		}
		
		System.out.println("mypager start user_id_email : " + user_id_email);
		System.out.println("mypager start page_id_email : " + page_id_email);
		
		if (Follower_scroll != null) {
			System.out.println(Follower_scroll);
			
			List<User_info> follower_list = new ArrayList<User_info>();
			follower_list = myPageService.follower_search(page_id_email, Follower_scroll);
			model.addAttribute("follower_list", follower_list);
			
		} else if(Following_scroll != null) {
			System.out.println(Following_scroll);
			
			List<User_info> following_list = new ArrayList<User_info>();
			following_list = myPageService.following_search(page_id_email, Following_scroll);
			model.addAttribute("following_list", following_list);
			
		} else if (Profile_area != null) {
			
			System.out.println(user_id_email);
			System.out.println(page_id_email);
		
			
			List<User_info> userlist_page = new ArrayList<User_info>();
			userlist_page = myPageService.name(page_id_email);
			model.addAttribute("userlist_page", userlist_page);
			
			// 페이지 유저 팔로우
			List<Follower> follower_list = new ArrayList<Follower>();
			follower_list = myPageService.follower_list(page_id_email);
			model.addAttribute("follower_list", follower_list);
			
			// 페이지 유저 팔로잉
			List<Following> following_list = new ArrayList<Following>();
			following_list = myPageService.following_list(page_id_email);
			model.addAttribute("following_list", following_list);
			
			// 페이지 유저와 내가 팔로우 상태인지
			String follow_page_me = null;
			follow_page_me = myPageService.follow_page_me(user_id_email, page_id_email);
			model.addAttribute("follow_page_me", follow_page_me);
			
		} else {
			
		// 로그인 정보
		List<User_info> userlist_me = new ArrayList<User_info>();
		userlist_me = myPageService.name(user_id_email);
		model.addAttribute("userlist_me", userlist_me);
		model.addAttribute("user_id_email", userlist_me.get(0).getUser_id_email());
		model.addAttribute("user_nickname", userlist_me.get(0).getUser_nickname());
		
		// 페이지 유저 정보
		List<User_info> userlist_page = new ArrayList<User_info>();
		userlist_page = myPageService.name(page_id_email);
		model.addAttribute("userlist_page", userlist_page);
		
		// 페이지 유저 챌린지 진행
		List<Challenge> calendar_master = new ArrayList<Challenge>();
		calendar_master = myPageService.calendar_master(page_id_email);
		model.addAttribute("calendar_master", calendar_master);
		
		// 페이지 유저 챌린지 참여
		List<Challenge> challenges = new ArrayList<Challenge>();
		challenges = myPageService.challenges(page_id_email);
		model.addAttribute("challenges", challenges);
		
		// 페이지 유저 팔로우
		List<Follower> follower_list = new ArrayList<Follower>();
		follower_list = myPageService.follower_list(page_id_email);
		model.addAttribute("follower_list", follower_list);
		
		// 페이지 유저와 내가 팔로우 상태인지
		String follow_page_me = null;
		follow_page_me = myPageService.follow_page_me(user_id_email, page_id_email);
		model.addAttribute("follow_page_me", follow_page_me);
		
		// 페이지 유저 팔로잉 유무
		List<String> follwer_haeseum = new ArrayList<String>();
		follwer_haeseum = myPageService.follwer_haeseum(page_id_email);
		model.addAttribute("follwer_haeseum", follwer_haeseum);
		
		// 페이지 유저 팔로잉
		List<Following> following_list = new ArrayList<Following>();
		following_list = myPageService.following_list(page_id_email);
		model.addAttribute("following_list", following_list);
		
		// 팔로잉 챌린지 가져오기
		List<Part_challenge> follwer_challenge = new ArrayList<Part_challenge>();
		follwer_challenge = myPageService.follwer_challenge(following_list);
		model.addAttribute("follwer_challenge", follwer_challenge);
		
		// 팔로잉 챌린지 모집 가져오기
		List<Part_challenge> follwer_challenge_master = new ArrayList<Part_challenge>();
		follwer_challenge_master = myPageService.follwer_challenge_master(following_list);
		model.addAttribute("follwer_challenge_master", follwer_challenge_master);
		
		for (int i = 0 ; i < follwer_challenge.size(); i ++) {
			System.out.println(follwer_challenge.get(i).getChg_title());
		}
		
		// 페이지 유저 포인트
		List<Point> points = new ArrayList<Point>();
		points = myPageService.point_list(page_id_email);
		model.addAttribute("points", points);
		
		// 날짜
		List<DayDao> calendar = new ArrayList<DayDao>();
		calendar = myPageService.sysdate();
		model.addAttribute("calendar", calendar);
		
		// 성공 진행 실패 개수
		String ch_success = myPageService.ch_success(page_id_email);
		String ch_progress = myPageService.ch_progress(page_id_email);
		String ch_fail = myPageService.ch_fail(page_id_email);
		model.addAttribute("ch_success", ch_success);
		model.addAttribute("ch_progress", ch_progress);
		model.addAttribute("ch_fail", ch_fail);
		
		// 성공 진행 실패 합 ( 그래프 용 )
		int ch_all = Integer.parseInt(ch_success) + Integer.parseInt(ch_progress) + Integer.parseInt(ch_fail);
		
		// 
		int ch_success_p = 0;
		try {
			ch_success_p = Integer.parseInt(ch_success) * 100 / ch_all;
		} catch (Exception e) {
			ch_success_p = 0;
		}
		
		int ch_progress_p = 0;
		try {
			ch_progress_p = Integer.parseInt(ch_progress) * 100 / ch_all;
		} catch (Exception e) {
			ch_progress_p = 0;
		}
		
		int ch_fail_p = 0;
		try {
			ch_fail_p = Integer.parseInt(ch_fail) * 100 / ch_all;
		} catch (Exception e) {
			ch_fail_p = 0;
		}
		
		if (ch_success_p == 0 && ch_progress_p == 0 && ch_fail_p== 0) {
			model.addAttribute("ch_success_p_1", "0%");
			model.addAttribute("ch_success_p_2", "33%");
			model.addAttribute("ch_progress_p_1", "33%");
			model.addAttribute("ch_progress_p_2", "67%");
			model.addAttribute("ch_fail_p_1", "67%");
			model.addAttribute("ch_fail_p_2", "100%");
		} else {
			model.addAttribute("ch_success_p_1", "0%");
			model.addAttribute("ch_success_p_2", ch_success_p + "%");
			model.addAttribute("ch_progress_p_1", ch_success_p + "%");
			model.addAttribute("ch_progress_p_2", ch_success_p + ch_progress_p + "%");
			model.addAttribute("ch_fail_p_1", ch_success_p + ch_progress_p + "%");
			model.addAttribute("ch_fail_p_2", "100%");
		}
		
		}
		
		return "pys/mypage";
	}
	
	@RequestMapping(value = "mypage_point")
	public String mypage_point(Model model, HttpServletRequest request, String currentPage) {
		
		 HttpSession session = request.getSession();
		 String user_id_email = (String) session.getAttribute("user_id_email");
		 
		String Follower_scroll = request.getParameter("Follower_scroll");
		String Following_scroll = request.getParameter("Following_scroll");
		
		String page_id_email = user_id_email;
		
		System.out.println(page_id_email);
		
		if (Follower_scroll != null) {
			System.out.println(Follower_scroll);
			
			List<User_info> follower_list = new ArrayList<User_info>();
			follower_list = myPageService.follower_search(page_id_email, Follower_scroll);
			model.addAttribute("follower_list", follower_list);
			
		} else if(Following_scroll != null) {
			System.out.println(Following_scroll);
			
			List<User_info> following_list = new ArrayList<User_info>();
			following_list = myPageService.following_search(page_id_email, Following_scroll);
			model.addAttribute("following_list", following_list);
			
		} else {
			
		// 페이지 유저 정보
		List<User_info> userlist_page = new ArrayList<User_info>();
		userlist_page = myPageService.name(page_id_email);
		model.addAttribute("userlist_page", userlist_page);
		
		// 페이지 유저 팔로우
		List<Follower> follower_list = new ArrayList<Follower>();
		follower_list = myPageService.follower_list(page_id_email);
		model.addAttribute("follower_list", follower_list);
				
		// 페이지 유저 팔로잉 유무
		List<String> follwer_haeseum = new ArrayList<String>();
		follwer_haeseum = myPageService.follwer_haeseum(page_id_email);
		model.addAttribute("follwer_haeseum", follwer_haeseum);
				
		// 페이지 유저 팔로잉
		List<Following> following_list = new ArrayList<Following>();
		following_list = myPageService.following_list(page_id_email);
		model.addAttribute("following_list", following_list);
				
		// 페이지 유저 포인트
		List<Point> points = new ArrayList<Point>();
		points = myPageService.point_list(page_id_email);
		model.addAttribute("points", points);
		
		}
		
		//페이징 처리
				int total = myPageService.total(user_id_email);
				Paging pg = new Paging(total, currentPage);
				PagePoint pagePoint = new PagePoint();
				pagePoint.setUser_id_email(user_id_email);
				pagePoint.setStart(pg.getStart());
				pagePoint.setEnd(pg.getEnd());		
				List<PagePoint> point_list = myPageService.dhPoint_list(pagePoint);
				model.addAttribute("point_list", point_list);
				int myPoint = myPageService.myPoint(user_id_email);
				model.addAttribute("myPoint", myPoint);
				model.addAttribute("pg", pg);
		
		return "pys/mypage_point";
	}
	
}
