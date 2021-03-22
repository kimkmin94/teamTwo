package com.oracle.teamTwo.hj.controller;


import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.oracle.teamTwo.teamtwo.model.Cmu_reply;
import com.oracle.teamTwo.teamtwo.model.Community;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.dh.service.dhUserServiceImpl;
import com.oracle.teamTwo.hj.service.HjService;
import com.oracle.teamTwo.hj.service.Paging;
import com.oracle.teamTwo.pys.service.MyPageService;

@Controller
public class HJCommunityController {
	@Autowired
	private HjService service;
	
   @Autowired
   dhUserServiceImpl dus;
   
   @SuppressWarnings("null")
   @ModelAttribute("user_model")
   public void user_model(User_info user_model, HttpServletRequest request) {
	   
	   HttpSession session = request.getSession();
	   
		   session.setAttribute("user_id_email", session.getAttribute("user_id_email"));
		   session.setAttribute("user_nickname", session.getAttribute("user_nickname"));
		   session.setAttribute("user_image", session.getAttribute("user_image"));

   }

   @RequestMapping(value = "community")
	public String community(Community comm, Model model, String currentPage, String b_c_num,  HttpServletRequest request) {
		List<Community> commList = null;
		int total = 0;
		Paging page = null;
		if(b_c_num != null) {
			//커테고리별 게시판
			comm.setB_c_num(Integer.parseInt(b_c_num));
			total = service.totalnav(Integer.parseInt(b_c_num));
			page = new Paging(total, currentPage);
			comm.setStart(page.getStart());
			comm.setEnd(page.getEnd());
			commList = service.listnav(comm);
			
		}else {
			//전체 게시판
			total = service.total();
			page = new Paging(total, currentPage);
			comm.setStart(page.getStart());
			comm.setEnd(page.getEnd());
			commList = service.listAll(comm);
		}

		
		model.addAttribute("page", page);
		model.addAttribute("total", total);
		model.addAttribute("commList", commList);
		model.addAttribute("b_c_num", b_c_num);
		return "hj/community";
	}
	   

	@RequestMapping(value = "writeForm")
	public String writeForm(Model model,HttpServletRequest request) {
		return "hj/writeFrom";
	}
	
	@PostMapping(value = "write_insert")
	public String write_insert(Community comm,Model model,HttpServletRequest request,MultipartFile file) throws IOException, Exception {
		//글쓰기 insert
		comm.setB_id_email((String)request.getSession().getAttribute("user_id_email"));
		comm.setB_nickname((String)request.getSession().getAttribute("user_nickname"));
		comm.setB_c_num(Integer.parseInt(request.getParameter("b_c_num")));
		comm.setB_title(request.getParameter("title"));
		comm.setB_contents(request.getParameter("content"));
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/cmuIMG");
		String saveName = null;
		if(file.getSize() == 0 ) {
			comm.setB_image("");
			
		}else {
		
			saveName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			comm.setB_image(saveName);
		}	
		int result_insert_write = service.insertComm(comm);
		model.addAttribute("saveName", saveName);
		model.addAttribute("file", file);
		model.addAttribute("result_insert_write", result_insert_write);
		
		return "hj/insertCommResult";
	}
	

	private String uploadFile(String originalName, byte[] fileData , String uploadPath) throws Exception {
		UUID uid = UUID.randomUUID();
		File fileDirectory = new File(uploadPath);
		if(!fileDirectory.exists()) {
			fileDirectory.mkdirs();
			System.out.println("=>업로드용 폴더 생성 : "+uploadPath);
		}
		String saveName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, saveName);
		FileCopyUtils.copy(fileData, target);
		
		return saveName;
	}
	
	@GetMapping(value = "cmu_detail")
	public String cmu_detail(int b_num, Model model, HttpServletRequest request) {
		
		Community com = service.findByB_num(b_num);
		int update = service.update(b_num);
		int replyTotal = service.totalReply(b_num);
		List<Cmu_reply> replyList = service.findReplyAll(b_num);
		HttpSession session = request.getSession();
		User_info user_info = new User_info();
		String user_id_email = (String) session.getAttribute("user_id_email");
		String user_nickname = (String) session.getAttribute("user_nickname");
		user_info.setUser_id_email(user_id_email);
		user_info.setUser_nickname(user_nickname);

		
		model.addAttribute("user_info", user_info);
		model.addAttribute("com", com);
		model.addAttribute("replyTotal", replyTotal);
		model.addAttribute("replyList", replyList);
		return "hj/cmu_detail";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "reply_insert", produces = "application/text;charset=UTF-8")
	public String reply_insert(Model model,HttpServletRequest request,Cmu_reply cmu) {
		//댓글 등록시 아작스 + 댓글 달면 도토리 주기
		cmu.setB_num(Integer.parseInt(request.getParameter("b_num")));
		cmu.setRe_contents(request.getParameter("reply"));
		String user_id_email =request.getParameter("user_id_email");
		cmu.setRe_writer(user_id_email);
		int recent_point = service.findPoint(user_id_email);
		Point point = new Point();
		point.setPoint_balance(recent_point);
		point.setUser_id_email(user_id_email);
		int add_point = service.addPoint(point);
		
		String success1=service.reply_insert(cmu);
		return success1;
	}
	
	@GetMapping(value = "delete")
	public String delete(int b_num, Model model) {
		//삭제버튼 누르면 게시글 상태만 변경하기, 삭제시 커뮤니티 페이지로 이동
		int result_delete = service.deleteCmu(b_num);
		model.addAttribute("result_delete", result_delete);
		return "hj/deletResult";
	}

	@GetMapping(value = "update")
	public String update(int b_num,Model model ) {
		//게시글 수정 수정하러 가기
		Community comm = service.findByB_num(b_num);
		model.addAttribute("com", comm);
		return "hj/updateForm";
	}
	
	@PostMapping(value = "write_update")
	public String write_update(	String originalName,int b_num,Community comm,HttpServletRequest request,MultipartFile file, Model model) throws IOException, Exception {
		//게시글 수정시 업데이트
		comm.setB_num(b_num);
		comm.setB_title(request.getParameter("title"));
		comm.setB_contents(request.getParameter("content"));
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/cmuIMG");
		String saveName = null;
		
		if(file.getSize() == 0 ) {
			comm.setB_image("");
			
		}else {
			saveName = uploadFile(file.getOriginalFilename(), file.getBytes(), uploadPath);
			comm.setB_image(saveName);
		}	

		int result = service.updateWrite(comm);
		model.addAttribute("saveName", saveName);
		model.addAttribute("file", file);
		model.addAttribute("result", result);
		return "hj/write_updateResult";
	}
	
	@ResponseBody
	@RequestMapping(value = "updateLike")
	public String updateLike(int b_num) {
		//게시글 좋아요 수 +1
		String result  = service.updateLike(b_num);
		return result;
	}
	
	@PostMapping(value = "search")
	public String search(Community comm, Model model, String currentPage,
			@RequestParam(defaultValue = "b_title") String search_option,
			@RequestParam(defaultValue = "") String keyword 
			
			) {
		//검색
		
		comm.setSearch(search_option);
		comm.setKeyword(keyword);

		int total = service.totalSearch(comm);
		Paging page = new Paging(total, currentPage);
		comm.setStart(page.getStart());
		comm.setEnd(page.getEnd());
		
		List<Community> commList = service.search(comm);
		int size = commList.size();
		model.addAttribute("page", page);
		model.addAttribute("size", size);
		model.addAttribute("total", total);
		model.addAttribute("commList", commList);
		return "hj/community";
	}
	
	@ResponseBody
	@RequestMapping(value = "deleteReply")
	public String deleteReply(int re_no) {
		//댓글 삭제 (=댓글 상태 -1로)
		String result = service.deleteReply(re_no);
		return "result";
	}
	
	@ResponseBody
	@RequestMapping(value = "Reply_update")
	public String Reply_update(int re_no, String contents) {
		//댓글 수정
		Cmu_reply cmu = new Cmu_reply();
		cmu.setRe_no(re_no);
		cmu.setRe_contents(contents);
		String result = service.updateReply(cmu);
		return result;
	}
	
	
	
	
	
}
