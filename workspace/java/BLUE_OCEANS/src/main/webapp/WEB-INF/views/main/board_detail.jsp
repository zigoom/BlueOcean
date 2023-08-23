<%@ page import="com.pcwk.ehr.domain.BoardVO"%>
<%@ page import="com.pcwk.ehr.domain.ReplyVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	  BoardVO vo = (BoardVO)request.getAttribute("outVO");
	  request.setAttribute("vo", vo); // vo 변수를 request 범위에 설정합니다.
      String divValue = vo.getDiv();
      String title = "자유게시판";
      if("20".equals(divValue)) {
        title = "공지사항";
      }
      request.setAttribute("title", title);
%>
<c:set var="CP" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>

<meta charset="${encoding}">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${CP}/resources/css/header.css">
<link rel="stylesheet" href="${CP}/resources/css/footer.css">

<title>토론 상세 게시판</title>

</head>
<body>

	<!-- contents  -->
	<div class="container ">
		<div class="row g-1 d-flex justify-content-center">
			<table class="table">
			</table>
			<!-- 소 제목 -->
			<div class="page-title">
				<h2>${title}</h2>
			</div>

  <!--// 소 제목 end ------------------------------------------------------------->

    <!-- 버튼 -->
    <div class="row g-1 d-flex justify-content-end" style="padding-right: 150px;">
      <div class="col-auto">   
		  
		<c:choose>
			<c:when test="${not empty sessionScope.user}">
			<%
			    // 세션에서 "userType" 값 가져오기
			    String userType = (String) session.getAttribute("user");
				String userId2 = vo.getUserId();
			    // if문으로 조건 처리
			    if ((userType).equals(userId2)) {
			%>
				 <input type="button" class="btn btn-sm btn-primary" value="수정" id="doEdit">
		  		 <input type="button" class="btn btn-sm btn-primary" value="삭제" id="doDelete">
			<% } %>
			</c:when>
		</c:choose>		
	      <input type="button" class="btn btn-sm btn-primary" value="목록" id="moveToList">	      
      </div>
    </div>
    
    <!--// 버튼 ----------------------------------------------------------------->
    
    <!-- 내용 (contents)  ------------------------------------------------------------>
    
	<table class="table view" style="width: 1000px;">
		<tr id="tr1">
			<td align="left"><strong  id="title">${vo.title}</strong></td>
			<td align="right">${vo.readCnt}</td>
			<td></td>
		</tr> 
		<tr id="tr2">
			<td align="left" style="color: gray;">${vo.userId}</td>
			<td align="right" style="color: gray;">${vo.modDt}</td>
			<td><input type="hidden" id="seq" value="${vo.seq}" /></td>
		</tr>
	</table>
	<br>
	<div class="mb-3" style="width: 1000px;">
	  <label for="exampleFormControlTextarea1" class="form-label"></label>
	 <textarea class="form-control" id="contents" rows="8" readonly="readonly">${vo.contents}</textarea>
	</div>


  <!--// 내용 (contents)  ------------------------------------------------------------>
	
<%-- 	<div layout:fragment="content">
	<div  th:object="${board}">
		<h1 class="mt-4" th:text="*{title}"></h1>
		<hr>
		<p th:text="*{content}" /> --%>
		<!-- Comments Form -->
		
		<div class="row g-1 d-flex justify-content-center card my-4" style="width: 1000px;">
			<h5 class="card-header">댓글</h5>
			<div class="card-body">
				<form>
					<div class="form-group">
						<textarea class="form-control" rows="4"></textarea>
					</div>
					<br>
					<div class="d-flex justify-content-end">
						<a href="#" class="btn btn-sm btn-primary" id="addComment">등록</a>
					</div>
				</form>
			</div>
		</div>
		</div>
</div>		

</body>

<script>

	function moveToListView(){
	    window.location.href="${CP}/BLUEOCEAN/boardView.do"
	    //?div="+$("#div").val();
	}
	
	$("#moveToList").on("click",function(){
	     console.log("moveToList click");
	     if(confirm('목록 화면으로 이동 하시겠습니까?')==false) return;
	     moveToListView();
	 
	});

	

	
	  
	// 삭제 버튼 클릭 이벤트 설정
	$("#doDelete").on("click", function() {
	    // 사용자에게 삭제 확인 메시지 표시
	    console.log("doDelete");
	    console.log("seq:"+$("#seq").val());
	    if (confirm('정말로 삭제하시겠습니까?') === false) {
	        return;
	    }
	    // 서버에 삭제 요청을 전달
	    $.ajax({
	        type: "GET", // HTTP 메소드를 설정합니다.
	        url: "/ehr/BLUEOCEAN/doDelete.do", // 요청을 전송할 URL을 설정합니다.
	        datatype : "json",
	        data: {
	            seq: $("#seq").val(), // 삭제할 게시물의 일련 번호 (seq)를 전달합니다.
	            userId : $("#userId").val() 
	        },
	        success: function(response) {
	        	console.log(response);
	            if (response.msgId === "1") {
	                alert(response.msgContents); // 삭제 성공 메시지 표시
	                moveToListView(); // 목록 화면으로 이동
	            } else {
	                alert(response.msgContents); // 삭제 실패 메시지 표시
	            }
	        },
	        error: function(error) { // 요청이 실패하였을 때 실행됩니다.
	            console.error("Error:", error);
	        }
	    });
	});//--doDelete-----------------------------------------------------------
	
	

	function moveToEditView(seq, title, contents){
	    window.location.href="${CP}/BLUEOCEAN/doEdit.do?seq=" + seq + "&title=" + title + "&contents=" + contents;

	    	//?div="+$("#div").val();
	}
	



	
 	$("#doEdit").on("click",function(){
	     console.log("수정 버튼 클릭 click");

	     let seq = document.getElementById("seq").value;
	     let title = document.getElementById("title").textContent;
	     let contents = document.getElementById("contents").textContent;
	     
	     console.log('seq:'+seq);
	     console.log('title:'+title);
	     console.log('contents:'+contents);

	     if(confirm('수정 화면으로 이동 하시겠습니까?')==false) return;
	     
	     moveToEditView(seq, title, contents);
	}); 
	
	


	// 댓글 등록 버튼 클릭 이벤트
	$(document).ready(function() {
	    $("#addComment").click(function() {

	  	    console.log("addComment");
		    //console.log("seq:"+$("#seq").val());
		    
	        if (confirm('댓글을 등록하시겠습니까?') === false) {
	            return;
	        }
	        
	        
	        
	        
	    });
	});
	



    
    
</script>

</html>
