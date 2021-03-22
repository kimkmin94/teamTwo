package com.oracle.teamTwo.wj.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oracle.teamTwo.dh.service.dhUserServiceImpl;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Community;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.wj.model.ListPaging;
import com.oracle.teamTwo.wj.model.WJPointUser_info;
import com.oracle.teamTwo.wj.service.WJService;


@Controller
public class WJController {
	
	   // teamtwo user model 끝
	   @Autowired
	   dhUserServiceImpl dus;
	   
		// teamtwo user model 시작
	   @SuppressWarnings("null")
	   @ModelAttribute("user_model")
	   public void user_model(User_info user_model, HttpServletRequest request) {
		   
		   HttpSession session = request.getSession();
		   
			   session.setAttribute("user_id_email", session.getAttribute("user_id_email"));
			   session.setAttribute("user_nickname", session.getAttribute("user_nickname"));
			   session.setAttribute("user_image", session.getAttribute("user_image"));

	   } // teamtwo user model 끝
	   
    @Autowired
	private WJService wjService;
	
  
    
    
	@GetMapping(value = "main")
	public String main(HttpServletRequest request, Model model) {
		
		String context = request.getContextPath();
		
		  HttpSession session = request.getSession();
		  String user_id_email = (String) session.getAttribute("user_id_email");
		
		User_info user_info = wjService.selectUser(user_id_email);
		if(user_info == null) {
			return "redirect:index";
		}
       List<Challenge> chatbotList = wjService.chatbotList(user_id_email);
		
        Date today = new Date();
        
        List<WJPointUser_info> pointList = wjService.pointList();
        List<Community> commList = wjService.commList();
        System.out.println("context =>" + context);
        System.out.println("today => " + today);
        System.out.println("user_nickname -> " + pointList.size());
        
		model.addAttribute("chatbotList", chatbotList);
		model.addAttribute("pointList", pointList);
		model.addAttribute("commList", commList);
		
		model.addAttribute("context", context);
		return "wj/main";
	}
	
	
	
	@RequestMapping(value = "getCategoryLcNum")
	@ResponseBody
	public List<Main_category> getCategoryLcNum(int lc_num) {
		
		System.out.println("WJController getCategoryNum lc_num =>" + lc_num);
		List<Main_category> categoryLcNum = wjService.selCategoryLc_num(lc_num);
		
		return categoryLcNum;
	}
	
	@RequestMapping(value = "getCategoryMcNum")
	@ResponseBody
	public List<Main_category> getCategoryMcNum(int lc_num,int mc_num) {
		
		Main_category category = new Main_category();
		
		category.setLc_num(lc_num);
		category.setMc_num(mc_num);
		System.out.println("WJController getCategoryNum mc_num =>" + mc_num);
		List<Main_category> categoryMcNum = wjService.selCategoryMc_num(category);
		
		return categoryMcNum;
	}
	
	
	@RequestMapping(value = "getChgTimeChk")
	@ResponseBody
	public Challenge getChgTimeChk(int chg_num) {
		
		System.out.println("ajax 챌린지 번호 chg_num => " + chg_num);
		Challenge getChgTimeChk = wjService.getChgTimeChk(chg_num);
		
		
		return getChgTimeChk;
	}
///////////////////////////////////////////////////////////////////////// mainSearch	
	// mainSearch.jsp에 이동
	@PostMapping(value = "mainSearch")
	public String mainSearch(String mainSearchName,String user_id_email,String user_nickname,String user_image,HttpServletRequest request,Model model) {
		
		int searchAllCount = wjService.searchAllCount(mainSearchName); 
		int searchHashCount = wjService.searchHashCount(mainSearchName);
		
		int searchAllCnt = searchAllCount + searchHashCount;
		
		model.addAttribute("mainSearchName", mainSearchName);
		model.addAttribute("searchAllCnt", searchAllCnt);
		return "wj/mainSearch";
	}
	// mainSearch.jsp에서 제목에 관한 챌린지 카운트 가져오는용도
	@RequestMapping(value = "searchAjax_maintitlecount")
	@ResponseBody
	public ListPaging searchAjax_maintitlecount(String searchName) {
		ListPaging listPaging = null;
		
		System.out.println("WJController searchAjax_maintitlecount searchName =>" + searchName);
		
		Map<String, Object> count = new HashMap<String, Object>();
		
		count.put("searchName", searchName);
		
		listPaging = wjService.searchTitleListCnt(count);
		
		return listPaging;
	}
	
	@RequestMapping(value = "searchAjax_maincontentcount")
	@ResponseBody
	public ListPaging searchAjax_mainContentcount(String searchName) {
         ListPaging listPaging = null;
		
		System.out.println("WJController searchAjax_maintitlecount searchName =>" + searchName);
		
		Map<String, Object> count = new HashMap<String, Object>();
		
		count.put("searchName", searchName);
		
		listPaging = wjService.searchContentListCnt(count);
		
		return listPaging;
	}
	
	@RequestMapping(value = "searchAjax_mainhashtagcount")
	@ResponseBody
	public ListPaging searchAjax_mainHashtagcount(String searchName) {
		
        ListPaging listPaging = null;
		
		System.out.println("WJController searchAjax_maintitlecount searchName =>" + searchName);
		
		Map<String, Object> count = new HashMap<String, Object>();
		
		count.put("searchName", searchName);
		
		listPaging = wjService.searchHashtagListCnt(count);
		
		return listPaging;
		
	}
	
	@RequestMapping(value = "searchAjax_mainmastercount")
	@ResponseBody
    public ListPaging searchAjax_mainMastercount(String searchName) {
		
        ListPaging listPaging = null;
		
		System.out.println("WJController searchAjax_mainMastercount searchName =>" + searchName);
		
		Map<String, Object> count = new HashMap<String, Object>();
		
		count.put("searchName", searchName);
		
		listPaging = wjService.searchMasterListCnt(count);
		
		return listPaging;
		
	}
	
	@RequestMapping(value = "searchAjax_maincontent")
	@ResponseBody
	public List<ListPaging> searchAjax_maincontent(String searchName, int count){
        
		List<ListPaging> searchAjax_maincontent = null;
		
        int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> contentParamMap = new HashMap<String, Object>();
		
		contentParamMap.put("searchName", searchName);
		contentParamMap.put("start_row", listPaging.getStartRow());
		contentParamMap.put("end_row", listPaging.getEndRow());
		
		
	    searchAjax_maincontent = wjService.searchAjax_maincontent(contentParamMap);
		
		return searchAjax_maincontent;
	}
	
	@RequestMapping(value = "searchAjax_maintitle")
	@ResponseBody
	public List<ListPaging> searchAjax_maintitle(String searchName, int count){
		
		List<ListPaging> searchAjax_maintitle = null;
		
        int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> titleParamMap = new HashMap<String, Object>();
		
	    titleParamMap.put("searchName", searchName);
	    titleParamMap.put("start_row", listPaging.getStartRow());
	    titleParamMap.put("end_row", listPaging.getEndRow());
		
		
		searchAjax_maintitle = wjService.searchAjax_maintitle(titleParamMap);
		
		return searchAjax_maintitle;
	}
	
	@RequestMapping(value = "searchAjax_mainhashtag")
	@ResponseBody
    public List<ListPaging> searchAjax_mainhashtag(String searchName, int count){
		
		List<ListPaging> searchAjax_mainhashtag = null;
		
        int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> hashtagParamMap = new HashMap<String, Object>();
		
		hashtagParamMap.put("searchName", searchName);
	    hashtagParamMap.put("start_row", listPaging.getStartRow());
	    hashtagParamMap.put("end_row", listPaging.getEndRow());
		
		
	    searchAjax_mainhashtag = wjService.searchAjax_mainhashtag(hashtagParamMap);
		
		return searchAjax_mainhashtag;
	}
	
	@RequestMapping(value = "searchAjax_mainmaster")
	@ResponseBody
    public List<ListPaging> searchAjax_mainmaster(String searchName, int count){
		
		List<ListPaging> searchAjax_mainmaster = null;
		
        int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> masterParamMap = new HashMap<String, Object>();
		
		masterParamMap.put("searchName", searchName);
		masterParamMap.put("start_row", listPaging.getStartRow());
		masterParamMap.put("end_row", listPaging.getEndRow());
		
		
	    searchAjax_mainmaster = wjService.searchAjax_mainmaster(masterParamMap);
		
		return searchAjax_mainmaster;
	}
	
	@RequestMapping(value = "searchAjax_maintitle_page")
	@ResponseBody
	public ListPaging searchAjax_maintitle_page(int count) {
        int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	
	@RequestMapping(value = "searchAjax_maincontent_page")
	@ResponseBody
	public ListPaging searchAjax_maincontent_page(int count){
        int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	
	@RequestMapping(value = "searchAjax_mainhashtag_page")
	@ResponseBody
	public ListPaging searchAjax_mainhashtag_page(int count){
        int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	
	@RequestMapping(value = "searchAjax_mainmaster_page")
	@ResponseBody
	public ListPaging searchAjax_mainmaster_page(int count){
        int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping(value = "countsearchTitleNew")
	@ResponseBody
	public ListPaging countsearchTitleNew(String searchName, int choice) {
		ListPaging listPaging = null;
		Map<String, Object> cntParamMap = new HashMap<String, Object>();
		cntParamMap.put("searchName", searchName);
		if(choice != 1) {
			cntParamMap.put("choice", choice);		
		}
		listPaging = wjService.countsearchTitleNew(cntParamMap);
		return listPaging;
	}
	
	@RequestMapping(value = "countsearchcontentNew")
	@ResponseBody
	public ListPaging countsearchcontentNew(String searchName, int choice) {
		ListPaging listPaging = null;
		Map<String, Object> cntParamMap = new HashMap<String, Object>();
		cntParamMap.put("searchName", searchName);
		if(choice != 1) {
			cntParamMap.put("choice", choice);		
		}
		listPaging = wjService.countsearchcontentNew(cntParamMap);
		return listPaging;
	}
	
	@RequestMapping(value = "countsearchhashtagNew")
	@ResponseBody
	public ListPaging countsearchhashtagNew(String searchName, int choice) {
		ListPaging listPaging = null;
		Map<String, Object> cntParamMap = new HashMap<String, Object>();
		cntParamMap.put("searchName", searchName);
		if(choice != 1) {
			cntParamMap.put("choice", choice);		
		}
		listPaging = wjService.countsearchhashtagNew(cntParamMap);
		return listPaging;
	}
	
	@RequestMapping(value = "countsearchmasterNew")
	@ResponseBody
	public ListPaging countsearchmasterNew(String searchName, int choice) {
		ListPaging listPaging = null;
		Map<String, Object> cntParamMap = new HashMap<String, Object>();
		cntParamMap.put("searchName", searchName);
		if(choice != 1) {
			cntParamMap.put("choice", choice);		
		}
		listPaging = wjService.countsearchmasterNew(cntParamMap);
		return listPaging;
	}
	
	@RequestMapping(value = "searchTitle_paging")
	@ResponseBody
	public List<ListPaging> searchTitle_paging(String searchName, int count,int page,int choice,int order){
        
		List<ListPaging> searchTitle_paging = null;
		int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> titleparamMap = new HashMap<String, Object>();
		
		System.out.println("startRow => " + listPaging.getStartRow());
		System.out.println("endRow => " + listPaging.getEndRow());
		titleparamMap.put("searchName", searchName);
		titleparamMap.put("start_row", listPaging.getStartRow());
		titleparamMap.put("end_row", listPaging.getEndRow());
		System.out.println("choice => " + choice);
		if(choice != 1) {
			titleparamMap.put("choice", choice);
		}
		System.out.println("order => " + order);
		if(order != 0) {
			titleparamMap.put("order", order);
		}
		searchTitle_paging = wjService.searchTitle_paging(titleparamMap);
		
		
		return searchTitle_paging;
	}
	
	@RequestMapping(value = "searchcontent_paging")
	@ResponseBody
	public List<ListPaging> searchcontent_paging(String searchName, int count,int page,int choice,int order){
		
		List<ListPaging> searchcontent_paging = null;
		int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> contentparamMap = new HashMap<String, Object>();
		
		System.out.println("startRow => " + listPaging.getStartRow());
		System.out.println("endRow => " + listPaging.getEndRow());
		contentparamMap.put("searchName", searchName);
		contentparamMap.put("start_row", listPaging.getStartRow());
		contentparamMap.put("end_row", listPaging.getEndRow());
		System.out.println("choice => " + choice);
		if(choice != 1) {
			contentparamMap.put("choice", choice);
		}
		System.out.println("order => " + order);
		if(order != 0) {
			contentparamMap.put("order", order);
		}
		searchcontent_paging = wjService.searchcontent_paging(contentparamMap);
		
		
		return searchcontent_paging;
		 
	}
	
	@RequestMapping(value = "searchhashtag_paging")
	@ResponseBody
    public List<ListPaging> searchhashtag_paging(String searchName, int count,int page,int choice,int order){
		
		List<ListPaging> searchhashtag_paging = null;
		int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> hashtagparamMap = new HashMap<String, Object>();
		
		System.out.println("startRow => " + listPaging.getStartRow());
		System.out.println("endRow => " + listPaging.getEndRow());
		hashtagparamMap.put("searchName", searchName);
		hashtagparamMap.put("start_row", listPaging.getStartRow());
		hashtagparamMap.put("end_row", listPaging.getEndRow());
		System.out.println("choice => " + choice);
		if(choice != 1) {
			hashtagparamMap.put("choice", choice);
		}
		System.out.println("order => " + order);
		if(order != 0) {
			hashtagparamMap.put("order", order);
		}
		searchhashtag_paging = wjService.searchhashtag_paging(hashtagparamMap);
		
		
		return searchhashtag_paging;
		 
	}
	
	@RequestMapping(value = "searchmaster_paging")
	@ResponseBody
public List<ListPaging> searchmaster_paging(String searchName, int count,int page,int choice,int order){
		
		List<ListPaging> searchmaster_paging = null;
		int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> masterparamMap = new HashMap<String, Object>();
		
		System.out.println("startRow => " + listPaging.getStartRow());
		System.out.println("endRow => " + listPaging.getEndRow());
		masterparamMap.put("searchName", searchName);
		masterparamMap.put("start_row", listPaging.getStartRow());
		masterparamMap.put("end_row", listPaging.getEndRow());
		System.out.println("choice => " + choice);
		if(choice != 1) {
			masterparamMap.put("choice", choice);
		}
		System.out.println("order => " + order);
		if(order != 0) {
			masterparamMap.put("order", order);
		}
		searchmaster_paging = wjService.searchmaster_paging(masterparamMap);
		
		
		return searchmaster_paging;
		 
	}
	
	
	@RequestMapping(value = "searchtitle_newpage")
	@ResponseBody
	public ListPaging searchtitle_newpage(int count , int page) {
        int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	
	@RequestMapping(value = "searchcontent_newpage")
	@ResponseBody
	public ListPaging searchcontent_newpage(int count , int page) {
        int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	
	@RequestMapping(value = "searchhashtag_newpage")
	@ResponseBody
	public ListPaging searchhashtag_newpage(int count , int page) {
        int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	
	@RequestMapping(value = "searchmaster_newpage")
	@ResponseBody
	public ListPaging searchmaster_newpage(int count , int page) {
        int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	
/////////////////////////////////////////////////////////////////////////////////////category_challenge	
	// category_Challenge.jsp로이동
	@PostMapping(value = "category_searchs")
	public String category_searching(String user_id_email, String user_nickname , String user_image,
			                         int lc_num, int mc_num, int sc_num ,HttpServletRequest request, Model model) {
		
		
		System.out.println("WJController category_searching lc_num =>" + lc_num);
		System.out.println("WJController category_searching mc_num =>" + mc_num);
		System.out.println("WJController category_searching sc_num =>" + sc_num);
		
		Map<String, Object> count_category = new HashMap<String, Object>();
		
		count_category.put("lc_num", lc_num);
		count_category.put("mc_num", mc_num);
		count_category.put("sc_num", sc_num);
		
		int category_search_count1 = wjService.selectCategory_count_all(count_category); 
		
		model.addAttribute("lc_num", lc_num);
		model.addAttribute("mc_num", mc_num);
		model.addAttribute("sc_num", sc_num);
		model.addAttribute("category_search_count1", category_search_count1);
		return "wj/category_Challenge";
	}
	// category_challenge.jsp 실행될때 나오는 ajax페이징
	@RequestMapping(value = "category_ajax_listCount")
	@ResponseBody
	public Challenge category_ajax_listCount(int lc_num , int mc_num, int sc_num) {
		
		Main_category main_category = new Main_category();
		main_category.setLc_num(lc_num);
		main_category.setMc_num(mc_num);
		main_category.setSc_num(sc_num);
		
		Challenge challenge = wjService.category_ajax_listCount(main_category);
		System.out.println("count => " + challenge.getCount());
		return challenge;
	}
	
	// category_challenge.jsp 실행될때 나오는 ajax페이징
	@RequestMapping(value = "category_ajax")
	@ResponseBody
	public List<ListPaging> category_ajax(int lc_num, int mc_num , int sc_num, int count){
		
		List<ListPaging> category_ajax = null;
		
		int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
	    paramMap.put("lc_num", lc_num);
	    paramMap.put("mc_num", mc_num);
	    paramMap.put("sc_num", sc_num);
		paramMap.put("start_row", listPaging.getStartRow());
		paramMap.put("end_row", listPaging.getEndRow());
		
		category_ajax = wjService.category_ajax(paramMap);
		
		
		return category_ajax;
	}
	
	// category_challenge.jsp 실행될때 나오는 ajax페이징
	@RequestMapping(value = "category_ajax_page")
	@ResponseBody
	public ListPaging category_ajax_page(int count) {		
        int currentPage = 1;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	// category_challenge.jsp 체크박스나 page번호 눌럿을때	
	@RequestMapping(value = "category_challenge_paging")
	@ResponseBody
	public List<ListPaging> category_challenge_paging (int lc_num, int mc_num , int sc_num, int count,int page,int choice,int order){
		
		List<ListPaging> category_challenge_paging = null;
		
        int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		System.out.println("startRow => " + listPaging.getStartRow());
		System.out.println("endRow => " + listPaging.getEndRow());
	    paramMap.put("lc_num", lc_num);
	    paramMap.put("mc_num", mc_num);
	    paramMap.put("sc_num", sc_num);
		paramMap.put("start_row", listPaging.getStartRow());
		paramMap.put("end_row", listPaging.getEndRow());
		System.out.println("choice => " + choice);
		if(choice != 1) {
			paramMap.put("choice", choice);
		}
		System.out.println("order => " + order);
		if(order != 0) {
			paramMap.put("order", order);
		}
        category_challenge_paging = wjService.category_ajax(paramMap);
		
		
		
		return category_challenge_paging;
	}
	// category_challenge.jsp 체크박스나 page번호 눌럿을때	
	@RequestMapping(value = "countNew")
	@ResponseBody
	public ListPaging countNew(int choice , int lc_num , int mc_num , int sc_num) {
		ListPaging listPaging = null;
		Map<String, Object> cntParamMap = new HashMap<String, Object>();
		cntParamMap.put("lc_num", lc_num);
		cntParamMap.put("mc_num", mc_num);
		cntParamMap.put("sc_num", sc_num);
		if(choice != 1) {
			cntParamMap.put("choice", choice);		
		}
		listPaging = wjService.categorycnt(cntParamMap);
		
		return listPaging;
	}
	
	
// category_challenge.jsp 체크박스나 page번호 눌럿을때	
	@RequestMapping(value = "category_challenge_newpage")
	@ResponseBody
	public ListPaging category_challenge_newpage(int count, int page) {		
        int currentPage = page;
        
		ListPaging listPaging = new ListPaging();
		
		listPaging.setPageSize(9);
		listPaging.setBlockSize(10);
		
		listPaging.setStartRow((currentPage - 1) * listPaging.getPageSize() + 1);
		listPaging.setEndRow(listPaging.getStartRow() + listPaging.getPageSize() - 1);
		listPaging.setStartNum(count - listPaging.getStartRow() + 1);
		listPaging.setPageCnt((int)Math.ceil((double)count/listPaging.getPageSize()));
		listPaging.setStartPage((int)(currentPage-1)/listPaging.getBlockSize() * listPaging.getBlockSize() + 1);
		listPaging.setEndPage(listPaging.getStartPage() + listPaging.getBlockSize() - 1);
		if(listPaging.getEndPage() > listPaging.getPageCnt()) {
			listPaging.setEndPage(listPaging.getPageCnt());
		}				
		return listPaging;
	}
	
}
