package com.oracle.teamTwo.pys.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.pys.dao.MyPageDao;

@Service
public class MyPage_ServiceImpl implements MyPage_Service {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private MyPageDao myPageDao;
	
	
}
