package com.oracle.teamTwo.hs.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.hs.dao.UserInfoDao;
import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Community;

@Service
public class UserInfoServiceImpl implements UserInfoService {
	
	@Autowired
	private UserInfoDao ud;
	

	@Override
	public List<User_info> listUser(User_info user) {
		
		List<User_info> userList = null;
		userList = ud.listUser(user);
		
		return userList;
	}


	
	
	@Override
	public List<Community> listCm(Community com) {
		
		return ud.listCm(com);
	}




	@Override
	public Community detail(int b_num) {
		return ud.detail(b_num);
	}




	@Override
	public User_info stop(String user_id_email) {
		return ud.stop(user_id_email);
	}




	@Override
	public User_info run(String user_id_email) {
		return ud.run(user_id_email);
	}




	@Override
	public List<Challenge> listCh(Challenge ch) {
		return ud.listCh(ch);
	}




	@Override
	public Challenge delete(int chg_num) {
		return ud.delete(chg_num);
	}



}
