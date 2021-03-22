package com.oracle.teamTwo.pys.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPage_DaoImpl implements MyPage_Dao {

	@Autowired
	private SqlSession session;
}
