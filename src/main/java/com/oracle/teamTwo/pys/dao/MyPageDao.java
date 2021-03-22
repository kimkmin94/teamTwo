package com.oracle.teamTwo.pys.dao;

import java.util.List;

import com.oracle.teamTwo.pys.model.PagePoint;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Follower;
import com.oracle.teamTwo.teamtwo.model.Following;
import com.oracle.teamTwo.teamtwo.model.Part_challenge;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

public interface MyPageDao {

	List<User_info> user(String user_id_email);
	String follower(String user_id_email);
	String following(String user_id_email);
	String point(String user_id_email);
	String ch_success(String user_id_email);
	String ch_progress(String user_id_email);
	String ch_fail(String user_id_email);
	List<Challenge> challenges(String user_id_email);
	List<Challenge> calendar_master(String user_id_email);
	void follower_insert(String user_id_email, String user_follower);
	void following_insert(String user_id_email, String user_following);
	String follow_Did(String user_id_email, String page_id_email);
	void follower_del(String user_id_email, String user_follower);
	void following_del(String user_id_email, String user_following);
	List<Follower> follower_list(String page_id_email);
	List<Following> following_list(String page_id_email);
	List<Point> point_list(String page_id_email);
	String followings_haeseum(String page_id_email, String user_follower);
	List<String> follower_haeseum(String page_id_email);
	List<User_info> follower_search(String page_id_email, String follower_scroll);
	List<User_info> following_search(String page_id_email, String following_scroll);

	
	public int total(String user_id_email);
	List<PagePoint> dhPoint_list(PagePoint pagePoint);
	public int myPoint(String user_id_email);
	
	
	String follow_page_me(String user_id_email, String page_id_email);
	List<Part_challenge> follwer_challenge(List<Following> follwer_challenge);
	List<Part_challenge> follwer_challenge_master(List<Following> following_list);
}
