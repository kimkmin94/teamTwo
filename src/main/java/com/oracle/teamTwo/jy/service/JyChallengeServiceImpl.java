package com.oracle.teamTwo.jy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.jy.dao.JyChallengeDao;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chg_chat;
import com.oracle.teamTwo.teamtwo.model.Chg_photochk;
import com.oracle.teamTwo.teamtwo.model.Chg_review;
import com.oracle.teamTwo.jy.model.CheckMyState;
import com.oracle.teamTwo.jy.model.ChgChatBox;
import com.oracle.teamTwo.jy.model.ChgReviewBox;
import com.oracle.teamTwo.jy.model.JyChg_photochk;
import com.oracle.teamTwo.teamtwo.model.Hashtag2;
import com.oracle.teamTwo.teamtwo.model.Part_challenge;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Service
public class JyChallengeServiceImpl implements JyChallengeService {
	
	@Autowired
	private JyChallengeDao jcd;
	
	@Override
	public int chg_state(int chg_num) {
		int chg_state = jcd.chg_state(chg_num);
		return chg_state;
	}

	@Override
	public Challenge chall(int chg_num) {
		Challenge chall = jcd.chall(chg_num);
		return chall;
	}

	@Override
	public List<Hashtag2> ht2(int chg_num) {
		List<Hashtag2> ht2 = jcd.ht2(chg_num);
		return ht2;
	}

	@Override
	public User_info master(int chg_num) {
		User_info master = jcd.master(chg_num);
		return master;
	}

	@Override
	public int totpart(int chg_num) {
		int totpart = jcd.totpart(chg_num);
		return totpart;
	}

	@Override
	public List<User_info> user(int chg_num) {
		List<User_info> user = jcd.user(chg_num);
		return user;
	}

	@Override
	public int checkMyState(CheckMyState cms) {
		int myChgState = jcd.checkMyState(cms);
		return myChgState;
	}

	@Override
	public int point(String id) {
		int point = jcd.point(id);
		return point;
	}

	@Override
	public List<ChgChatBox> showChat(int chg_num) {
		List<ChgChatBox> chgChatBox = jcd.showChat(chg_num); 
		return chgChatBox;
	}

	@Override
	public int insertChat(Chg_chat chgChat) {
		
		return jcd.insertChat(chgChat);
	}

	@Override
	public int insertPoint(Point point) {
		int result = jcd.insertPoint(point);
		return result;
	}

	@Override
	public int insertPart(Part_challenge part_challenge) {
		int resultPart = jcd.insertPart(part_challenge);
		return resultPart;
	}

	@Override
	public List<ChgReviewBox> showReview(int chg_num) {
		
		return jcd.showReview(chg_num);
	}

	@Override
	public void updateReview(Chg_review chg_review) {
		jcd.updateReview(chg_review);
		
	}

	@Override
	public int cpkResult(Chg_photochk cpk) {
		int cpkResult = jcd.cpkResult(cpk);
		return cpkResult;
	}

	@Override
	public Part_challenge myChgBar(CheckMyState cms) {

		return jcd.myChgBar(cms);
	}

	@Override
	public String todayPhrase() {
		
		return jcd.todayPhrase();
	}

	@Override
	public List<JyChg_photochk> photochk(Map<String, Object> chg_num) {
		List<JyChg_photochk> photochk = jcd.photochk(chg_num);
		return photochk;
	}

	@Override
	public int totPhoto(int chg_num) {
		int totPhoto = jcd.totPhoto(chg_num);
		return totPhoto;
	}

	@Override
	public int updatePhotoConfirm(Chg_photochk cpk) {
		int confirmEnd = jcd.updatePhotoConfirm(cpk);
		return confirmEnd;
	}

	@Override
	public int checkToday(JyChg_photochk jcpk) {
		int todayCnt = jcd.checkToday(jcpk);
		return todayCnt;
	}

	@Override
	public int updateTot(Map<String, Object> updateTotpart) {
		int updateTot = jcd.updateTot(updateTotpart);
		return updateTot;
	}

	@Override
	public int countChat(int chg_num) {
		
		return jcd.countChat(chg_num);
	}

	@Override
	public int countReview(int chg_num) {
		return jcd.countReview(chg_num);
	}

	@Override
	public int countMyReview(int chg_num, String user_id_email) {
		
		return jcd.countMyReview(chg_num, user_id_email);
	}

	@Override
	public int updateConfirm_Cnt(CheckMyState confirm_Cnt) {
		int conf = jcd.updateConfirm_Cnt(confirm_Cnt);
		return conf;
	}





}
