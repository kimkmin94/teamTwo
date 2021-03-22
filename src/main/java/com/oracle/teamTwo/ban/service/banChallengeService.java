package com.oracle.teamTwo.ban.service;

import java.util.List;

import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chg_chat_category;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.Oper_challenge;
import com.oracle.teamTwo.teamtwo.model.User_info;

public interface banChallengeService {

	User_info readUserInfo(String user_id_email);

	int registerChal(Challenge challenge);

	int registerChatCate(Chg_chat_category chg_chat_category);

	List<Main_category> readCategory1();

	List<Main_category> readCategory2(int lc_num2);

	List<Main_category> readCategory3(Main_category main_category);

	int findTag(String tag);

	int findTagNum(String tag);

	int addTag(String tag);

	int matchTag(int this_chal_num, int tagnum);

	int registerOperchal(Oper_challenge oper_challenge);

	List<Challenge> getuserChallenge(String user_id_email);






}
