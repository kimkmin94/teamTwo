package com.oracle.teamTwo.hj.dao;

import java.util.List; 

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.teamTwo.teamtwo.model.Cmu_reply;
import com.oracle.teamTwo.teamtwo.model.Community;
import com.oracle.teamTwo.teamtwo.model.Point;

@Repository
public class HjDaoImpl implements HjDao {
	@Autowired
	private SqlSession session;

	@Override
	public int total() {
		//전체 게시물 개수 가져오기
		int total = session.selectOne("hjtotal");
		return total;
	}

	@Override
	public List<Community> listAll(Community comm) {
		//게시물 다 가져오기
		List<Community> comList = null;
		try {
			
			comList=session.selectList("hjlistAll",comm);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl listAll() Error!!!"+e.getMessage());
		}
		return comList;
	}
	
	@Override
	public int totalnav(int b_c_num) {
		//카테고리 별 게시물 개수 가져오기
		int total = session.selectOne("hjtotalnav",b_c_num);
		return total;
	
	}

	@Override
	public List<Community> listnav(Community comm) {
		//카테고리 별  게시물 다 가져오기
		List<Community> comList = null;
		try {
			
			comList=session.selectList("hjlistnav",comm);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl listAll() Error!!!"+e.getMessage());
		}
		return comList;
	
	}


	@Override
	public int insertComm(Community comm) {
		//작성한 게시물 정보 DB에 넣기
		int result_insert_write = 0;
		try {
			result_insert_write=session.insert("hjInsert",comm);
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl insertComm() Error!!!"+e.getMessage());
		}
		return result_insert_write;
	}

	@Override
	public Community findByB_num(int b_num) {
		//게시물 정보 찾기
		Community Com = null;
		try {
			Com = session.selectOne("hjCom", b_num);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl findByB_num() error !!!"+e.getMessage());
		}
		return Com;
	}

	@Override
	public int totalReply(int b_num) {
		//댓글 개수 구하기
		int result = 0;
		try {
			result = session.selectOne("hjtotalReply", b_num);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl totalReply() error !!!"+e.getMessage());
		}
		return result;
	}

	@Override
	public List<Cmu_reply> findReplyAll(int b_num) {
		//댓글 정보 가져오기
		List<Cmu_reply> listRe = null;
		try {
			listRe = session.selectList("hjfindRe", b_num);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl findReplyAll() Error!!!"+e.getMessage());
		}
		return listRe;
	}

	@Override
	public int update(int b_num) {
		//게시글 클릭시 조회수 +1
		int update = 0;
		try {
			update = session.update("hjupdateDetail", b_num);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl update() Error!!!"+e.getMessage());
		}
		return update;
	}

	@Override
	public String reply_insert(Cmu_reply cmu) {
		//아작스로 댓글 등록
		int result = 0;
		String success1 = null;
		try {
			result =session.insert("hjreply_insert", cmu);
			if(result == 1) {
				success1="good";
			}else {
				success1="bad";
			}
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl reply_insert() Erorr!!!"+e.getMessage());

		}
		return success1;
	}
	@Override
	public int deleteCmu(int b_num) {
		//게시글 상태 바꾸기
		int result = 0;
		
		try {
			int result1 = session.update("hjdeleteCmu", b_num);
			int result2 = session.update("hjdeleteRep", b_num);
			result = result1+result2;
		
		}catch (Exception e) {
			
			System.out.println("===>HjDaoImpl deleteCmu() error"+e.getMessage());
		
			System.out.println();
		}
		return result;
	}

	@Override
	public int updateWrite(Community comm) {
		//게시글 수정시 update
		int result = 0;
		try {
			result = session.update("hjupdateWrite", comm);
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl updateWrite() error"+ e.getMessage());
		}
		return result;
	}

	@Override
	public String updateLike(int b_num) {
		String result = null;
		try {
			int updateLike = session.update("hjUpdateLike", b_num);
			if(updateLike == 1) {
				//업데이트 성공 ,b_like_count 값 가져와서 객체에 넣기
				result = session.selectOne("hjSelectLike", b_num);
			}
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl updateLike() Error"+e.getMessage());
		}
		return result;
	}

	@Override
	public List<Community> search(Community comm) {
		List<Community> list = null;
		try {
			list = session.selectList("hjSearch", comm);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl search() Error"+e.getMessage());
		}
		return list;
	}

	@Override
	public int totalSearch(Community comm) {
		//게시판 검색
		int total = 0;
		try {
			total = session.selectOne("hjTotalSearch", comm);
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl totalSearch() Error"+e.getMessage());
		}
		return total;
	}

	@Override
	public String deleteReply(int re_no) {
		//댓글 삭제시 댓글 상태 변화
		String result = null;
		try {
			int res = session.update("hjdeleteReply", re_no);
			if(res == 1) {
				result = "good";
			}else {
				result = "bad";
			}
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl delete() Error : "+e.getMessage());
		}
		
		return result;
	}

	@Override
	public String updateReply(Cmu_reply cmu) {
		// 댓글 수정 아작스
		String result = null;
		try {
			int res = session.update("hjupdateReply", cmu);
			if(res == 1) {
				result = "good";
			}else {
				result = "bad";
			}
			
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl updateReply()  Error :"+e.getMessage());
		}
		return result;
	}

	@Override
	public int findPoint(String user_id_email) {
		//가장 최근 포인트 가져오기
		int recent_point =0;
		try {
			recent_point = session.selectOne("hjFindPoint",user_id_email);
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl findPoint() Error"+e.getMessage());
		}
		return recent_point;
	}

	@Override
	public int addPoint(Point point) {
		// 댓글 달 때 마다 열매5개씩 주기
		int add_Point = 0;
		try {
			
			add_Point = session.insert("hjAddPoint", point);
		}catch (Exception e) {
			System.out.println("===>HjDaoImpl addPoint() Error"+e.getMessage());
		}
	
		return add_Point;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
