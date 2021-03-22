package com.oracle.teamTwo.dh.dao;

import java.util.List;

import com.oracle.teamTwo.dh.model.Inter;
import com.oracle.teamTwo.dh.model.ThisPoint;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Chat_category;
import com.oracle.teamTwo.teamtwo.model.Interest_category;
import com.oracle.teamTwo.teamtwo.model.User_info;

public interface dhUserDao {
      //로그인
      int      login(String user_id_email, String user_password);
      //아이디 중복체크
      int      idCheck(String user_id_email);
      //닉네임 중복체크
      int     nicCheck(String user_nickname);
      //회원 가입
      int    join(User_info user_info);
      //아이디 찾기
      String  findId(User_info user_info);
      // 비밀번호 찾기
      int    findPw(User_info user_info);
      //이메일로 보낸 비밀번호값으로 바꾸기
      void   chPw(User_info user_info);
      //회원가입 포인트 넣기
      int     point(String user_id_email);
      //
      int     interest(Interest_category category);
      //챗봇 문항들 가져오기
      List<Chat_category> chatList();
      //챗봇에 응답한 내용을 토대로 챌린지 가져오기
      List<Challenge>    uchatList3(String user_id_email);
      //
      String  subject(Interest_category category);
      //내 정보 가져오기
      User_info myInfo(String user_id_email);
      //정보 수정하기(이미지,한줄소개)
      int      updateInfo(User_info user_info);
      //암호 입력(정보 수정전 자신 암호 입력하기)
      String  pwChk(String user_id_email);
      //정보 수정하기(이미지,한줄소개,아이디 외)
      int      myUser_update(User_info user_info);
      //추천 챌린지 응답 바꾸기
      int      inter_update1(Inter inter);
      int      inter_update2(Inter inter);
      int      inter_update3(Inter inter);
      //제일 최근에 로그인한 시간 가져오기
      String  chkLogTime(String user_id_email);
      //현재시간과 제일 최근에 로그인한 시간의 차
      int      dateCha(String date);
      //현재 가지고 있는 포인트 조회
      int      thisPoint(String user_id_email);
      //로그인 포인트 넣기
      int      loginPoint(ThisPoint thisPoint);
      //회원 상태 알려주는 로직
      int      state(String user_id_email);
      //자신 닉네임 빼고 중복확인
      int      nickCheckInfo(String user_id_email,String user_nickname);
      //챗봇 1,2,3번 질문 답
      int 		interNum1(String user_id_email);
      int 		interNum2(String user_id_email);
      int 		interNum3(String user_id_email);
      
      User_info user(String user_id_email);
}