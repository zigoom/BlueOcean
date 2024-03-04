<%@page import="com.pcwk.ehr.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.URLDecoder" %>
<c:set var="CP" value="${pageContext.request.contextPath }"/>
<%
      BoardVO vo = (BoardVO)request.getAttribute("outVO");
      String divValue = vo.getDiv();
      //String title = "자유게시판";
      if("20".equals(divValue)) {
        //title = "공지사항";
      }
     // request.setAttribute("title", title);
%>
<%
    String seq = request.getParameter("seq");
    String title = URLDecoder.decode(request.getParameter("title"), "UTF-8");
    String contents = URLDecoder.decode(request.getParameter("contents"), "UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>
<%-- <script src="${CP}/resources/js/util.js"></script> --%>
<link rel="stylesheet" href="${CP}/resources/css/header.css">
<link rel="stylesheet" href="${CP}/resources/css/footer.css">

<title>글쓰기</title>
</head>
<body>
<div class="container">
    <div class="row">       
        <div style="padding-left: 110px; padding-right: 110px; margin-bottom: -15px;" >
            <h1 class="login-heading mb-4" style="margin-top: 18px;"> &nbsp;&nbsp;&nbsp;&nbsp;<b>게시글 수정</b></h1>
            <hr class="my-1"><br>     
        </div>
        <form action="#"  name="reg_frm" id="reg_frm"> <br><br>
			<input type="hidden" name="div" id="div" value="${inVO.getDiv()}">
			<input type="hidden" name="userId" id="userId" value="사용자ID값">
			<div class="d-flex justify-content-center">
			  <label for="exampleFormControlInput1" class="form-label" style="margin-right : 10px;"><strong>제목</strong></label>
			  <input type="text" class="title_cls" id="title" name="title" placeholder="제목을 입력하세요" required="required" maxlength="100" style="width: 900px;" value="<%= title %>">
			</div> <br><br>
			<div class="d-flex justify-content-center">
			  <label for="exampleFormControlTextarea1" class="form-label"  style="margin-right : 10px;"><strong>내용</strong></label>
			  <textarea class="form-control" id="contents" name="contents" required="required" style="width: 900px; height: 300px;"><%= contents %></textarea>
			  <input type="hidden" id="modDt" value="${outVO.modDt}" />
			  <input type="hidden" id="seq" value="${outVO.seq}" />
			  <input type="hidden" id="outVOuserId" value="${outVO.userId}" />
			</div>
		</form>
    <!-- 버튼 -->
    <br><br>
    <div class="row g-1 d-flex justify-content-center" style="margin-bottom : 20px; margin-top: 20px">
      <div class="col-auto">
        <input type="button" class="btn btn-primary" value="&nbsp;수정&nbsp;" id="doUpdate">&nbsp;&nbsp;
        <input type="button" class="btn btn-primary" value="&nbsp;취소&nbsp;" id="moveToList">
      </div>
    </div><br><br><br>
    <!--// 버튼 ----------------------------------------------------------------->
    </div>
    <br><br>
</div>


  <%-- <!-- contents  -->
  <div class="container">
  <!-- 소 제목 -->
  <div class="page-title">
    <h1 class="login-heading mb-4">&nbsp;&nbsp;&nbsp;&nbsp;<b>게시글 수정 페이지</b></h1>
    <div style="margin-bottom: 50px;"><hr class="mb-6"></div>
  </div>
	<br><br>
  <form action="#"  name="reg_frm" id="reg_frm">
    <input type="hidden" name="div" id="div" value="${inVO.getDiv()}">
    <input type="hidden" name="userId" id="userId" value="사용자ID값">
    <div class="d-flex justify-content-center">
      <label for="exampleFormControlInput1" class="form-label" style="margin-right : 10px;"><strong>제목</strong></label>
      <input type="text" class="title_cls" id="title" name="title"
      placeholder="제목을 입력하세요" required="required" maxlength="100" style="width: 900px;" value="<%= title %>">
    </div>
    <br><br>
    <div class="d-flex justify-content-center">
      <label for="exampleFormControlTextarea1" class="form-label"  style="margin-right : 10px;"><strong>내용</strong></label>
      <textarea class="form-control" id="contents" name="contents" required="required" style="width: 900px; height: 300px;"><%= contents %></textarea>
      <input type="hidden" id="modDt" value="${outVO.modDt}" />
      <input type="hidden" id="seq" value="${outVO.seq}" />
 	  <input type="hidden" id="outVOuserId" value="${outVO.userId}" />
      <input type="hidden" id="title" value="${vo.title}" />
      <input type="hidden" id="contents" value="${vo.contents}" />  
    </div>
</form>
  </div>
  <!--// contents  ------------------------------------------------------------>
    <!--// 소 제목 end ------------------------------------------------------------->
 
    <!-- 버튼 -->
    <br>
    <div class="row g-1 d-flex justify-content-center" style="margin-bottom : 20px;">
      <div class="col-auto">
      	<input type="button" class="btn btn-sm btn-primary" value="수정" id="doUpdate">
        <input type="button" class="btn btn-sm btn-primary" value="취소" id="moveToList">
        
      </div>
    </div>
    <!--// 버튼 ----------------------------------------------------------------->
   --%>
<script>
   function moveToListView(seq, userId){
	   window.location.href = "${CP}/BLUEOCEAN/doSelectOne.do?seq=" + seq + "&userId=" + userId;

       //window.location.href="${CP}/BLUEOCEAN/boardView.do"
    	   //http://localhost:8080/ehr/BLUEOCEAN/doSelectOne.do?&seq=94&userId=asdf
    	   //?div="+$("#div").val();
   }
   
   $("#moveToList").on("click",function(){
        console.log("moveToList click");
        
        let seq = $("#seq").val();
        let userId = $("#outVOuserId").val();
        
/* 	     let seq = document.getElementById("seq").value;
	     let userId = document.getElementById("outVOuserId").value; */
	     
	     console.log('seq:'+seq);
	     console.log('userId:'+userId);

	     
        if(confirm('상세 게시판으로 이동 하시겠습니까?')==false) return;
        
        moveToListView(seq, userId);
    
   });
   
	
   
   
	$(document).ready(function() {
	    $("#doUpdate").click(function() {
		    console.log("doUpdate");
		    
 		    let seq = document.getElementById("seq").value;
		    let title = document.getElementById("title").textContent;
		    let contents = document.getElementById("contents").textContent; 
		    let userId = document.getElementById("outVOuserId").value;  
		    //document.getElementById("userId").textContent; 
		    
		    console.log("seq"+seq);
		    console.log("title"+title);
		    console.log("contents"+contents);
		    console.log('userId : '+ userId);
		    

           const textarea01 = $("#title").val()
           const textarea02 = $("#contents").val()
          
           if (textarea01.length > 30) {
               alert("제목은 15자 까지만 가능합니다.");
               return;
           }
           if (textarea02.length > 500) {
               alert("내용은 500자 까지만 가능합니다.");
               return;
           }
		    
		    
	        if (confirm('수정하시겠습니까?') === false) {
	            return;
	        }

	        $.ajax({
	            type: "POST",
	            url: "${CP}/BLUEOCEAN/doUpdate.do",
	            data: {
	            	seq: $("#seq").val(),
	                title: $("#title").val(),
	                contents: $("#contents").val(),
	                userId: $("#userId").val()
	            },
	            success: function(response) {
	            	alert("게시글 수정 성공");
	                window.location.href="${CP}/BLUEOCEAN/doSelectOne.do?&seq=" + seq + "&userId=" + userId;
	            },
	            error: function(xhr, status, error) {
	            	console.error("Error:", error);
	            }
	        });
	    });
	});
   


   
</script>




<script src="${CP}/resources/js/header-main.js"></script>
<script src="${CP}/resources/js/util.js"></script>
</body>
</html>