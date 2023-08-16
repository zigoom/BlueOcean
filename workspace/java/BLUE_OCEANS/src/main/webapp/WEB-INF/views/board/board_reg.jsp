<%@page import="com.pcwk.ehr.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>
<%
      BoardVO vo = (BoardVO)request.getAttribute("inVO");
      String divValue = vo.getDiv();
      String title = "자유게시판";
      if("20".equals(divValue)) {
        title = "공지사항";
      }
      request.setAttribute("title", title);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<%-- <script src="${CP}/resources/js/util.js"></script> --%>
<title>글쓰기</title>
</head>
<body>
  <!-- contents  -->
  <div class="container">
  <!-- 소 제목 -->
  <div class="page-title">
    <h2>글쓰기</h2>
  </div>
	<br><br>
    <form action="#"  name="reg_frm" id="reg_frm">
        <input type="hidden" name="div" id="div" value="${inVO.getDiv()}">
        <input type="hidden" name="userId" id="userId" value="사용자ID값">
        <div class="d-flex justify-content-center">
          <label for="exampleFormControlInput1" class="form-label">제목</label>
          <input type="text" class="title_cls" id="title" name="title"
          placeholder="제목을 입력하세요" required="required" maxlength="100" style="width: 1000px;">
        </div>
        	<br><br>
        <div class="d-flex justify-content-center">
          <label for="exampleFormControlTextarea1" class="form-label">내용</label>
          <textarea class="form-control" id="contents" name="contents" required="required" style="width: 1000px; height: 300px;"></textarea>
        </div>
    </form>
  </div>
  <!--// contents  ------------------------------------------------------------>
    <!--// 소 제목 end ------------------------------------------------------------->
 
    <!-- 버튼 -->
    <br><br>
    <div class="row g-1 d-flex justify-content-center">
      <div class="col-auto">
      	<input type="button" class="btn btn-success" value="완료" id="doSave">
        <input type="button" class="btn btn-success" value="취소" id="moveToList">
      </div>
    </div>
    <!--// 버튼 ----------------------------------------------------------------->
  
<script>
   function moveToListView(){
       window.location.href="${CP}/BLUEOCEAN/boardView.do?div="+$("#div").val();
   }
   
   $("#moveToList").on("click",function(){
        console.log("moveToList click");
        if(confirm('목록 화면으로 이동 하시겠습니까?')==false) return;
        moveToListView();
    
   });
   
   $("#doSave").on("click",function(){
       console.log("doSave click");
       //필수 값 : title, contents
       //document.폼이름.input name.value
       let frmTitle = document.reg_frm.title.value;
       console.log("frmTitle:"+frmTitle);
       //input id값으로 값 가지고 오기
       //let sTitle = document.querySelector("#title").value;
       let sTitle = document.querySelector(".title_cls").value;
       //class값으로 값 가지고 오기
       console.log("sTitle:"+sTitle);
       
   /*     if(eUtil.ISEmpty($("#title").val())==true) {
          alert("제목을 입력 하세요.");
          $("#title").focus();
          return;
       } */
/*       if(eUtil.ISEmpty($("#regId").val())==true) {
          alert("등록자를 입력 하세요.");
          $("#regId").focus();
          return;
       } */
   /*     if(eUtil.ISEmpty($("#contents").val())==true){
          alert("내용을 입력 하세요.");
          $("#contents").focus();
          return;
       } */
       
       //confirm
       if(confirm('글을 등록 하시겠습니까')==false) return;
       
       $.ajax({
          type: "POST",
          url:"/BLUEOCEAN/doSave.do",
          asyn:"true",
          dataType:"html",
          data:{
            title: $("#title").val(),
            //userId: $("#userId").val(),
            contents: $("#contents").val(),
            
          },
          success:function(data){//통신 성공
            console.log("success data:"+data);
            let parsedJson = JSON.parse(data);
            //title 미 입력
            if("10" ==parsedJson.msgId){
              alert(parsedJson.msgContents);
                $("#title").focus();
                return;
            }
           
     /*        //등록자 미 입력
             if("10" ==parsedJson.msgId){
               alert(parsedJson.msgContents);
                 $("#userId").focus();
                 return;
             } */
             
             //내용 미 입력
             if("10" ==parsedJson.msgId){
               alert(parsedJson.msgContents);
                 $("#contents").focus();
                 return;
             }
             if("1"==parsedJson.msgId){
                 alert(parsedJson.msgContents);
                 //javascript
                 //window.location.href="${CP}/board/boardView.do?div="+$("#div").val();
                 moveToListView();
                 }else {
                 alert(parsedJson.msgContents);
             }
            },
            error:function(data){//실패시 처리
              console.log("error:"+data);
            }
        });
   });//--doSave
   
   
</script>
</body>
</html>