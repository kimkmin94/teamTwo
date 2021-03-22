<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할수있다람쥐</title>
<link href="hj/css/community.css?ver=2" rel="stylesheet">
<style type="text/css">
@font-face {
   font-family: 'ChosunGu';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

@font-face {
   font-family: 'yg-jalnan';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

.table_comm {
   width: 90%;
   border-collapse: collapse;
   margin: 0 auto;
   font-family: ChosunGu;
   font-size: 30px;
   border-radius: 30px 30px 0px 0px;
}

.nav {
   width: 86%;
   border-collapse: collapse;
   margin: 0 auto;
   font-family: ChosunGu;
   font-size: 30px;
   background-color: #9f6e54;
   height: 50px;
   border-radius: 10px;
   font-family: yg-jalnan;
}

.table_th_comm {
   background-color: palegoldenrod;
   text-align: center;
   height: 80px;
   font-size: 20px;
}

.table_tr_comm {
    color: black;
    border-bottom: 2px solid white;
    text-align: center;
    height: 50px;
    font-size: 20px;
    background-color: #FBF5EC;
}

.button_01_comm {
   background-color: #515543;
    color: white;
    border: none;
    border-radius: 8px;
    width: 120px;
    height: 50px;
    font-family: ChosunGu;
    font-size: 18px;
    position: relative;
    top: -35px;
    right: -65px;
}

.button_02_comm {
   background-color: #515543;
    color: white;
    border: none;
    border-radius: 8px;
    width: 80px;
    height: 40px;
    font-family: ChosunGu;
    font-size: 16px;
    position: relative;
    bottom: -2px;
}

.listbutton {
   font-family: 'yg-jalnan';
    text-decoration: none;
    margin-left: 50px;
    margin-bottom: 25px;
    background-color: #ffffff00;
    outline: 0;
    border: 0;
    cursor: pointer;
    font-size: 20px;
    color: rgb(81, 85, 67);
}

.listDa:hover {
   color: black;
}

.listbutton:hover {
   color: black;
}

body {
   margin: 0px auto;
   padding: 0px;
}

.aTag {
   text-decoration: none;
   color: black;
   cursor: pointer;
}

.aTag:hover {
   color: #9f6e54;
}

.paging{
   text-decoration: none;
    color: black;
    font-size: 20px;
    font-family: 'ChosunGu';
    font-weight: bold;
    position: relative;
    bottom: 120px;
}

.paging:hover{
   color: #9f6e54;
}
</style>
</head>
<body>

   <div style="height: 70px; margin: 0 0 15px 0;">
   		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
   </div>
   
<div style="width: 100%; min-width:1650px;    text-align: center;  ">
   <div style="width: 95%; text-align: center;  margin-bottom: 18%;">
      <form method="post" style="height: 140px;" >
      <h2 style="font-family: 'yg-jalnan'; text-align: left; font-size: 40px; margin-left: 10%; position: relative; left: -10px; color: #444230;">커뮤니티</h2>
      <div style="width: 95%">
         <input type="button" class="listbutton"    onclick="location.href='community'"          name="b_c_num" value="전체보기">
         <input type="button" class="listbutton"    onclick="location.href='community?b_c_num=1'" name="b_c_num" value="자유게시판">
         <input type="button" class="listbutton"    onclick="location.href='community?b_c_num=2'" name="b_c_num" value="정보공유">
         <input type="button" class="listbutton"    onclick="location.href='community?b_c_num=3'" name="b_c_num" value="챌린지홍보">
      </div>
      </form>   
      <form action="" style="margin: 2%;" method="post" name="form" id="form" >
         
         <table class="table_comm">
            <thead>
               <tr class="table_th_comm" >
                  <th style="border-radius: 30px 0 0 0;">번호</th>
                  <th>카테고리</th>
                  <th>제목</th>
                  <th>작성자</th>
                  <th>날짜</th>
                  <th>조회수</th>
                  <th style="border-radius: 0 30px 0 0;">추천수</th>
               </tr>
            </thead>
            
            <tbody>
               <c:forEach var="list" items="${commList}">
              <c:if test="${total > 0  }">
               <tr class="table_tr_comm">
                  <td class="table_td_comm">${list.b_num}</td>
                  <td class="table_td_comm">[${list.b_subject}]</td>
                  <%-- <td class="table_td_comm">
                     <a href="cmu_detail?b_num=${list.b_num}" onclick="javascript:location.href='form'">${list.b_title}</a>
                  </td> --%>
                  <td class="table_td_comm">
                     <a href="cmu_detail?b_num=${list.b_num}" class="aTag">${list.b_title}</a>
                  </td>
                  <td class="table_td_comm">
                     <a href="mypage?user_id_email=${user_model.getUser_id_email()}&page_id_email=${list.b_id_email}&user_nickname=${user_model.getUser_nickname()}&user_image=${user_model.getUser_image()}" class="aTag">${list.b_nickname}</a>
                  </td>
                  <td class="table_td_comm">
                  <fmt:formatDate value="${list.b_regdate }" pattern="yyyy/MM/dd"/></td>
                  <td class="table_td_comm">${list.b_view_count }</td>
                  <td class="table_td_comm"> <input type="text" value="❤ " style="color: red; border: none;background-color: #FBF5EC; width: 20px;" onclick="none" readonly="readonly" > ${list.b_like_count }</td>
               </tr>
               </c:if>
               </c:forEach>
               <c:if test="${total == 0 }">
                  <tr class="table_tr_comm">
                     <td colspan="7" class="table_td_comm">게시글이 없습니다</td>
                  </tr>
               </c:if>
            </tbody>      
         </table>
      </form>
      <br>
      <div style="float: right; width: 30%; ">
         <form action="writeForm" method="post" style="">
         <button class="button_01_comm">글쓰기</button>
         
         </form>
      </div>
      <br>
      <br>
      <div style="width: 39%; text-align: center; margin-left: 30%; position: relative; top: 40px;">
         <form action="search" method="post" style="display: inline; width: 50%; height: 100px;">
            <select style="height: 40px; font-family: 'ChosunGu'; font-weight: bold;" name="search_option">
               <option value="b_title"  <c:if test="${condition eq 'title' }">selected</c:if>>제목</option>
               <option value="b_nickname" <c:if test="${condition eq 'writer'}">selected</c:if>>작성자</option>
            </select>
            <!--로그인  -->
            <input type="text" name="keyword" placeholder="검색하세요" style="height: 40px; width: 300px; font-family: 'ChosunGu'; padding: 5px;">
            <input type="submit" class="button_02_comm" name="" value="찾기" >
            
            
         </form>
      </div>
      <br>
      <form method="post">
      <c:if test="${b_c_num == null }">
         <div style="width: 100%; text-align: center;">
            <div style="display: inline; width: 50%; height: 100px;">
               <c:if test="${page.startPage > page.pageBlock }">
                  <a href="list?currentPage=${page.startPage-page.pageBlock}" class="paging">[이전]</a>
               </c:if>
               <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
                  <a href="community?currentPage=${i}" class="paging">[${i}]</a>
               </c:forEach>
               <c:if test="${page.endPage < page.totalPage }">
                  <a href="community?currentPage=${page.startPage+page.pageBlock}" class="paging">[다음]</a>
               </c:if>
         </div>
      </div>
   </c:if>
      <c:if test="${b_c_num != null }">
         <div style="width: 100%; text-align: center;">
            <div style="display: inline; width: 50%; height: 100px;">
               <c:if test="${page.startPage > page.pageBlock }">
                  <a href="list?b_c_num=${b_c_num}&currentPage=${page.startPage-page.pageBlock}" class="paging">[이전]</a>
               </c:if>
               <c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
                  <a href="community?b_c_num=${b_c_num}&currentPage=${i}" class="paging">[${i}]</a>
               </c:forEach>
               <c:if test="${page.endPage < page.totalPage }">
                  <a href="community?b_c_num=${b_c_num}&currentPage=${page.startPage+page.pageBlock}" class="paging">[다음]</a>
               </c:if>
            </div>
         </div>
   </c:if>
   
   </form>
</div>
</div>

<div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
</body>
</html>