package com.oracle.teamTwo.teamtwo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.teamtwo.dao.ttDao;


@Service
public class ttServiceImpl implements ttService {
	@Autowired
	private ttDao ttd;

	@Override
	public int updateState() {
		
		return ttd.updateState();
	}
}
