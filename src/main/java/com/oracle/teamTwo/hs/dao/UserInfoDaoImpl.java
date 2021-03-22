package com.oracle.teamTwo.hs.dao;

import java.util.List;  

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Community;

@Service
public class UserInfoDaoImpl implements UserInfoDao {
	
	@Autowired
	private SqlSession session;


	@Override
	public List<User_info> listUser(User_info user) {
		List<User_info> listUser = null;
		try {
			listUser = session.selectList("hslistAll",user);
			
		} catch (Exception e) {
			System.out.println("DaoImpl listUser 오류 : "+e.getMessage());
		}
		System.out.println("DaoImpl listUser listUser.size() : "+listUser.size());
		return listUser;
	}


	@Override
	public List<Community> listCm(Community com) {
		List<Community> listCm = null;
		try {
			listCm = session.selectList("hslistCm", com);
		} catch (Exception e) {
			System.out.println("유저인포 커뮤니티 dao 오류 : "+e.getMessage());
		}
		return listCm;
	}


	@Override
	public Community detail(int b_num) {
		Community com = new Community();
		try {
			com = session.selectOne("hsUpdateCm", b_num);
		} catch (Exception e) {
			System.out.println("dao 커뮤니티 디테일 오류 : "+e.getMessage());
		}
		return com;
	}


	@Override
	public User_info stop(String user_id_email) {
		User_info user = new User_info();
		try {
			user = session.selectOne("hsStopUs", user_id_email);
		} catch (Exception e) {
			System.out.println("유저 계정중지DAO 오류 : "+e.getMessage());
		}
		return user;
	}


	@Override
	public User_info run(String user_id_email) {
		User_info user = new User_info();
		try {
			user = session.selectOne("hsRunUs", user_id_email);
		} catch (Exception e) {
			System.out.println("유저 활성화DAO 오류 : "+e.getMessage());
		}
		return user;
	}


	@Override
	public List<Challenge> listCh(Challenge ch) {
		List<Challenge> listCh = null;
		try {
			listCh = session.selectList("hslistCh", ch);
		} catch (Exception e) {
			System.out.println("챌린지 리스트 DAO 오류 : "+e.getMessage());
		}
		return listCh;
	}


	@Override
	public Challenge delete(int chg_num) {
		Challenge ch = new Challenge();
		try {
			ch = session.selectOne("hsDeleteCh", chg_num);
		} catch (Exception e) {
			System.out.println("챌린지 삭제버튼 오류 : "+e.getMessage());
		}
		return ch;
	}
	


}
