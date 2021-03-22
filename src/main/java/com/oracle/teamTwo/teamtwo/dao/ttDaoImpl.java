package com.oracle.teamTwo.teamtwo.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ttDaoImpl implements ttDao {
	@Autowired // Mybatis를 연결해주는 세션
	private SqlSession session;

	@Override
	public int updateState() {
		int updateState = 0;
		int updateState2 = 0;
		int updateState3 = 0;
		int updateState4 = 0;
		int updateState5 = 0;

		try {
			updateState2 = session.update("ttUpdateState2");
			updateState3 = session.update("ttUpdateState3");
			updateState4 = session.update("ttUpdateState4");
			updateState5 = session.update("ttUpdateState5");
			updateState = updateState2+updateState3+updateState4+updateState5;
			System.out.println("Jiye : 모집상태 변경현황 ttDaoImpl..."+"two("+updateState2+") three-->("+updateState3+") four-->("+updateState4+") five-->("+updateState5+")");
		} catch (Exception e) {
			System.out.println("Jiye : 모집상태 변경현황 ttDaoImpl ERROR-->" + e.getMessage());
		}
		return updateState;
	}

}
