package com.oracle.teamTwo.hj.service;

import java.util.List; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.hj.dao.HjDao;
import com.oracle.teamTwo.teamtwo.model.Cmu_reply;
import com.oracle.teamTwo.teamtwo.model.Community;
import com.oracle.teamTwo.teamtwo.model.Point;

@Service
public class HjServiceImpl implements HjService {
	@Autowired
	private HjDao dao;

	@Override
	public int total() {
		int total = dao.total();
		return total;
	}

	@Override
	public List<Community> listAll(Community comm) {
		List<Community> commList = dao.listAll(comm);
		return commList;
	}

	@Override
	public int insertComm(Community comm) {
		int result_insert_write = dao.insertComm(comm);
		return result_insert_write;
	}

	@Override
	public Community findByB_num(int b_num) {
		Community Com = dao.findByB_num(b_num);
		return Com;
	}

	@Override
	public int totalReply(int b_num) {
		int replyTotal = dao.totalReply(b_num);
		return replyTotal;
	}

	@Override
	public List<Cmu_reply> findReplyAll(int b_num) {
		List<Cmu_reply> replyList = dao.findReplyAll(b_num);
		return replyList;
	}

	@Override
	public int update(int b_num) {
		int update = dao.update(b_num);
		return update;
	}

	@Override
	public String reply_insert(Cmu_reply cmu) {
		String success = dao.reply_insert(cmu);
		return success;
	}

	@Override
	public int deleteCmu(int b_num) {
		int result = dao.deleteCmu(b_num);
		return result;
	}

	@Override
	public int updateWrite(Community comm) {
		int result = dao.updateWrite(comm);
		return result;
	}

	@Override
	public String updateLike(int b_num) {
		String result = dao.updateLike(b_num);
		return result;
	}

	@Override
	public List<Community> search(Community comm) {
		List<Community> list = dao.search(comm);
		return list;
	}

	@Override
	public int totalSearch(Community comm) {
		int total = dao.totalSearch(comm);
		return total;
	}

	@Override
	public int totalnav(int b_c_num) {
		int total = dao.totalnav(b_c_num);
		return total;
	}

	@Override
	public List<Community> listnav(Community comm) {
		List<Community> commList = dao.listnav(comm);
		return commList;
		
	}

	@Override
	public String deleteReply(int re_no) {
		String result = dao.deleteReply(re_no);
		return result;
	}

	@Override
	public String updateReply(Cmu_reply cmu) {
		String result = dao.updateReply(cmu);
		return result;
	}

	@Override
	public int findPoint(String user_id_email) {
		int recent_point = dao.findPoint(user_id_email);
		return recent_point;
	}

	@Override
	public int addPoint(Point point) {
		int add_point = dao.addPoint(point);
		return add_point;
	}



}
