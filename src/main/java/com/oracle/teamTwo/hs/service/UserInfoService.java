package com.oracle.teamTwo.hs.service;

import java.util.List; 

import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Community;

public interface UserInfoService {
	//user_info
	List<User_info> listUser(User_info user);
	User_info		stop(String user_id_email);
	User_info		run(String user_id_email);
	
	//community
	List<Community> listCm(Community com);
	Community		detail(int b_num);
	
	//challege
	List<Challenge> listCh(Challenge ch);
	Challenge		delete(int chg_num);
}
