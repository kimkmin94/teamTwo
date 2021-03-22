package com.oracle.teamTwo.hj.dao;

import java.util.List;

import com.oracle.teamTwo.teamtwo.model.Cmu_reply;
import com.oracle.teamTwo.teamtwo.model.Community;
import com.oracle.teamTwo.teamtwo.model.Point;

public interface HjDao {
	int 				total();
	int 				totalnav(int b_c_num);
	List<Community> 	listAll(Community comm);
	List<Community> 	listnav(Community comm);
	int				 	insertComm(Community comm);
	Community		  	findByB_num(int b_num);
	int 				totalReply(int b_num);
	List<Cmu_reply>		findReplyAll(int b_num);
	int					update(int b_num);
	String				reply_insert(Cmu_reply cmu);
	int					deleteCmu(int b_num);
	int					updateWrite(Community comm);
	String				updateLike(int b_num);
	List<Community>		search(Community comm);
	int 				totalSearch(Community comm);
	String				deleteReply(int re_no);
	String				updateReply(Cmu_reply cmu);
	int					findPoint(String user_id_email);
	int					addPoint(Point point);

}
