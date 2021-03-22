package com.oracle.teamTwo.wj.service;

import java.util.List;
import java.util.Map;

import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Community;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.wj.model.ListPaging;
import com.oracle.teamTwo.wj.model.WJPointUser_info; 

public interface WJService {

	//메인페이지 시작
	User_info selectUser(String user_id_email);

	List<Challenge> chatbotList(String user_id_email);
    //메인페이지 끝
	
   // 카테고리페이지 시작
	List<Main_category> selCategoryLc_num(int lc_num);

	List<Main_category> selCategoryMc_num(Main_category category);

	Challenge getChgTimeChk(int chg_num);

	List<ListPaging> category_ajax(Map<String, Object> paramMap);

	Challenge category_ajax_listCount(Main_category main_category);

	ListPaging categorycnt(Map<String, Object> cntParamMap);
   // 카테고리 페이지 끝
	
   // 검색페이지 시작
	List<Challenge> searchTitleList(String mainSearchName);
	ListPaging searchTitleListCnt(Map<String, Object> count);
   // 검색페이지 끝

	List<ListPaging> searchAjax_maintitle(Map<String, Object> titleParamMap);

	ListPaging countsearchTitleNew(Map<String, Object> cntParamMap);

	List<ListPaging> searchTitle_paging(Map<String, Object> titleparamMap);

	ListPaging searchContentListCnt(Map<String, Object> count);

	List<ListPaging> searchAjax_maincontent(Map<String, Object> contentParamMap);

	ListPaging countsearchcontentNew(Map<String, Object> cntParamMap);

	List<ListPaging> searchcontent_paging(Map<String, Object> contentparamMap);

	ListPaging searchHashtagListCnt(Map<String, Object> count);

	List<ListPaging> searchAjax_mainhashtag(Map<String, Object> hashtagParamMap);

	ListPaging countsearchhashtagNew(Map<String, Object> cntParamMap);

	List<ListPaging> searchhashtag_paging(Map<String, Object> hashtagparamMap);

	ListPaging searchMasterListCnt(Map<String, Object> count);

	List<ListPaging> searchAjax_mainmaster(Map<String, Object> masterParamMap);

	ListPaging countsearchmasterNew(Map<String, Object> cntParamMap);

	List<ListPaging> searchmaster_paging(Map<String, Object> masterparamMap);

	int searchAllCount(String mainSearchName);

	int searchHashCount(String mainSearchName);

	int selectCategory_count_all(Map<String, Object> count_category);

	List<WJPointUser_info> pointList();

	List<Community> commList();
	
}
