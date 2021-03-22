package com.oracle.teamTwo.pys.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.oracle.teamTwo.pys.dao.DayDao;
import com.oracle.teamTwo.pys.dao.MyPageDao;
import com.oracle.teamTwo.pys.model.PagePoint;
import com.oracle.teamTwo.teamtwo.model.Challenge;
import com.oracle.teamTwo.teamtwo.model.Follower;
import com.oracle.teamTwo.teamtwo.model.Following;
import com.oracle.teamTwo.teamtwo.model.Part_challenge;
import com.oracle.teamTwo.teamtwo.model.Point;
import com.oracle.teamTwo.teamtwo.model.User_info;

@Service
public class MyPageServiceImpl implements MyPageService {
   
   private final Logger logger = LoggerFactory.getLogger(this.getClass());
   
   @Autowired
   private MyPageDao myPageDao;
   
   @Override
   public List<DayDao> sysdate() {
      List<DayDao> calendar = new ArrayList<DayDao>();
      
      // 오늘 날짜
      Calendar time = Calendar.getInstance();
      
      // 년-월-일 형식
      SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd");
      // 월 형식
      SimpleDateFormat format_MM = new SimpleDateFormat ("M");
      // 일 형식
      SimpleDateFormat format_dd = new SimpleDateFormat ("dd");
      
      // 5일 전으로 설정
      time.add(Calendar.DATE, -5);
      
      // 현재 날짜로 부터 5일전 ~
      // 현재 날짜로 부터 5일후 까지
      // list calendar 입력
      for (int i = 0; i < 11; i ++) {
         DayDao dayDao = new DayDao();
         
         String format_time = format.format(time.getTime());
         String format_time_MM = format_MM.format(time.getTime());
         String format_time_dd = format_dd.format(time.getTime());
         String dayOfTheWeek = day(format_time, "yyyy-MM-dd");
         
         //
         dayDao.setFormat_time(format_time);
         // 월 입력
         dayDao.setMonth(format_time_MM);
         // 일 입력
         dayDao.setDay(format_time_dd);
         // 요일 입력
         dayDao.setWeek(dayOfTheWeek);
         if (dayOfTheWeek == "토" || dayOfTheWeek == "일") {
            dayDao.setHoliday_backgroundcolr("#C55A11");
            dayDao.setHoliday_colr("white");
         } else {
            dayDao.setHoliday_backgroundcolr("white");
            dayDao.setHoliday_colr("black");
         }
         
         if (format_time_MM == "1" && format_time_dd == "02") {
            dayDao.setHoliday_backgroundcolr("#C55A11");
            dayDao.setHoliday_colr("white");
         }
         
         // list calendar 입력
         calendar.add(dayDao);
         
         // 날짜 확인용
//         System.out.println("[날짜 확인 " + i + " ] : " + format_time_dd + " / " + dayOfTheWeek);
         
         // 현재 날짜로 부터 5일전 부터 시작해서
         // 하루 씩 늘리기
         time.add(Calendar.DATE, 1);
      }
      
      return calendar;
      
   }

   @Override
   public String day(String date, String dateType) {
      
//      logger.info("day(String date, String dateType)");
//      logger.info("String date : " + date);
//      logger.info("String dateType : " + dateType);
      
//      Calendar.DAY_OF_WEEK 를 사용하면 해당 날짜에 대한 요일이 숫자로 리턴되는데,
//      일요일부터 토요일까지 1부터 시작해서 순차적으로 나타낸다.
//      아래 예제는 날짜와, 날짜 형식(yyyy-MM-dd)을 받아 해당 요일을 한글로 리턴해주는 코드이다.
      
      String day = "";
      
      try {
         
         SimpleDateFormat dateFormat = new SimpleDateFormat(dateType) ;
         Date nDate = dateFormat.parse(date) ;
         
         Calendar cal = Calendar.getInstance() ;
         cal.setTime(nDate);
         
         int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
         
         switch(dayNum){
           case 1:
               day = "일";
               break ;
           case 2:
               day = "월";
               break ;
           case 3:
               day = "화";
               break ;
           case 4:
               day = "수";
               break ;
           case 5:
               day = "목";
               break ;
           case 6:
               day = "금";
               break ;
           case 7:
               day = "토";
               break ;
           }

      } catch (ParseException e) {
         logger.info(e.getMessage());
      }
      
      return day;
   }

   @Override
   public List<User_info> name(String user_id_email) {
      logger.info("name(String user_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      
      List<User_info> user = new ArrayList<User_info>();
      
      try {
      user = myPageDao.user(user_id_email);
      } catch (Exception e) {
         logger.info("오류 : " + e.getMessage());
      }
      return user;
   }

   @Override
   public String follower(String user_id_email) {
      logger.info("follower(String user_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      
      String follower = "0";
      
      try {
      follower = myPageDao.follower(user_id_email);
      } catch (Exception e) {
         logger.info("오류 : " + e.getMessage());
      }
      
      return follower;
   }

   @Override
   public String following(String user_id_email) {
      logger.info("follower(String user_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      
      String following = "0";
      
      try {
         following = myPageDao.following(user_id_email);
      } catch (Exception e) {
         logger.info("오류 : " + e.getMessage());
      }
      
      return following;
   }

   @Override
   public String point(String user_id_email) {
      logger.info("point(String user_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      
      String point = "0";

      try {
         point = myPageDao.point(user_id_email);
      } catch (Exception e) {
         logger.info("오류 : " + e.getMessage());
      }
      
      return point;
   }

   @Override
   public String ch_success(String user_id_email) {
      logger.info("ch_success(String user_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      
      String ch_success = "0";
      
      try {
         ch_success = myPageDao.ch_success(user_id_email);
      } catch (Exception e) {
         logger.info("오류 : " + e.getMessage());
      }
      
      return ch_success;
   }

   @Override
   public String ch_progress(String user_id_email) {
      logger.info("ch_progress(String user_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      
      String ch_progress = "0";
      
      try {
         ch_progress = myPageDao.ch_progress(user_id_email);
      } catch (Exception e) {
         logger.info("오류 : " + e.getMessage());
      }
      
      return ch_progress;
   }

   @Override
   public String ch_fail(String user_id_email) {
      logger.info("ch_fail(String user_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      
      String ch_fail = "0";
      
      try {
         ch_fail = myPageDao.ch_fail(user_id_email);
      } catch (Exception e) {
         logger.info("오류 : " + e.getMessage());
      }
      
      return ch_fail;
   }

   @Override
   public List<Challenge> challenges(String user_id_email) {
      logger.info("challenges(String user_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      
      List<Challenge> challenges = new ArrayList<Challenge>();
      List<Challenge> challenges2 = new ArrayList<Challenge>();
      
      try {
         challenges = myPageDao.challenges(user_id_email);
         List<DayDao> sysdate = sysdate();

         // 지금 시간
         Calendar now = Calendar.getInstance();
         // 5일 전
         now.add(Calendar.DATE, -5);
         // Calendar -> Date
         Date time = new  Date(now.getTimeInMillis());
         
         Calendar go_5_now = Calendar.getInstance();
         go_5_now.add(Calendar.DATE, 5);
         Date go_5_time = new  Date(go_5_now.getTimeInMillis());
         
         for (int i =0; i < challenges.size(); i ++) {
            
            Date start = challenges.get(i).getChg_startdate();
            Date end = challenges.get(i).getChg_enddate();
            
            System.out.println("start : " + start);
            System.out.println("end : " + end);
            
            if (time.before(end) && go_5_time.after(start)) {
               // 현재 기준 5일 전
               // 챌린지 마지막 날짜 비교
               
               long start_between_end = end.getTime() - start.getTime();
               long end_day_between = start_between_end / (24*60*60*1000);
               long time_between_start = start.getTime() - time.getTime();
               long start_day_between = time_between_start / (24*60*60*1000);
               System.out.println("end_day_between : " + end_day_between);
               System.out.println("start_day_between : " + start_day_between);
               
               Challenge challenge = new Challenge();
               challenge.setChg_title(challenges.get(i).getChg_title());
               challenge.setChg_num(challenges.get(i).getChg_num());
               challenge.setChg_startdate(challenges.get(i).getChg_startdate());
               challenge.setChg_enddate(challenges.get(i).getChg_enddate());
               challenge.setChg_image(challenges.get(i).getChg_image());
               challenge.setEnd_day_between(end_day_between);
               challenge.setStart_day_between(start_day_between);
               
               challenges2.add(challenge);
            }
         }
         
      } catch (Exception e) {
         logger.info("오류 : " + e.getMessage());
      }
      
      return challenges2;
   }
   
   @Override
   public List<Challenge> calendar_master(String user_id_email) {
      logger.info("calendar_master(String user_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      
      List<Challenge> challenges = new ArrayList<Challenge>();
      List<Challenge> challenges2 = new ArrayList<Challenge>();
      
      try {
         challenges = myPageDao.calendar_master(user_id_email);
         List<DayDao> sysdate = sysdate();
         
         // 지금 시간
         Calendar now = Calendar.getInstance();
         // 5일 전
         now.add(Calendar.DATE, -5);
         // Calendar -> Date
         Date time = new  Date(now.getTimeInMillis());
         
         Calendar go_5_now = Calendar.getInstance();
         go_5_now.add(Calendar.DATE, 5);
         Date go_5_time = new  Date(go_5_now.getTimeInMillis());
         
         for (int i =0; i < challenges.size(); i ++) {
            
            Date start = challenges.get(i).getChg_startdate();
            Date end = challenges.get(i).getChg_enddate();
            
            System.out.println("start : " + start);
            System.out.println("end : " + end);
            
            if (time.before(end) && go_5_time.after(start)) {
               // 현재 기준 5일 전
               // 챌린지 마지막 날짜 비교
               
               long start_between_end = end.getTime() - start.getTime();
               long end_day_between = start_between_end / (24*60*60*1000);
               long time_between_start = start.getTime() - time.getTime();
               long start_day_between = time_between_start / (24*60*60*1000);
               System.out.println("end_day_between : " + end_day_between);
               System.out.println("start_day_between : " + start_day_between);
               
               Challenge challenge = new Challenge();
               challenge.setChg_title(challenges.get(i).getChg_title());
               challenge.setChg_num(challenges.get(i).getChg_num());
               challenge.setChg_startdate(challenges.get(i).getChg_startdate());
               challenge.setChg_enddate(challenges.get(i).getChg_enddate());
               challenge.setChg_image(challenges.get(i).getChg_image());
               challenge.setEnd_day_between(end_day_between);
               challenge.setStart_day_between(start_day_between);
               
               challenges2.add(challenge);
            }
         }
         
      } catch (Exception e) {
         logger.info("오류 : " + e.getMessage());
      }
      
      return challenges2;
   }

   @Override
   public void follower_insert(String user_id_email, String page_id_email) {
      logger.info("follower_insert(String user_id_email, String page_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      System.out.println("String page_id_email : " + page_id_email);
      myPageDao.follower_insert(user_id_email, page_id_email);
   }

   @Override
   public void following_insert(String user_id_email, String page_id_email) {
      logger.info("follower_insert(String user_id_email, String page_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      System.out.println("String page_id_email : " + page_id_email);
      myPageDao.following_insert(user_id_email, page_id_email);
   }

   @Override
   public String follow_Did(String user_id_email, String page_id_email) {
      logger.info("ffollow_Did(String user_id_email, String page_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      System.out.println("String page_id_email : " + page_id_email);
      String follow_Did = myPageDao.follow_Did(user_id_email, page_id_email);
      
      if (follow_Did == "0") {
         
      }
      
      return follow_Did;
   }

   @Override
   public void follower_del(String user_id_email, String page_id_email) {
      logger.info("follower_del(String user_id_email, String page_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      System.out.println("String page_id_email : " + page_id_email);
      myPageDao.follower_del(user_id_email, page_id_email);
      
   }

   @Override
   public void following_del(String user_id_email, String page_id_email) {
      logger.info("follower_del(String user_id_email, String page_id_email) start");
      System.out.println("String user_id_email : " + user_id_email);
      System.out.println("String page_id_email : " + page_id_email);
      myPageDao.following_del(user_id_email, page_id_email);
      
   }

   @Override
   public List<Follower> follower_list(String page_id_email) {
      logger.info("follower_list(String page_id_email) start");
      System.out.println("String page_id_email : " + page_id_email);
      
      List<Follower> follower_list = new ArrayList<Follower>();
      follower_list = myPageDao.follower_list(page_id_email);
      return follower_list;
   }

   @Override
   public List<Following> following_list(String page_id_email) {
      logger.info("following_list(String page_id_email) start");
      System.out.println("String page_id_email : " + page_id_email);
      
      List<Following> following_list = new ArrayList<Following>();
      following_list = myPageDao.following_list(page_id_email);
      return following_list;
   }

   @Override
   public List<Point> point_list(String page_id_email) {
      logger.info("point_list(String page_id_email) start");
      System.out.println("String page_id_email : " + page_id_email);
      
      List<Point> points = new ArrayList<Point>();
      points = myPageDao.point_list(page_id_email);
      
      return points;
   }

   @Override
   public String followings_haeseum(String page_id_email, String user_follower) {
      logger.info("followings_haeseum(String page_id_email, String user_follower) start");
      System.out.println("String page_id_email : " + page_id_email);
      System.out.println("String user_follower : " + user_follower);
      
      String followings_haeseum = myPageDao.followings_haeseum(page_id_email, user_follower);
      
      return followings_haeseum;
   }

   @Override
   public List<String> follwer_haeseum(String page_id_email) {
      logger.info("follwer_haeseum(String page_id_email) start");
      System.out.println("String page_id_email : " + page_id_email);
      
      List<String> follwer_haeseum = myPageDao.follower_haeseum(page_id_email);
      
      return follwer_haeseum;
   }

   @Override
   public List<User_info> follower_search(String page_id_email, String follower_scroll) {
      logger.info("follower_search(String page_id_email, String follower_scroll) start");
      System.out.println("String page_id_email : " + page_id_email);
      System.out.println("String follower_scroll : " + follower_scroll);
      
      List<User_info> followers = new ArrayList<User_info>();
      followers =   myPageDao.follower_search(page_id_email, follower_scroll);
      return followers;
   }

   @Override
   public List<User_info> following_search(String page_id_email, String following_scroll) {
      logger.info("following_search(String page_id_email, String following_scroll) start");
      System.out.println("String page_id_email : " + page_id_email);
      System.out.println("String following_scroll : " + following_scroll);
      
      List<User_info> following = new ArrayList<User_info>();
      following =   myPageDao.following_search(page_id_email, following_scroll);
      return following;
   }
   
   
   @Override
   public int total(String user_id_email) {
      int result = myPageDao.total(user_id_email);
      return result;
   }

   @Override
   public List<PagePoint> dhPoint_list(PagePoint pagePoint) {
      List<PagePoint> list = myPageDao.dhPoint_list(pagePoint);
      return list;
   }

   @Override
   public int myPoint(String user_id_email) {
      int result = myPageDao.myPoint(user_id_email);
      return result;
   }

   @Override
   public String follow_page_me(String user_id_email, String page_id_email) {
      String follow_page_me = null;
      follow_page_me = myPageDao.follow_page_me(user_id_email, page_id_email);
      return follow_page_me;
   }

   @Override
   public List<Part_challenge> follwer_challenge(List<Following> following_list) {
      List<Part_challenge> follwer_challenge_list = new ArrayList<Part_challenge>();
      follwer_challenge_list = myPageDao.follwer_challenge(following_list);
      return follwer_challenge_list;
   }

   @Override
   public List<Part_challenge> follwer_challenge_master(List<Following> following_list) {
      List<Part_challenge> follwer_challenge_list = new ArrayList<Part_challenge>();
      follwer_challenge_list = myPageDao.follwer_challenge_master(following_list);
      return follwer_challenge_list;
   }
}