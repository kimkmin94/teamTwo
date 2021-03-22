package com.oracle.teamTwo.wj.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.wj.dao.WJDao;
import com.oracle.teamTwo.wj.model.ListPaging;
import com.oracle.teamTwo.wj.model.WJPointUser_info;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Community;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Service
public class WJServiceImpl implements WJService {
    @Autowired
	private WJDao wjDao;

	@Override
	public User_info selectUser(String user_id_email) {
		
		System.out.println("WJServiceImpl selectUser Method Start");
		return wjDao.selectUser(user_id_email);
	}

	@Override
	public List<Challenge> chatbotList(String user_id_email) {
		System.out.println("WJServiceImpl chatbotList Method Start");
		return wjDao.chatbotList(user_id_email);
	}

	@Override
	public List<Challenge> searchTitleList(String mainSearchName) {
		System.out.println("WJServiceImpl searchTitleList Method Start");
		return wjDao.searchTitleList(mainSearchName);
	}

	@Override
	public List<Main_category> selCategoryLc_num(int lc_num) {
		System.out.println("WJServiceImpl selCategoryLc_num Method Start");
		return wjDao.selCategoryLc_num(lc_num);
	}

	@Override
	public List<Main_category> selCategoryMc_num(Main_category category) {
		System.out.println("WJServiceImpl selCategoryMc_num Method Start");
		return wjDao.selCategoryMc_num(category);
	}

	@Override
	public Challenge getChgTimeChk(int chg_num) {
		System.out.println("WJServiceImpl getChgTimeChk Method Start");
		return wjDao.getChgTimeChk(chg_num);
	}

	

	@Override
	public Challenge category_ajax_listCount(Main_category main_category) {
		System.out.println("WJServiceImpl category_ajax_listCount Method Start");
		return wjDao.category_ajax_listCount(main_category);
	}

	@Override
	public List<ListPaging> category_ajax(Map<String, Object> paramMap) {
		System.out.println("WJServiceImpl category_ajax Method Start");
		return wjDao.category_ajax(paramMap);
	}

	@Override
	public ListPaging categorycnt(Map<String, Object> cntParamMap) {
		System.out.println("WJServiceImpl categorycnt Method Start");
		return wjDao.categorycnt(cntParamMap);
	}

	@Override
	public ListPaging searchTitleListCnt(Map<String, Object> count) {
		System.out.println("WJServiceImpl searchTitleListCnt Method Start");
		return wjDao.searchTitleListCnt(count);
	}

	@Override
	public List<ListPaging> searchAjax_maintitle(Map<String, Object> titleParamMap) {
		System.out.println("WJServiceImpl searchAjax_maintitle Method Start");
		return wjDao.searchAjax_maintitle(titleParamMap);
	}

	@Override
	public ListPaging countsearchTitleNew(Map<String, Object> cntParamMap) {
		System.out.println("WJServiceImpl countsearchTitleNew Method Start");
		return wjDao.countsearchTitleNew(cntParamMap);
	}

	@Override
	public List<ListPaging> searchTitle_paging(Map<String, Object> titleparamMap) {
		System.out.println("WJServiceImpl searchTitle_paging Method Start");
		return wjDao.searchTitle_paging(titleparamMap);
	}

	@Override
	public ListPaging searchContentListCnt(Map<String, Object> count) {
		System.out.println("WJServiceImpl searchContentListCnt Method Start");
		return wjDao.searchContentListCnt(count);
	}

	@Override
	public List<ListPaging> searchAjax_maincontent(Map<String, Object> contentParamMap) {
		System.out.println("WJServiceImpl searchAjax_maincontent Method Start");
		return wjDao.searchAjax_maincontent(contentParamMap);
	}

	@Override
	public ListPaging countsearchcontentNew(Map<String, Object> cntParamMap) {
		System.out.println("WJServiceImpl countsearchcontentNew Method Start");
		return wjDao.countsearchcontentNew(cntParamMap);
	}

	@Override
	public List<ListPaging> searchcontent_paging(Map<String, Object> contentparamMap) {
		System.out.println("WJServiceImpl searchcontent_paging Method Start");
		return wjDao.searchcontent_paging(contentparamMap);
	}

	@Override
	public ListPaging searchHashtagListCnt(Map<String, Object> count) {
		System.out.println("WJServiceImpl searchHashtagListCnt Method Start");
		return wjDao.searchHashtagListCnt(count);
	}

	@Override
	public List<ListPaging> searchAjax_mainhashtag(Map<String, Object> hashtagParamMap) {
		System.out.println("WJServiceImpl searchHashtagListCnt Method Start");
		return wjDao.searchAjax_mainhashtag(hashtagParamMap);
	}

	@Override
	public ListPaging countsearchhashtagNew(Map<String, Object> cntParamMap) {
		System.out.println("WJServiceImpl countsearchhashtagNew Method Start");
		return wjDao.countsearchhashtagNew(cntParamMap);
	}

	@Override
	public List<ListPaging> searchhashtag_paging(Map<String, Object> hashtagparamMap) {
		System.out.println("WJServiceImpl searchhashtag_paging Method Start");
		return wjDao.searchhashtag_paging(hashtagparamMap);
	}

	@Override
	public ListPaging searchMasterListCnt(Map<String, Object> count) {
		System.out.println("WJServiceImpl searchMasterListCnt Method Start");
		return wjDao.searchMasterListCnt(count);
	}

	@Override
	public List<ListPaging> searchAjax_mainmaster(Map<String, Object> masterParamMap) {
		System.out.println("WJServiceImpl searchAjax_mainmaster Method Start");
		return wjDao.searchAjax_mainmaster(masterParamMap);
	}

	@Override
	public ListPaging countsearchmasterNew(Map<String, Object> cntParamMap) {
		System.out.println("WJServiceImpl countsearchmasterNew Method Start");
		return wjDao.countsearchmasterNew(cntParamMap);
	}

	@Override
	public List<ListPaging> searchmaster_paging(Map<String, Object> masterparamMap) {
		System.out.println("WJServiceImpl searchmaster_paging Method Start");
		return wjDao.searchmaster_paging(masterparamMap);
	}

	@Override
	public int searchAllCount(String mainSearchName) {
		System.out.println("WJServiceImpl searchAllCount Method Start");
		return wjDao.searchAllCount(mainSearchName);
	}

	@Override
	public int searchHashCount(String mainSearchName) {
		System.out.println("WJServiceImpl searchHashCount Method Start");
		return wjDao.searchHashCount(mainSearchName);
	}

	

	@Override
	public int selectCategory_count_all(Map<String, Object> count_category) {
		System.out.println("WJServiceImpl selectCategory_count_all Method Start");
		return wjDao.selectCategory_count_all(count_category);
	}

	@Override
	public List<WJPointUser_info> pointList() {
		
		return wjDao.pointList();
	}

	@Override
	public List<Community> commList() {
		// TODO Auto-generated method stub
		return wjDao.commList();
	}

	
}
