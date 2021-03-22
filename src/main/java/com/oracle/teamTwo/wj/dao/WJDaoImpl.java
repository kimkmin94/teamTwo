package com.oracle.teamTwo.wj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Community;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.wj.model.ListPaging;
import com.oracle.teamTwo.wj.model.WJPointUser_info;

@Repository
public class WJDaoImpl implements WJDao {
    @Autowired
	private SqlSession session;

	@Override
	public User_info selectUser(String user_id_email) {
		
		
		
		return session.selectOne("wjSelectUser", user_id_email);
	}

	@Override
	public List<Challenge> chatbotList(String user_id_email) {
          List<Challenge> chatbotList = null;
		
		try {
			 chatbotList = session.selectList("ChatbotList", user_id_email); 
		}catch(Exception e) {
			System.out.println("WJDaoImpl chatbotList Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return chatbotList;
	}

	@Override
	public List<Challenge> searchTitleList(String mainSearchName) {
		 List<Challenge> searchTitleList = null;
		try {
			 searchTitleList = session.selectList("SearchTitleList", mainSearchName); 
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchTitleList Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return searchTitleList;
	}

	@Override
	public List<Main_category> selCategoryLc_num(int lc_num) {
		List<Main_category> selCategoryLc_num = null;
		try {
			 selCategoryLc_num = session.selectList("selCategory_Lc_num", lc_num);
		}catch(Exception e) {
			System.out.println("WJDaoImpl selCategoryLc_num Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return selCategoryLc_num;
	}

	@Override
	public List<Main_category> selCategoryMc_num(Main_category category) {
		List<Main_category> selCategoryMc_num = null;
		try {
			 selCategoryMc_num = session.selectList("selCategory_Mc_num", category);
		}catch(Exception e) {
			System.out.println("WJDaoImpl selCategoryLc_num Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return selCategoryMc_num;
	}

	@Override
	public Challenge getChgTimeChk(int chg_num) {
		
		Challenge getChgTimeChk = null;
		
		try {
			 getChgTimeChk = session.selectOne("Chg_numTimeChk", chg_num);
		}catch(Exception e) {
			System.out.println("WJDaoImpl getChgTimeChk Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return getChgTimeChk;
	}

	@Override
	public List<ListPaging> category_ajax(Map<String, Object> paramMap) {
		
		List<ListPaging> category_ajax = null;		
		try {
			 category_ajax = session.selectList("category_ajax_List", paramMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl category_ajax Method Error => " + e.getMessage());
			e.printStackTrace();
		}		
		
		return category_ajax;
	}

	@Override
	public Challenge category_ajax_listCount(Main_category main_category) {
		
		Challenge challenge = null;
		try {
			 challenge = session.selectOne("category_ajax_listCount", main_category);
		}catch(Exception e) {
			System.out.println("WJDaoImpl category_ajax_listCount Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return challenge;
	}

	@Override
	public ListPaging categorycnt(Map<String, Object> cntParamMap) {
		
		ListPaging listPaging = null;
		
		try {
			 listPaging = session.selectOne("selectcategorycnt", cntParamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl categorycnt Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return listPaging;
	}

	@Override
	public ListPaging searchTitleListCnt(Map<String, Object> count) {
		
		ListPaging listPaging = null;
		
		try {
			 listPaging = session.selectOne("searchTitleListCnt", count);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchTitleListCnt Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return listPaging;
	}

	@Override
	public List<ListPaging> searchAjax_maintitle(Map<String, Object> titleParamMap) {
		List<ListPaging> searchAjax_maintitle = null;
		try {
			 searchAjax_maintitle = session.selectList("searchAjax_maintitle", titleParamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchAjax_maintitle Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return searchAjax_maintitle;
	}

	@Override
	public ListPaging countsearchTitleNew(Map<String, Object> cntParamMap) {
		ListPaging listPaging = null;
		try {
			 listPaging = session.selectOne("countsearchTitleNew", cntParamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl countsearchTitleNew Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return listPaging;
	}

	@Override
	public List<ListPaging> searchTitle_paging(Map<String, Object> titleparamMap) {
		List<ListPaging> searchTitle_paging = null;
		try {
			searchTitle_paging = session.selectList("searchAjax_maintitle", titleparamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchTitle_paging Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return searchTitle_paging;
	}

	@Override
	public ListPaging searchContentListCnt(Map<String, Object> count) {
		ListPaging listPaging = null;
		try {
			 listPaging = session.selectOne("searchContentListCnt", count);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchContentListCnt Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return listPaging;
	}

	@Override
	public List<ListPaging> searchAjax_maincontent(Map<String, Object> contentParamMap) {
		List<ListPaging> searchAjax_maincontent = null;
		try {
			 searchAjax_maincontent = session.selectList("searchAjax_maincontent", contentParamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchAjax_maincontent Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return searchAjax_maincontent;
	}

	@Override
	public ListPaging countsearchcontentNew(Map<String, Object> cntParamMap) {
		ListPaging listPaging = null;
		try {
			 listPaging = session.selectOne("countsearchcontentNew", cntParamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchContentListCnt Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return listPaging;
	}

	@Override
	public List<ListPaging> searchcontent_paging(Map<String, Object> contentparamMap) {
		List<ListPaging> searchcontent_paging = null;
		try {
			searchcontent_paging = session.selectList("searchAjax_maincontent", contentparamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchcontent_paging Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return searchcontent_paging;
	}

	@Override
	public ListPaging searchHashtagListCnt(Map<String, Object> count) {
		ListPaging listPaging = null;
		try {
			 listPaging = session.selectOne("searchHashtagListCnt", count);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchHashtagListCnt Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return listPaging;
	}

	@Override
	public List<ListPaging> searchAjax_mainhashtag(Map<String, Object> hashtagParamMap) {
		List<ListPaging> searchAjax_mainhashtag = null;
		try {
			searchAjax_mainhashtag = session.selectList("searchAjax_mainhashtag", hashtagParamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchAjax_mainhashtag Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return searchAjax_mainhashtag;
	}

	@Override
	public ListPaging countsearchhashtagNew(Map<String, Object> cntParamMap) {
		ListPaging listPaging = null;
		try {
			listPaging = session.selectOne("countsearchhashtagNew", cntParamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl countsearchhashtagNew Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return listPaging;
	}

	@Override
	public List<ListPaging> searchhashtag_paging(Map<String, Object> hashtagparamMap) {
		List<ListPaging> searchhashtag_paging = null;
		try {
			searchhashtag_paging = session.selectList("searchAjax_mainhashtag", hashtagparamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchhashtag_paging Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return searchhashtag_paging;
	}

	@Override
	public ListPaging searchMasterListCnt(Map<String, Object> count) {
		ListPaging listPaging = null;
		try {
			listPaging = session.selectOne("searchMasterListCnt", count);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchMasterListCnt Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return listPaging;
	}

	@Override
	public List<ListPaging> searchAjax_mainmaster(Map<String, Object> masterParamMap) {
		List<ListPaging> searchAjax_mainmaster = null;
		try {
			searchAjax_mainmaster = session.selectList("searchAjax_mainmaster", masterParamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchAjax_mainmaster Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		
		return searchAjax_mainmaster;
	}

	@Override
	public ListPaging countsearchmasterNew(Map<String, Object> cntParamMap) {
		ListPaging listPaging = null;
		try {
			listPaging = session.selectOne("countsearchmasterNew", cntParamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchAjax_mainmaster Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return listPaging;
	}

	@Override
	public List<ListPaging> searchmaster_paging(Map<String, Object> masterparamMap) {
		List<ListPaging> searchmaster_paging = null;
		try {
			searchmaster_paging = session.selectList("searchAjax_mainmaster", masterparamMap);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchmaster_paging Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return searchmaster_paging;
	}

	@Override
	public int searchAllCount(String mainSearchName) {
		int searchAllCount = 0;
		try {
			searchAllCount = session.selectOne("searchAllCount", mainSearchName);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchAllCount Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return searchAllCount;
	}

	@Override
	public int searchHashCount(String mainSearchName) {
		int searchHashCount = 0;
		try {
			searchHashCount = session.selectOne("searchHashCount", mainSearchName);
		}catch(Exception e) {
			System.out.println("WJDaoImpl searchAllCount Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return searchHashCount;
	}

	@Override
	public int selectCategory_count_all(Map<String, Object> count_category) {
		int selectCategory_count_all = 0;
		try {
			selectCategory_count_all = session.selectOne("selectCategory_count_all", count_category);
		}catch(Exception e) {
			System.out.println("WJDaoImpl selectCategory_count_all Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return selectCategory_count_all;
	}

	@Override
	public List<WJPointUser_info> pointList() {
		List<WJPointUser_info> pointList = null;
		try {
			 pointList = session.selectList("pointList");
		}catch(Exception e) {
			System.out.println("WJDaoImpl pointList Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return pointList;
	}

	@Override
	public List<Community> commList() {
		List<Community> commList = null;
		try {
			commList = session.selectList("commList");
		}catch(Exception e) {
			System.out.println("WJDaoImpl pointList Method Error => " + e.getMessage());
			e.printStackTrace();
		}
		return commList;
	}
	
}
