package com.oracle.teamTwo.ban.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.ban.dao.banRankingDao;
import com.oracle.teamTwo.ban.model.byPointUserinfo;

@Service
public class banRankingServiceImpl implements banRankingService {

	@Autowired
	private banRankingDao brd;

	@Override
	public List<byPointUserinfo> getPointUser() {
		System.out.println("Banya : byRankingServiceImpl > getPointUser() start");
		List<byPointUserinfo> list_PointUser = brd.getPointUser();
		return list_PointUser;
	}
	
}
