<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/teamtwo/jstl_jquery_ajax.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>할수있다람쥐</title>
<meta charset="UTF-8">
<style type="text/css">
@font-face {
   font-family: 'ChosunGu';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/ChosunGu.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

textarea {
   width: 100%;
   height: 200px;
   padding: 10px;
   box-sizing: border-box;
   border: solid 2px #9f6e54;
   border-radius: 5px;
   font-size: 16px;
   resize: both;
}

.button_01_write {
    background-color: #444230;
    color: white;
    border: none;
    border-radius: 8px;
    width: 60px;
    margin: 10px;
    width: 120px;
    height: 50px;
    font-family: ChosunGu;
    font-size: 18px;
}

.button_02_write {
   background-color: white;
    color: #444230;
    border: 2px solid #444230;
    border-radius: 8px;
    width: 60px;
    margin: 10px;
    width: 120px;
    height: 50px;
    font-family: ChosunGu;
    font-size: 18px;
}

.table_write {
   background-color: palegoldenrod;
   width: 90%;
   border-collapse: collapse;
   margin: 0 auto;
   font-family: ChosunGu;
   border-radius: 30px 30px 0px 0px;
}

.table_tr_write {
   font-family: ChosunGu;
   height: 40px;
}

.ck-editor__editable {
   min-height: 400px;
}

.ck.ck-editor {
   max-width: 100%;
}

#writeForm {
   font-family: S-CoreDream-3Light;
}

#title {
   width: 30%;
   font-family: 'ChosunGu';
   font-size: 15px;
   height: 25px;
   border: 1px solid rgb(81, 85, 67);
   border-radius: 5px;
   padding: 5px;
}
</style>
<script type="text/javascript" src="/resource/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
   function sizeCheck(){
      var size = document.getElementById("file").files[0].size;
      if(size > 1024 * 1024 * 2){
         alert("2MB 이하의 파일만 등록 가능합니다. 현제 사진용량 : "+(Math.round(size / 1024 / 1024 * 100) / 100) + 'MB');
         $("input[id=file]").val("");
      }else return;
   }
   function chk(){
      var text1= confirm("작성을 취소하시겠습니까?");
      if(text1 == true){
         history.back();
      }else{
         return;
      }
   }

</script>
</head>
<body>

   <div style="height: 70px; margin: 0 0 15px 0;">
  		<%@ include file="/WEB-INF/views/teamtwo/header.jsp"%>
   </div>
   
   
<div style="width: 100%; min-width:1650px;  height: 100%;  text-align: center;  ">
   <div style="width: 95%; height: 100%; text-align: center; ">
         <h2 style="    font-family: 'yg-jalnan'; text-align: left; font-size: 40px; margin-left: 10%; position: relative; left: -50px; color: #444230;">글쓰기</h2>
         <form id="writeForm" action="write_insert" method="post" target="myBatisFrame" enctype="multipart/form-data">
            <table class="table_write">
               
               <tr class="table_tr_write">
                  <th>카테고리</th>
                  <td>
                     <select name="b_c_num" style="font-family: 'ChosunGu'; font-size: 15px; width: 110px; height: 25px; border: 1px solid rgb(81, 85, 67); border-radius: 5px;">
                        <option value="1">자유게시판</option>
                        <option value="2">정보공유</option>
                        <option value="3">챌린지홍보</option>
                     </select>
                  </td>
               </tr>
               
               <tr class="table_tr_write">
                  <th>제목</th>
                  <td><input type="text" id="title" name="title" placeholder="제목을 작성하세요(~21자)" required="required" ></td>
               </tr>
               <tr class="table_tr_write">
                  <th>첨부파일</th>
                  <td><input type="file" name="file" id="file" onchange="sizeCheck();" style="font-family: 'ChosunGu'; font-weight: bold;"></td>
                  
               </tr>
            </table><br>
               <input type="hidden" name="path" value="${pageContext.request.contextPath}/upload/cmuIMG/"> 
            
<!--ckEditor 사용  -->
            <div style="width: 90%; margin: 0 auto;">
            <textarea name="content" id="editor" ></textarea>
                 <script> 
                ClassicEditor 
                .create( document.querySelector( '#editor' ),{
                   removePlugins: [ 'ImageUpload'],
                   language : 'ko'
                } ) 
                .then( editor => { 
                    console.log( editor ); 
                } ) 
                .catch( error => { 
                    console.error( error ); 
                } );
                </script>
            </div>
            <br><br>
            <div style="float: right; width: 33%; position: relative; left: 48px; bottom: 30px;">
            
               <input type="hidden" name="user_id_email" value="${user_model.user_id_email }">
               <input type="hidden" name="user_nickname" value="${user_model.user_nickname }">
               
               <input type="submit" value="등록" class="button_01_write">
               <input type="button" value="취소"  class="button_02_write" onclick="chk();">
               
            </div>   
         </form>
      </div>
   </div>
   
   <div>
<%@ include file="/WEB-INF/views/teamtwo/footer.jsp" %>
</div>
   
</body>
</html>