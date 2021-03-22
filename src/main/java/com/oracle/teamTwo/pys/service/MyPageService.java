package com.oracle.teamTwo.pys.service;

import java.util.List;

import com.oracle.teamTwo.pys.dao.DayDao;
import com.oracle.teamTwo.pys.model.PagePoint;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Follower;
import com.oracle.teamTwo.teamtwo.model.Following;
import com.oracle.teamTwo.teamtwo.model.Part_challenge;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

public interface MyPageService {

	public List<DayDao> sysdate();
	public String day(String date, String dateType);
	public List<User_info> name(String user_id_email);
	public String follower(String user_id_email);
	public String following(String user_id_email);
	public String point(String user_id_email);
	public String ch_success(String user_id_email);
	public String ch_progress(String user_id_email);
	public String ch_fail(String user_id_email);
	public List<Challenge> challenges(String user_id_email);
	List<Challenge> calendar_master(String user_id_email);
	public void follower_insert(String user_id_email, String page_id_email);
	public void following_insert(String user_id_email, String page_id_email);
	public String follow_Did(String user_id_email, String page_id_email);
	public void follower_del(String user_id_email, String page_id_email);
	public void following_del(String user_id_email, String page_id_email);
	public List<Follower> follower_list(String page_id_email);
	public List<Following> following_list(String page_id_email);
	public List<Point> point_list(String page_id_email);
	public String followings_haeseum(String page_id_email, String user_follower);
	public List<String> follwer_haeseum(String page_id_email);
	public List<User_info> follower_search(String page_id_email, String follower_scroll);
	public List<User_info> following_search(String page_id_email, String following_scroll);
	

	public int total(String user_id_email);
	public List<PagePoint> dhPoint_list(PagePoint pagePoint);
	public int myPoint(String user_id_email);
	
	
	public String follow_page_me(String user_id_email, String page_id_email);
	public List<Part_challenge> follwer_challenge(List<Following> following_list);
	public List<Part_challenge> follwer_challenge_master(List<Following> following_list);
}
