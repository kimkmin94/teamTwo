package com.oracle.teamTwo.dh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.dh.dao.dhUserDao;
import com.oracle.teamTwo.dh.model.Inter;
import com.oracle.teamTwo.dh.model.ThisPoint;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chat_category;
import com.oracle.teamTwo.teamtwo.model.Interest_category;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Service
public class dhUserServiceImpl implements dhUserService{
   
   @Autowired
   dhUserDao dud;

   @Override
   public int login(String user_id_email, String user_password) {
      int login = dud.login(user_id_email,user_password);
      return login;
   }

   @Override
   public int idCheck(String user_id_email) {
      int idCheck = dud.idCheck(user_id_email);
      return idCheck;
   }

   @Override
   public int nicCheck(String user_nickname) {
      int nicCheck = dud.nicCheck(user_nickname);
      return nicCheck;
   }

   @Override
   public int join(User_info user_info) {
      int join = dud.join(user_info);
      return join;
   }
   
   @Override
   public int point(String user_id_email) {
      int inPoint = dud.point(user_id_email);
      return inPoint;
   }

   @Override
   public String findId(User_info user_info) {
      String findId = dud.findId(user_info);
      return findId;
   }


   @Override
   public int findPw(User_info user_info) {
      int count = dud.findPw(user_info);
      return count;
   }

   @Override
   public void chPw(User_info user_info) {
      dud.chPw(user_info);
      
   }

   @Override
   public int interest(Interest_category category) {
      int result = dud.interest(category);
      return result;
   }

   @Override
   public List<Chat_category> chatList() {
      List<Chat_category> list = dud.chatList();
      return list;
   }

   @Override
   public String subject(Interest_category category) {
      String data = dud.subject(category);
      return data;
   }

   @Override
   public User_info myInfo(String user_id_email) {
      User_info user_info = dud.myInfo(user_id_email);
      return user_info;
   }


   @Override
   public List<Challenge> uchatList3(String user_id_email) {
      List<Challenge> list = dud.uchatList3(user_id_email);
      return list;
   }

   @Override
   public int updateInfo(User_info user_info) {
      int update = dud.updateInfo(user_info);
      return update;
   }

   @Override
   public String pwChk(String user_id_email) {
      String password = dud.pwChk(user_id_email);
      return password;
   }

   @Override
   public int myUser_update(User_info user_info) {
      int update = dud.myUser_update(user_info);
      return update;
   }

   @Override
   public int inter_update1(Inter inter) {
      int inter1 = dud.inter_update1(inter);
      return inter1;
   }

   @Override
   public int inter_update2(Inter inter) {
      int inter2 = dud.inter_update2(inter);
      return inter2;
   }

   @Override
   public int inter_update3(Inter inter) {
      int inter3 = dud.inter_update3(inter);
      return inter3;
   }

   @Override
   public String chkLogTime(String user_id_email) {
      String date = dud.chkLogTime(user_id_email);
      return date;
   }

   @Override
   public int dateCha(String date) {
      int dateCha = dud.dateCha(date);
      return dateCha;
   }

   @Override
   public int thisPoint(String user_id_email) {
      int balance_point = dud.thisPoint(user_id_email);
      return balance_point;
   }

   @Override
   public int loginPoint(ThisPoint thisPoint) {
      int insert = dud.loginPoint(thisPoint);
      return insert;
   }

   @Override
   public int state(String user_id_email) {
      int user_state = dud.state(user_id_email);
      return user_state;
   }

   @Override
   public int nickCheckInfo(String user_id_email, String user_nickname) {
      int result = dud.nickCheckInfo(user_id_email, user_nickname);
      return result;
   }

	@Override
	public User_info user(String user_id_email) {
		
		 User_info user_model = new User_info();
	     user_model = dud.user(user_id_email);
	     
		return user_model;
	}
	
	@Override
	public int interNum1(String user_id_email) {
		int result = dud.interNum1(user_id_email);
		return result;
	}
	
	@Override
	public int interNum2(String user_id_email) {
		int result = dud.interNum2(user_id_email);
		return result;
	}
	
	@Override
	public int interNum3(String user_id_email) {
		int result = dud.interNum3(user_id_email);
		return result;
	}


   
   
}