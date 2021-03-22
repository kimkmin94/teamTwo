package com.oracle.teamTwo.dh.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.teamTwo.dh.model.Inter;
import com.oracle.teamTwo.dh.model.ThisPoint;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chat_category;
import com.oracle.teamTwo.teamtwo.model.Interest_category;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Repository
public class dhUserDaoImpl implements dhUserDao {

   @Autowired
   SqlSession session;
   
   @Override
   public int login(String user_id_email, String user_password) {
      int login = 0;
      try {
         User_info user_Info = session.selectOne("dhLogin",user_id_email);
         if(user_Info.getUser_password().equals(user_password)) {
            System.out.println("로그인 성공");
            login = 1;
         }else {
            System.out.println("로그인 실패");
            login = 0;
         }
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl login Exception->"+e.getMessage());
      }
      return login;
   }

   @Override
   public int idCheck(String user_id_email) {
      int idCheck = 0;
      try {
         idCheck = session.selectOne("dhidCheck", user_id_email);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl idCheck Exception->"+e.getMessage());
      }
      return idCheck;
   }

   @Override
   public int nicCheck(String user_nickname) {
      int nicCheck = 0;
      try {
         nicCheck = session.selectOne("dhnicCheck", user_nickname);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl nicCheck Exception->"+e.getMessage());
      }
      return nicCheck;
   }

   @Override
   public int join(User_info user_info) {
      int join = 0;
      try {
         join = session.insert("dhjoin", user_info);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl join Exception->"+e.getMessage());
      }
      return join;
   }
   
   @Override
   public int point(String user_id_email) {
      int inPoint = 0;
      try {
      inPoint = session.insert("dhinPoint",user_id_email);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl point Exception->"+e.getMessage());
      }
            
      return inPoint;
   }


   @Override
   public String findId(User_info user_info) {
      String findId = null;
      try {
         findId = session.selectOne("dhfindId", user_info);
         System.out.println("findId->"+findId);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl findId Exception->"+e.getMessage());
      }
      return findId;
   }

   @Override
   public int findPw(User_info user_info) {
      int count = 0;
      try {
         count = session.selectOne("dhfindPw", user_info);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl findPW Exception->"+e.getMessage());
      }
      return count;
   }

   @Override
   public void chPw(User_info user_info) {
      try {
         session.update("dhchPw", user_info);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl chPw Exception->"+e.getMessage());
      }
      
   }

   @Override
   public int interest(Interest_category category) {
      int result = 0;
      try {
         result = session.insert("dhinterst", category);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl interest Exception->"+e.getMessage());
      }
      return result;
   }

   @Override
   public List<Chat_category> chatList() {
      List<Chat_category> list = null;
      try {
         list = session.selectList("dhchatList");
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl chatList Exception->"+e.getMessage());
      }
      return list;
   }

   @Override
   public String subject(Interest_category category) {
      String data = null;
      try {
         data = session.selectOne("dhsubject", category);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl subject Exception->"+e.getMessage());
      }
      return data;
   }

   @Override
   public User_info myInfo(String user_id_email) {
      User_info user_info = null;
      try {
         user_info = session.selectOne("dhLogin", user_id_email);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl myInfo Exception->"+e.getMessage());
      }
      return user_info;
   }


   @Override
   public List<Challenge> uchatList3(String user_id_email) {
      System.out.println("dhUserDaoImpl uchatList3 gogo");
      List<Challenge> list = null;
      try {
         list = session.selectList("dhuchatList3", user_id_email);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl uchatList3 Exception->"+e.getMessage());
      }
      return list;
   }

   @Override
   public int updateInfo(User_info user_info) {
      int update = 0;
      try {
         update = session.update("dhupdateInfo", user_info);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl updateInfo Exception->"+e.getMessage());
      }
      return update;
   }

   @Override
   public String pwChk(String user_id_email) {
      String password = null;
      try {
         password = session.selectOne("dhpwChk", user_id_email);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl pwChk Exception->"+e.getMessage());
      }
      return password;
   }

   @Override
   public int myUser_update(User_info user_info) {
      int update = 0;
      try {
         update = session.update("dhmyUser_update", user_info);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl myUser_update Exception->"+e.getMessage());
      }
      return update;
   }

   @Override
   public int inter_update1(Inter inter) {
      System.out.println("inter.getA_cnum1->"+inter.getA_cnum1());
      int inter1 = 0;
      try {
         inter1 = session.update("dhinter_update1", inter);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl inter_update1 Exception->"+e.getMessage());
      }
      return inter1;
   }

   @Override
   public int inter_update2(Inter inter) {
      System.out.println("inter.getA_cnum2->"+inter.getA_cnum2());
      int inter2 = 0;
      try {
         inter2 = session.update("dhinter_update2", inter);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl inter_update2 Exception->"+e.getMessage());
      } 
      return inter2;
   }

   @Override
   public int inter_update3(Inter inter) {
      System.out.println("inter.getA_cnum3->"+inter.getA_cnum3());
      int inter3 = 0;
      try {
         inter3= session.update("dhinter_update3", inter);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl inter_update3 Exception->"+e.getMessage());
      }
      return inter3;
   }

   @Override
   public String chkLogTime(String user_id_email) {
      String date = null;
      try {
         date = session.selectOne("dhlogTime", user_id_email);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl chkLogTime Exception->"+e.getMessage());
      }
      return date;
   }

   @Override
   public int dateCha(String date) {
      int dateCha = 0;
      try {
         dateCha = session.selectOne("dhdateCha", date);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl dateCha Exception->"+e.getMessage());
      }
      return dateCha;
   }

   @Override
   public int thisPoint(String user_id_email) {
      int balance_point = 0;
      try {
         balance_point = session.selectOne("dhthisPoint", user_id_email);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl thisPoint Exception->"+e.getMessage());
      }
      return balance_point;
   }

   @Override
   public int loginPoint(ThisPoint thisPoint) {
      int insert = 0;
      try {
         insert = session.insert("dhloginPoint", thisPoint);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl loginPoint Exception->"+e.getMessage());
      }
      return insert;
   }

   @Override
   public int state(String user_id_email) {
      int user_state = 0;
      try {
         user_state = session.selectOne("dhstate", user_id_email);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl status Exception->"+e.getMessage());
      }
      return user_state;
   }

   @Override
   public int nickCheckInfo(String user_id_email, String user_nickname) {
      int result = 0;
      try {
         User_info user_info = new User_info();
         user_info.setUser_id_email(user_id_email);
         user_info.setUser_nickname(user_nickname);
         result = session.selectOne("dhnickCheckInfo", user_info);
      } catch (Exception e) {
         System.out.println("dhUserDaoImpl nickCheckInfo Exception->"+e.getMessage());
      }
      return result;
   }

	@Override
	public User_info user(String user_id_email) {
		
		 User_info user_model = new User_info();
		 
		 try {
	     user_model = session.selectOne("teamtwo_user_model" ,user_id_email);
		 } catch (Exception e) {
			System.out.println(e.getMessage());
		}
	     
		return user_model;
	}
	
	@Override
	public int interNum1(String user_id_email) {
		int result = 0;
		try {
			result = session.selectOne("dhinterNum1", user_id_email);
		} catch (Exception e) {
			System.out.println("dhUserDaoImpl interNum1 Exception->"+e.getMessage());
		}
		return result;
	}
	
	@Override
	public int interNum2(String user_id_email) {
		int result = 0;
		try {
			result = session.selectOne("dhinterNum2", user_id_email);
		} catch (Exception e) {
			System.out.println("dhUserDaoImpl interNum2 Exception->"+e.getMessage());
		}
		return result;
	}
	
	@Override
	public int interNum3(String user_id_email) {
		int result = 0;
		try {
			result = session.selectOne("dhinterNum3", user_id_email);
		} catch (Exception e) {
			System.out.println("dhUserDaoImpl interNum3 Exception->"+e.getMessage());
		}
		return result;
	}

}