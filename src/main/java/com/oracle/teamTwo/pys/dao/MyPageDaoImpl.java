package com.oracle.teamTwo.pys.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.teamTwo.pys.model.PagePoint;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Follower;
import com.oracle.teamTwo.teamtwo.model.Following;
import com.oracle.teamTwo.teamtwo.model.Part_challenge;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Repository
public class MyPageDaoImpl implements MyPageDao {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private SqlSession session;

	@Override
	public List<User_info> user(String user_id_email) {
		
		logger.info("user(String user_id_email) start");
		System.out.println("String user_id_email : " + user_id_email);
		
		List<User_info> user = new ArrayList<User_info>();
		
		try {
			user = session.selectList("pysUserList", user_id_email);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		return user;
	}

	@Override
	public String follower(String user_id_email) {

		logger.info("follower(String user_id_email) start");
		System.out.println("String user_id_email : " + user_id_email);
		
		String follower = "0";
		
		try {
			follower = session.selectOne("pysUserfollower", user_id_email);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		return follower;
	}

	@Override
	public String following(String user_id_email) {
		
		logger.info("following(String user_id_email) start");
		System.out.println("String user_id_email : " + user_id_email);
		
		String following = "0";
		
		try {
			following = session.selectOne("pysUserfollowing", user_id_email);
			System.out.println("following : " + following);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		return following;
	}

	@Override
	public String point(String user_id_email) {

		logger.info("point(String user_id_email) start");
		System.out.println("String user_id_email : " + user_id_email);
		
		String point = "0";

		try {
			point = session.selectOne("pysUserpoint", user_id_email);
			System.out.println("point : " + point);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		if (point == null) {
			point = "0";
		}
		
		return point;
	}

	@Override
	public String ch_success(String user_id_email) {
		
		logger.info("ch_success(String user_id_email) start");
		System.out.println("String user_id_email : " + user_id_email);
		
		String ch_success = "0";

		try {
			ch_success = session.selectOne("pysUserch_success", user_id_email);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		if (ch_success == null) {
			ch_success = "0";
		}
		
		System.out.println("ch_success : " + ch_success);
		
		return ch_success;
	}

	@Override
	public String ch_progress(String user_id_email) {
		
		logger.info("ch_progress(String user_id_email) start");
		System.out.println("String user_id_email : " + user_id_email);
		
		String ch_progress = "0";

		try {
			ch_progress = session.selectOne("pysUserch_progress", user_id_email);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		if (ch_progress == null) {
			ch_progress = "0";
		}
		
		System.out.println("ch_progress : " + ch_progress);
		
		return ch_progress;
	}

	@Override
	public String ch_fail(String user_id_email) {
		
		logger.info("ch_fail(String user_id_email) start");
		System.out.println("String user_id_email : " + user_id_email);
		
		String ch_fail = "0";

		try {
			ch_fail = session.selectOne("pysUserch_fail", user_id_email);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		if (ch_fail == null) {
			ch_fail = "0";
		}
		
		System.out.println("ch_fail : " + ch_fail);
		
		return ch_fail;
	}

	@Override
	public List<Challenge> challenges(String user_id_email) {
		
		logger.info("challenges(String user_id_email) start");
		System.out.println("String user_id_email : " + user_id_email);
		
		List<Challenge> challenges = new ArrayList<Challenge>();
		
		try {
			challenges = session.selectList("pysCalendar", user_id_email);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}	
		
		return challenges;
	}
	
	@Override
	public List<Challenge> calendar_master(String user_id_email) {
		
		logger.info("calendar_master(String user_id_email) start");
		System.out.println("String user_id_email : " + user_id_email);
		
		List<Challenge> challenges = new ArrayList<Challenge>();
		
		try {
			challenges = session.selectList("pysCalendar_master", user_id_email);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}	
		
		return challenges;
	}

	@Override
	public void follower_insert(String user_id_email, String user_follower) {
		logger.info("follower_insert(String user_id_email, String user_follower) start");
		System.out.println("String user_id_email : " + user_id_email);
		System.out.println("String user_follower : " + user_follower);
		
		Follower follower = new Follower();
		follower.setUser_follower(user_follower);
		follower.setUser_id_email(user_id_email);
		
		try {
			session.insert("pysFollower_insert", follower);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
	}

	@Override
	public void following_insert(String user_id_email, String user_following) {
		logger.info("follower_insert(String user_id_email, String user_follower) start");
		System.out.println("String user_id_email : " + user_id_email);
		System.out.println("String user_follower : " + user_following);

		Following following = new Following();
		following.setUser_id_email(user_id_email);
		following.setUser_following(user_following);
		
		try {
			session.insert("pysFollowing_insert", following);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
	}

	@Override
	public String follow_Did(String user_id_email, String user_following) {
		logger.info("follow_Did(String user_id_email, String user_follower) start");
		System.out.println("String user_id_email : " + user_id_email);
		System.out.println("String user_following : " + user_following);
		
		Following following = new Following();
		following.setUser_id_email(user_id_email);
		following.setUser_following(user_following);
		
			String follow_Did = "0";
		try {
			follow_Did = session.selectOne("pysfollow_Did", following);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		return follow_Did;
	}

	@Override
	public void follower_del(String user_id_email, String user_follower) {
		logger.info("follower_insert(String user_id_email, String user_follower) start");
		System.out.println("String user_id_email : " + user_id_email);
		System.out.println("String user_follower : " + user_follower);
		
		Follower follower = new Follower();
		follower.setUser_follower(user_follower);
		follower.setUser_id_email(user_id_email);
		
		try {
			session.insert("pysFollower_del", follower);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
	}

	@Override
	public void following_del(String user_id_email, String user_following) {
		logger.info("follower_insert(String user_id_email, String user_follower) start");
		System.out.println("String user_id_email : " + user_id_email);
		System.out.println("String user_follower : " + user_following);

		Following following = new Following();
		following.setUser_id_email(user_id_email);
		following.setUser_following(user_following);
		
		try {
			session.insert("pysFollowing_del", following);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
	}

	@Override
	public List<Follower> follower_list(String page_id_email) {
		logger.info("follower_list(String page_id_email) start");
		System.out.println("String page_id_email : " + page_id_email);
		
		List<Follower> follower_list = new ArrayList<Follower>();
		
		try {
		follower_list = session.selectList("pysfollower_list", page_id_email);
	} catch (Exception e) {
		logger.info("오류 : " + e.getMessage());
	}
		
		return follower_list;
	}

	@Override
	public List<Following> following_list(String page_id_email) {
		logger.info("following_list(String page_id_email) start");
		System.out.println("String page_id_email : " + page_id_email);
		
		List<Following> following_list = new ArrayList<Following>();
		
		try {
		following_list = session.selectList("pysfollowing_list", page_id_email);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		return following_list;
	}

	@Override
	public List<Point> point_list(String page_id_email) {
		logger.info("point_list(String page_id_email) start");
		System.out.println("String page_id_email : " + page_id_email);
		
		List<Point> points = new ArrayList<Point>();
		
		try {
		points = session.selectList("pyspoint_list", page_id_email);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		return points;
	}

	@Override
	public String followings_haeseum(String page_id_email, String user_follower) {
		logger.info("followings_haeseum(String page_id_email, String user_follower) start");
		System.out.println("String page_id_email : " + page_id_email);
		System.out.println("String user_follower : " + user_follower);
		
		Following following = new Following();
		following.setUser_id_email(page_id_email);
		following.setUser_following(user_follower);
		
		String followings_haeseum = null;
		
		try {
		followings_haeseum	= session.selectOne("pysFollowing_haeseum", following);
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
			followings_haeseum = null;
		}
		
		return followings_haeseum;
	}

	@Override
	public List<String> follower_haeseum(String page_id_email) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<User_info> follower_search(String page_id_email, String follower_scroll) {
		
		logger.info("follower_search(String page_id_email, String follower_scroll)");
		System.out.println("String page_id_email : " + page_id_email);
		System.out.println("String follower_scroll : " + follower_scroll);
		
		Follower follower = new Follower();
		follower.setUser_id_email(page_id_email);
		follower.setUser_follower(follower_scroll);
		
		List<User_info> followers = new ArrayList<User_info>();
			
		try {
			followers = session.selectList("follower_search", follower);
			for (int i = 0; i < followers.size(); i++ ) {
				System.out.println(followers.get(i).getUser_id_email());
			}
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		return followers;
		
	}

	@Override
	public List<User_info> following_search(String page_id_email, String following_scroll) {
		
		logger.info("following_search(String page_id_email, String following_scroll)");
		System.out.println("String page_id_email : " + page_id_email);
		System.out.println("String following_scroll : " + following_scroll);
		
		Following following = new Following();
		following.setUser_id_email(page_id_email);
		following.setUser_following(following_scroll);
		
		List<User_info> followings = new ArrayList<User_info>();
			
		try {
			followings = session.selectList("following_search", following);
			for (int i = 0; i < followings.size(); i++ ) {
				System.out.println(followings.get(i).getUser_id_email());
			}
		} catch (Exception e) {
			logger.info("오류 : " + e.getMessage());
		}
		
		return followings;
	}
	

	@Override
	public int total(String user_id_email) {
		int result = 0;
		try {
			result = session.selectOne("dhtotal", user_id_email);
		} catch (Exception e) {
			logger.info("오류 : "+e.getMessage());
		}
		return result;
	}

	@Override
	public List<PagePoint> dhPoint_list(PagePoint pagePoint) {
		List<PagePoint> list = new ArrayList<PagePoint>();
		try {
			list = session.selectList("dhpoint_list", pagePoint);
		} catch (Exception e) {
			logger.info("오류 : "+e.getMessage());
		}
 		return list;
	}

	@Override
	public int myPoint(String user_id_email) {
		int result = 0;
		try {
			result = session.selectOne("dhmypoint", user_id_email);
		} catch (Exception e) {
			logger.info("오류 : "+e.getMessage());
		}
		return result;
	}

	@Override
	public String follow_page_me(String user_id_email, String page_id_email) {
		
		Follower follower = new Follower();
		follower.setUser_id_email(page_id_email);
		follower.setUser_follower(user_id_email);
		
		String follow_page_me = null;
		follow_page_me = session.selectOne("follow_page_me", follower);
		return follow_page_me;
	}

	@Override
	public List<Part_challenge> follwer_challenge(List<Following> follwer_challenge) {
		List<Part_challenge> list = new ArrayList<Part_challenge>();
		try {
		list = session.selectList("follwer_challenge", follwer_challenge);
		
		} catch (Exception e) {
			logger.info("오류 : "+e.getMessage());
		}
		return list;
	}

	@Override
	public List<Part_challenge> follwer_challenge_master(List<Following> follwer_challenge) {
		List<Part_challenge> list = new ArrayList<Part_challenge>();
		try {
		list = session.selectList("follwer_challenge_master", follwer_challenge);
		} catch (Exception e) {
			logger.info("오류 : "+e.getMessage());
		}
		return list;
	}

//	@Override
//	public List<String> follower_haeseum(String page_id_email) {
//		logger.info("follwer_haeseum(String page_id_email, String user_follower) start");
//		System.out.println("String page_id_email : " + page_id_email);
//		
//		
//		return follwer_haeseum;
//	}
}
