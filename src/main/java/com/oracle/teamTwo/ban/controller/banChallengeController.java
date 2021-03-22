package com.oracle.teamTwo.ban.controller;

import java.io.File;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chg_chat_category;
import com.oracle.teamTwo.teamtwo.model.Hashtag;
import com.oracle.teamTwo.teamtwo.model.Main_category;
import com.oracle.teamTwo.teamtwo.model.Oper_challenge;
import com.oracle.teamTwo.teamtwo.model.User_info;
import com.oracle.teamTwo.ban.service.banChallengeService;

import com.oracle.teamTwo.dh.service.dhUserServiceImpl;

@Controller
public class banChallengeController {

	@Autowired
	private banChallengeService bcs;

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

	@RequestMapping(value = "makechallenge")
	public String makeChallenge(Model model, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String user_id_email = (String) session.getAttribute("user_id_email");

		// user 정보 확인하여 객체에 담기
		User_info userinfo = bcs.readUserInfo(user_id_email);
		model.addAttribute("userinfo", userinfo);

		// 카테고리 대분류 읽어오기
		List<Main_category> category1 = bcs.readCategory1();
		model.addAttribute("category1", category1);

		// 비회원일 시 로그인으로, 회원일 시 뷰로 분기
		String result;

		if (user_id_email == "" || user_id_email == null) {
			result = "redirect:login";
		} else {
			result = "ban/makechallenge";
		}

		return result;

	}

	// 챌린지 기간 중복체크 (ajax에 의해 호출)

	@RequestMapping(value = "doubleCheck")
	@ResponseBody
	public String doubleCheck(Model model, String user_id_email, String selectedstart, String selectedend)
			throws ParseException {

		// 임의값 설정
		String result = "doublecheck";

		// user의 기존 챌린지 읽어오기
		List<Challenge> userExChallenge = bcs.getuserChallenge(user_id_email);
		int size = userExChallenge.size();

		// 입력받은 유저의 희망 시작일/종료일을 java.util.Date로 파싱하기
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date wish_start = sdf.parse(selectedstart);
		java.util.Date wish_end = sdf.parse(selectedend);

		// 기존 챌린지 날짜 꺼내오기
		for (int i = 0; i < size; i++) {

			// 기존 챌린지의 시작일/종료일을 java.util.Date date로 파싱한다
			java.util.Date existing_start = new java.util.Date(userExChallenge.get(i).getChg_startdate().getTime());
			java.util.Date existing_end = new java.util.Date(userExChallenge.get(i).getChg_enddate().getTime());

			// 1. 기존 챌린지의 시작일이 새로 열려는 챌린지의 종료일보다 이전이면서
			// && 2. 기존 챌린지의 종료일이 새로 열려는 챌린지의 시작일보다 나중이면 기간이 중복되는 것이다.

			if (existing_start.compareTo(wish_end) <= 0 && existing_end.compareTo(wish_start) >= 0) {
				System.out.println("Banya : --> [불가능] 기간 중복 있음");
				result = "impossible";
				break;
			} else {
				System.out.println("Banya : --> [가능] 기간 중복 없음");
				result = "possible";
			}

		}

		return result;

	}

	// Ajax에서 대분류값을 받아 중분류를 읽어오는 로직
	@RequestMapping(value = "readCategory2")
	@ResponseBody
	public List<Main_category> readCategory2(String lc_num) {
		int lc_num2 = Integer.parseInt(lc_num);
		System.out.println("Banya : banChallengeController > readCategory2 lc_num2 : " + lc_num2);
		List<Main_category> category2 = bcs.readCategory2(lc_num2);
		return category2;

	}

	// Ajax에서 중분류값을 받아 소분류를 읽어오는 로직
	@RequestMapping(value = "readCategory3")
	@ResponseBody
	public List<Main_category> readCategory3(String lc_num, String mc_num) {
		Main_category main_category = new Main_category();
		main_category.setLc_num(Integer.parseInt(lc_num));
		main_category.setMc_num(Integer.parseInt(mc_num));
		System.out.println("Banya : banChallengeController > readCategory3 mc_num2 : " + main_category.getMc_num());
		List<Main_category> category3 = bcs.readCategory3(main_category);
		return category3;

	}

	// 챌린지 등록 후 컨펌 페이지
	@PostMapping(value = "confirmChal")
	public String confirmChallenge(Model model, Challenge challenge, String user_id_email, String q_cnum_1,
			String q_cnum_2, String hash1, String hash2, String hash3, HttpServletRequest request, MultipartFile file1,
			MultipartFile file2) throws Exception {

		// 파일1 받기
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/mainIMG");
		String savedName = uploadFile(file1.getOriginalFilename(), file1.getBytes(), uploadPath);
		model.addAttribute("file1savedName", savedName);

		// 파일2 받기
		String uploadPath2 = request.getSession().getServletContext().getRealPath("/upload/exIMG");
		String savedName2 = uploadFile(file2.getOriginalFilename(), file2.getBytes(), uploadPath2);
		model.addAttribute("file2savedName", savedName2);

		// user 정보 확인 후 담기
		User_info userinfo = bcs.readUserInfo(user_id_email);
		model.addAttribute("userinfo", userinfo);

		// model에 챌린지 객체 담기
		model.addAttribute("userchallenge", challenge);

		// 챌린지 기간 계산
		long calcudate = challenge.getChg_enddate().getTime() - challenge.getChg_startdate().getTime();
		long duration = Math.abs(calcudate / (24 * 60 * 60 * 1000)) + 1;
		model.addAttribute("duration", duration);

		int duration_answer;

		if (duration < 8) {
			duration_answer = 1;
		} else if (duration < 15) {
			duration_answer = 2;
		} else if (duration < 22) {
			duration_answer = 3;
		} else {
			duration_answer = 4;
		}

		// 카테고리 num을 가지고 subject(분류명) 읽어오기

		// 대분류
		List<Main_category> category1 = bcs.readCategory1();
		int lcnum = (challenge.getLc_num()) / 10;
		String first_ctg = category1.get(lcnum - 1).getSubject();

		// 중분류
		List<Main_category> category2 = bcs.readCategory2(challenge.getLc_num());
		int mcnum = (challenge.getMc_num()) / 10;
		String second_ctg = category2.get(mcnum - 1).getSubject();

		// 소분류
		Main_category main_category = new Main_category();
		main_category.setLc_num(challenge.getLc_num());
		main_category.setMc_num(challenge.getMc_num());
		int scnum = challenge.getSc_num() - (challenge.getMc_num()) * 10;
		List<Main_category> category3 = bcs.readCategory3(main_category);
		String third_ctg = category3.get(scnum).getSubject();

		model.addAttribute("first_ctg", first_ctg);
		model.addAttribute("second_ctg", second_ctg);
		model.addAttribute("third_ctg", third_ctg);

		// 챗봇 로직 처리
		model.addAttribute("q_cnum_1", q_cnum_1);
		model.addAttribute("q_cnum_2", q_cnum_2);
		model.addAttribute("q_cnum_3", duration_answer);

		// 해시태그 처리
		model.addAttribute("hash1", hash1);
		model.addAttribute("hash2", hash2);
		model.addAttribute("hash3", hash3);

		return "ban/confirmchallenge";
	}

	// 파일 업로드용 메소드
	private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception {
		UUID uid = UUID.randomUUID();
		System.out.println("Banya : banChallengeController > uploadPath : " + uploadPath);
		File fileDirectory = new File(uploadPath);
		if (!fileDirectory.exists()) {
			fileDirectory.mkdirs();
			System.out.println("Banya : 챌린지 대표이미지 업로드 폴더 생성 : " + uploadPath);
		}
		String savedName = uid.toString() + "_" + originalName;
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);

		return savedName;
	}

	// 컨펌페이지를 거쳐 실제로 DB 등록하는 로직
	@PostMapping(value = "registerChal")
	public String registerChallenge(Model model, Challenge challenge, String q_cnum_1, String q_cnum_2, String q_cnum_3,
			String hash1, String hash2, String hash3, HttpServletRequest request) {

		// user 정보 확인 후 담기
		HttpSession session = request.getSession();
		String user_id_email = (String) session.getAttribute("user_id_email");
		User_info userinfo = bcs.readUserInfo(user_id_email);
		model.addAttribute("userinfo", userinfo);

		// 챌린지 테이블 update
		int result = bcs.registerChal(challenge);

		// update 성공 or 실패
		if (result > 0) {
			System.out.println("Banya : " + userinfo.getUser_nickname() + "의 챌린지 등록 성공");
			model.addAttribute("message", "챌린지가 등록되었습니다람쥐!");

		} else {
			System.out.println("Banya : " + userinfo.getUser_nickname() + "의 챌린지 등록 실패");
			model.addAttribute("message", "챌린지 등록에 실패하였습니다.");
		}

		// oper chal 테이블 반영
		Oper_challenge oper_challenge = new Oper_challenge();
		oper_challenge.setChg_num(challenge.getChg_num());
		oper_challenge.setReview_score_average(0);
		oper_challenge.setUser_id_email(user_id_email);
		int operresult = bcs.registerOperchal(oper_challenge);

		// 챗봇추천 테이블 반영
		Chg_chat_category answer1 = new Chg_chat_category();
		answer1.setChg_num(challenge.getChg_num());
		answer1.setQ_cnum(1);
		answer1.setA_cnum(Integer.parseInt(q_cnum_1));

		Chg_chat_category answer2 = new Chg_chat_category();
		answer2.setChg_num(challenge.getChg_num());
		answer2.setQ_cnum(2);
		answer2.setA_cnum(Integer.parseInt(q_cnum_2));

		Chg_chat_category answer3 = new Chg_chat_category();
		answer3.setChg_num(challenge.getChg_num());
		answer3.setQ_cnum(3);
		answer3.setA_cnum(Integer.parseInt(q_cnum_3));

		int result_first = bcs.registerChatCate(answer1);
		int result_second = bcs.registerChatCate(answer2);
		int result_third = bcs.registerChatCate(answer3);

		if (result_first > 0 && result_second > 0 && result_third > 0) {
			System.out.println("Banya : " + challenge.getChg_num() + "번 챌린지의 챗봇 답변 등록 성공");

		} else {
			System.out.println("Banya : " + challenge.getChg_num() + "번 챌린지의 챗봇 답변 등록 실패");
			model.addAttribute("message", "챌린지 등록에 실패하였습니다.");
		}

		// 해시태그 업데이트
		String hashtags[] = { hash1, hash2, hash3 };
		int tagnum = -1;

		Hashtag hashtag = new Hashtag();

		for (int i = 0; i < hashtags.length; i++) {
			int tagresult = bcs.findTag(hashtags[i]);

			if (tagresult > 0) {
				// 해당 해시태그가 있음 : 몇 번인지 찾아오자
				System.out.println("Banya : --> 이미 존재하는 해시태그 : " + hashtags[i]);
				tagnum = bcs.findTagNum(hashtags[i]);

			} else if (tagresult == 0) {
				// 해당 해시태그가 없음 : 새로 만들자
				int addtagresult = bcs.addTag(hashtags[i]);
				tagnum = bcs.findTagNum(hashtags[i]);

			} else {
				// 에러 발생
				System.out.println("Banya : banChallengeController > hashtag errors");
			}

			int this_chal_num = challenge.getChg_num();
			int matchresult = bcs.matchTag(this_chal_num, tagnum);

		}
		
		// model에 챌린지 객체 담기
		model.addAttribute("userchallenge", challenge);

		return "ban/regiChalEnd";
	}

}
