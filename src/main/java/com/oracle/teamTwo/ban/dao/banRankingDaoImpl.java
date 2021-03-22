package com.oracle.teamTwo.ban.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.teamTwo.ban.model.byPointUserinfo;

@Repository
public class banRankingDaoImpl implements banRankingDao {

	@Autowired
	private SqlSession session;

	@Override
	public List<byPointUserinfo> getPointUser() {
		List<byPointUserinfo> list_PointUser = null;
		
		try {
			System.out.println("Banya : banRankingDaoImpl > getPointUser()");
			list_PointUser = session.selectList("byPointUser");
			
		} catch (Exception e) {
			System.out.println("Banya : banRankingDaoImpl > getPointUser() error");
			System.out.println(e.getMessage());
		}
		
		return list_PointUser;
	}
}
