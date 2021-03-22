package com.oracle.teamTwo.jy.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
import com.oracle.teamTwo.teamtwo.model.Random_phrase;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Repository
public class JyChallengeDaoImpl implements JyChallengeDao {
	
	@Autowired //Mybatis를 연결해주는 세션
	private SqlSession session;


	@Override
	public int chg_state(int chg_num) {
		int chg_state = session.selectOne("jychg_state", chg_num);
		return chg_state;
	}

	@Override
	public Challenge chall(int chg_num) {
		Challenge chall = null;
		
		try {
			chall = session.selectOne("jychall", chg_num);
		} catch (Exception e) {
			System.out.println("Jiye : 챌린지 상세정보 가져오기 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		return chall;
	}

	@Override
	public List<Hashtag2> ht2(int chg_num) {
		List<Hashtag2> ht2 = null;
		
		try {
			ht2 = session.selectList("jyht2", chg_num);
		} catch (Exception e) {
			System.out.println("Jiye : 해시태그 가져오기 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		return ht2;
	}

	@Override
	public User_info master(int chg_num) {
		User_info master = null;
		
		try {
			master = session.selectOne("jymaster", chg_num);
		} catch (Exception e) {
			System.out.println("Jiye : 마스터 정보가져오기 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		return master;
	}

	@Override
	public int totpart(int chg_num) {
		int totpart = 0;
		
		try {
			totpart = session.selectOne("jytotpart", chg_num);
		} catch (Exception e) {
			System.out.println("Jiye : 현재 참여인원 수/마스터제외 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		return totpart;
	}

	@Override
	public List<User_info> user(int chg_num) {
		List<User_info> user = null;
		
		try {
			user = session.selectList("jyuser", chg_num);
		} catch (Exception e) {
			System.out.println("Jiye : 현재 참여인원 정보 가져오기 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		return user;
	}

	@Override
	public int checkMyState(CheckMyState cms) {
		int checkMyState = 0;
		
		try {
			checkMyState = session.selectOne("jyCheckState",cms);
		} catch (Exception e) {
			System.out.println("Jiye : 해당 챌린지 참여여부 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		return checkMyState;
	}


	@Override
	public int point(String id) {
		int point = 0;
		
		try {
			point = session.selectOne("jyPoint", id);
			
		} catch (Exception e) {
			System.out.println("Jiye : 현재 보유보인트 가져오기 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		return point;
	}

	@Override
	public List<ChgChatBox> showChat(int chg_num) {
		List<ChgChatBox> chgChatBox = null;
	      try {
	         //                           mapper ID   ,   Parameter
	         chgChatBox = session.selectList("kmchgChatShow", chg_num);
	         System.out.println("KyoungMin : JyChallengeDaoImpl showChat");
	         System.out.println("KyoungMin : JyChallengeDaoImpl challChatBoxSize-->"+chgChatBox.size());
	      } catch (Exception e) {
	         System.out.println("KyoungMin : JyChallengeDaoImpl showChat e.getMessage()"+e.getMessage());
	      }
	      
	      return chgChatBox;
	}

	@Override
	public int insertChat(Chg_chat chgChat) {
		int chk = 0;
		try {
			chk = session.insert("kmchgChatInsert",chgChat);
		}catch(Exception e) {
			System.out.println("KyoungMin : JyChallengeDaoImpl insertChat e.getMessage()"+e.getMessage());
		}
		return chk;
	}

	@Override
	public int insertPoint(Point point) {
		 int resultPoint = 0;
		 
		 try {
			 resultPoint = session.insert("jyinsertPoint", point);
		} catch (Exception e) {
			System.out.println("Jiye : 배팅포인트 인서트 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		return resultPoint;
	}

	@Override
	public int insertPart(Part_challenge part_challenge) {
		int resultPart = 0;
		
		try {
			resultPart = session.insert("jyinsertPart", part_challenge);  
		} catch (Exception e) {
			System.out.println("Jiye : PartChall 테이블에 참가자 인서트 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		return resultPart;
	}

	@Override
	public List<ChgReviewBox> showReview(int chg_num) {
		List<ChgReviewBox> chgReviewBox = null;
		try {
			chgReviewBox = session.selectList("kmchgReviewShow", chg_num);
		} catch (Exception e) {
			System.out.println("KyoungMin : DAO showReview error" + e.getMessage());
		}

		return chgReviewBox;
	}

	@Override
	   public void updateReview(Chg_review chg_review) {

	    session.insert("kmReviewUpdate", chg_review);
	      
	   }

	@Override
	public int cpkResult(Chg_photochk cpk) {
		int cpkResult = 0;
		
		try {
			cpkResult = session.insert("jyChg_photochk", cpk);
			
		} catch (Exception e) {
			System.out.println("Jiye : 인증사진 인서트 JyChallengeDaoImpl ERROR-->"+e.getMessage());
		}
		
		return cpkResult;
	}
	
	 @Override
	   public Part_challenge myChgBar(CheckMyState cms) {
	      Part_challenge pc = null;
	      int chkBar = 0;
	      try {
	         chkBar = session.selectOne("kmChkBar",cms);
	         if(chkBar != 0) {
	            pc = session.selectOne("kmMyChgBar",cms);
	         }
	         
	      } catch (Exception e) {
	         System.out.println("KyoungMin : DAO myChgBar error" + e.getMessage());
	      }
	      
	      return pc;
	      }

		@Override
		public String todayPhrase() {
			int num = 0;
			int chkPhrase = 0;
			int maxNum = 0;
			Date today = null;
			Random_phrase rp = new Random_phrase();
			String today_phrase = null;
			/* 현재 날짜 sql.date로 형변환 */
			LocalDate todayTest = LocalDate.now();
			Date realToday = Date.valueOf(todayTest);

			try {
				rp = session.selectOne("kmSelectTodayRecord");
				today = rp.getToday_record();
				/* sql.date 를 String 을 변환해서 비교 */
				SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
				String realToday1 = fmt.format(realToday);
				String today1 = fmt.format(today);

				if (realToday1.equals(today1)) {
					today_phrase = session.selectOne("kmSelectPhrase", num);

				} else {
					maxNum = session.selectOne("kmSelectMaxNum");
					num = session.selectOne("kmRandomNum", maxNum);
					today_phrase = session.selectOne("kmSelectPhrase", num);
					chkPhrase = session.update("kmUpdatePhrase", today_phrase);
				}

			} catch (Exception e) {
				System.out.println("KyoungMin : DAO todayPhrase error" + e.getMessage());
			}
			return today_phrase;
		}

		@Override
		public List<JyChg_photochk> photochk(Map<String, Object> chg_num) {
			List<JyChg_photochk> photochk = null;
			try {
				photochk = session.selectList("jyPhoto_Chk",chg_num);
			} catch (Exception e) {
				System.out.println("Jiye : 인증사진리스트 e.getMessage()-->" + e.getMessage());
			}
			return photochk;
		}

		@Override
		public int totPhoto(int chg_num) {
			int totPhoto = 0;
			try {
				totPhoto = session.selectOne("jytotPhoto", chg_num);
			} catch (Exception e) {
				System.out.println("Jiye : 인증사진 총 게시물 수 JyChallengeDaoImpl ERROR-->" + e.getMessage());
			}
			return totPhoto;
		}

		@Override
		public int updatePhotoConfirm(Chg_photochk cpk) {
			int updatePhotoConfirm = 0;
			try {
				updatePhotoConfirm = session.update("jyPhotoConfirm", cpk);
			} catch (Exception e) {
				System.out.println("Jiye : 인증사진컨펌 업데이트 JyChallengeDaoImpl ERROR-->" + e.getMessage());
			}
			return updatePhotoConfirm;
		}

		@Override
		public int checkToday(JyChg_photochk jcpk) {
			int checkToday =0;
			try {
				checkToday = session.selectOne("jyTodayCnt", jcpk);
			} catch (Exception e) {
				System.out.println("Jiye : 오늘 인증카운트 수 JyChallengeDaoImpl ERROR-->" + e.getMessage());
			}
			return checkToday;
		}


		@Override
		public int updateTot(Map<String, Object> updateTotpart) {
			int updateTot = 0;
			try {
				updateTot = session.update("jyInsertTot", updateTotpart);
			} catch (Exception e) {
				System.out.println("Jiye : 현재참여인원 수 업데이트 JyChallengeDaoImpl ERROR-->" + e.getMessage());
			}
			return updateTot;
		}

		@Override
		public int countChat(int chg_num) {
			int countChat = 0;
			try {
				countChat = session.selectOne("kmCountChat", chg_num);
			} catch (Exception e) {
				System.out.println("KyoungMin : 소통하기 갯수 에러 메세지==>"+e.getMessage());
			}
			return countChat;
		}

		@Override
		public int countReview(int chg_num) {
			int countReview = 0;
			try {
				countReview = session.selectOne("kmCountReview", chg_num);
			} catch (Exception e) {
				System.out.println("KyoungMin : 후기 갯수 에러 메세지==>"+e.getMessage());
			}
			return countReview;
		}

		@Override
		public int countMyReview(int chg_num, String user_id_email) {
			int countMyReview = 0;
			Map<String, Object> chgReviewMap = new HashMap<String, Object>();
			chgReviewMap.put("chg_num", chg_num);
			chgReviewMap.put("user_id_email", user_id_email);
			try {
				countMyReview = session.selectOne("kmCountMyReview",chgReviewMap);
			} catch (Exception e) {
				System.out.println("KyoungMin : 후기 갯수 에러 메세지==>"+e.getMessage());
			}
			return countMyReview;
		}

		@Override
		public int updateConfirm_Cnt(CheckMyState confirm_Cnt) {
			int updateSuccess = 0;
			try {
				updateSuccess = session.update("jyConfirm_Count", confirm_Cnt);
			} catch (Exception e) {
				System.out.println("Jiye : 인증사진 승인 카운트 업데이트 JyChallengeDaoImpl ERROR-->" + e.getMessage());
			}
			return updateSuccess;
		}


}
