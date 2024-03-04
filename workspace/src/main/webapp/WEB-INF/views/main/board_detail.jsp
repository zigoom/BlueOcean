<%@ page import="com.pcwk.ehr.domain.BoardVO"%>
<%@ page import="com.pcwk.ehr.domain.ReplyVO"%>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
      
      List<ReplyVO> replyList = (List<ReplyVO>) request.getAttribute("replyList");
      ReplyVO replyVO = (ReplyVO)request.getAttribute("replyVO");
      request.setAttribute("replyVO", replyVO);
      
%>



<c:set var="CP" value="${pageContext.request.contextPath }" />
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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${CP}/resources/css/header.css">
<link rel="stylesheet" href="${CP}/resources/css/footer.css">

<title>토론 상세 게시판</title>

</head>
<body>

<div class="container">
    <div class="row">       
       <div style="padding-left: 110px; padding-right: 110px; margin-bottom: -15px;" >
            <h1 class="login-heading mb-4" style="margin-top: 18px;"> &nbsp;&nbsp;&nbsp;&nbsp;<b>상세 게시판</b></h1>
            <hr class="my-1"><br>   
       </div>
       <!--// 소 제목 end ------------------------------------------------------------->

            <!-- 버튼 -->
            <div class="row g-1 d-flex justify-content-end" style="padding-right: 150px; margin-top: 20px;">
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
                            <input type="button" class="btn btn-sm btn-primary" value="  수정  " id="doEdit">
                            <input type="button" class="btn btn-sm btn-primary" value="  삭제  " id="doDelete">
                            <% } %>
                        </c:when>
                    </c:choose>
                    <input type="button" class="btn btn-sm btn-primary" value="  목록  " id="moveToList">
                </div>
            </div>
            <!--// 버튼 ----------------------------------------------------------------->
            <!-- 내용 (contents)  ------------------------------------------------------------>
            <div class="row g-1 d-flex justify-content-end" style="padding-right: 150px;">
	            <table class="table view" style="width: 1000px;">
	                <tr id="tr1">
	                    <td align="left"><span>제목 : </span><strong id="title">${vo.title}</strong></td>
	                    <td align="right"><span>조회수 : </span>${vo.readCnt}</td>
	                </tr>
	                <tr id="tr2">
	                    <input type="hidden" id="seq" value="${vo.seq}" />
	                    <td align="left" style="color: gray;">
	                    <span>아이디 : </span>
	                    <span id="userId">${vo.userId}</span>
	                    </td>
	                    <td align="right" style="color: gray;"><span>날짜 :  </span>${vo.modDt}</td>
	                    
	                </tr>
	            
	            </table>
	            <br>
	            <div class="mb-3" style="width: 1000px;">
	                <label for="exampleFormControlTextarea1" class="form-label"></label>
	                <textarea class="form-control" id="contents" rows="8"
	                    readonly="readonly">${vo.contents}</textarea>
	            </div>
            </div>
            <!--// 내용 (contents) ------------------------------------------------------------>            
            <div class="row g-1 d-flex justify-content-end" style="padding-right: 150px;">
	            <!-- 댓글  ------------------------------------------------------------>
	            <div class="row g-1 d-flex justify-content-center card my-4"
	                style="width: 1000px;">
	                <h5 class="card-header">댓글</h5>
	                <div class="card-body">
	                    <form>
	                        <div class="form-group">
	                            <textarea class="form-control" rows="4" id="addcontents"></textarea>
	                        </div>
	                        <br>
	                        <div class="d-flex justify-content-end">
	                            <a href="#" class="btn btn-sm btn-primary" id="addComment">등록</a>
	                        </div>
	                    </form>
	                </div>
	            </div>
            </div>            
            <div class="row g-1 d-flex justify-content-end" style="padding-right: 150px;">
	            <c:choose>
	            <c:when test="${not empty replyList}">
	            <c:forEach items="${replyList}" var="reply">
	                <table class="row g-1 d-flex justify-content-center card my-4" style="width: 1000px;" class="replyTable">
	                            <tbody>
	                                <tr>
	                                    <td style="text-align: left; font-size: 20px; width: 1000px;">&nbsp;${reply.userId}</td>
	                                    <td><input type="hidden" class="commentNo" value="${reply.commentNo}" /></td>
	                                </tr>
	                                <tr>
	                                    <td style="text-align: left; font-size: 15px;">&nbsp;${reply.modDt}</td>
	                                </tr>
	                                <tr>
	                                    <td style="text-align: left; font-size: 22px;">
	                                    <div class="replyContentDisplay">&nbsp;${reply.contents}</div>
	                                    
	                                    <!-- 수정 폼 (기본적으로 숨겨져 있음) -->
	                                    <div class="editForm" style="display:none;">
	                                    <textarea class="form-control editTextarea" rows="3">${reply.contents}</textarea>
	                                    
	                                    <a href="#" class="btn btn-sm btn-primary saveEdit">저장</a>
	                                </tr>
	                                <tr>
	                                    <td style="text-align: right;">
	                                        <div class="card-body">
	                                        <c:if test="${sessionScope.user == reply.userId}">
	                                            <a href="#" class="btn btn-sm btn-primary replydoUpdate">수정</a>
	                                            <a href="#" class="btn btn-sm btn-primary replydoDelete">삭제</a>
	                                        </c:if>
	                                        </div>
	                                    </td>
	                                </tr>
	                            </tbody>
	                        </table>
	                    </c:forEach>
	                </c:when>
	            </c:choose>
            </div>
            <!-- 댓글 end  ------------------------------------------------------------>
    </div>
</div>


	<!-- contents  -->
	<!-- <div class="container ">
		<div class="row g-1 d-flex justify-content-center">
			<table class="table">
			</table>
			소 제목
			<div class="page-title">
				<h1 class="login-heading mb-4">&nbsp;&nbsp;&nbsp;&nbsp;<b>상세 게시판</b></h1>
				<div style="margin-bottom: 50px;"><hr class="mb-6"></div>
			</div>

			
		</div>
	</div> -->

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
	            	alert("게시글 삭제 성공"); // 삭제 성공 메시지 표시
	                moveToListView(); // 목록 화면으로 이동
	            } else {
	            	alert("게시글 삭제 실패"); // 삭제 실패 메시지 표시
	            }
	        },
	        error: function(error) { // 요청이 실패하였을 때 실행됩니다.
	            console.error("Error:", error);
	        }
	    });
	});//--doDelete-----------------------------------------------------------
	
	
	
	function moveToEditView(seq, userId, title, contents){
		
	    window.location.href="${CP}/BLUEOCEAN/doEdit.do?seq=" + seq + "&userId=" + userId + "&title="  + title + "&contents=" + contents;

	    	//?div="+$("#div").val();
	}
	
	
 	$("#doEdit").on("click",function(){
	     console.log("수정 버튼 클릭 click");

	     let seq = document.getElementById("seq").value;
	     let userId = document.getElementById("userId").textContent;
	     let title = document.getElementById("title").textContent;
	     let contents = document.getElementById("contents").textContent;
	     
	     console.log('seq:'+seq);
	     console.log('userId:'+userId);
	     console.log('title:'+title);
	     console.log('contents:'+contents);

	     if(confirm('수정 화면으로 이동 하시겠습니까?')==false) return;
	     
	     moveToEditView(seq, userId, title, contents);
	}); 
	
	

////////////     위에는 게시판 관련 버튼 기능      /////////////////









////////////     아래는 댓글 관련 버튼 기능       //////////////////
 	
 	


	// 댓글 등록 버튼 클릭 이벤트     reply addComment 
	$(document).ready(function() {
		$("#addComment").click(function() {
			
			console.log("댓글 등록 버튼 클릭");
			
			let seq = document.getElementById("seq").value;
			let addcontents = document.getElementById("addcontents").value;
			
			console.log("seq : "+ seq);
			console.log("addcontents : "+ addcontents);
			
           if (addcontents.length > 150) {
               alert("제목은 150자 까지만 가능합니다.");
               return;
           }

			if (confirm('댓글을 등록하시겠습니까?') === false) {
				return;
			}

			// 서버에 댓글 저장 요청을 전달
			$.ajax({
				type : "GET", // HTTP 메소드를 설정합니다.
				url : "/ehr/BLUEOCEAN/doReplySave.do", // 요청을 전송할 URL을 설정합니다.
				datatype : "json",
				data : {
					postNo :   $("#seq").val(), 
					userId :   $("#userId").val(),
					contents : $("#addcontents").val(),
					modDt  :   $("#modDt").val()
				},
				success : function(response) {
					console.log(response);
					if (response.msgId === "1") {
						alert("댓글 등록 성공"); // 성공 메시지 표시
						
						location.reload();    		 // 화면 새로고침
						
					} else {
						alert("댓글 등록 실패"); // 실패 메시지 표시
					}
				},
				error : function(error) { // 요청이 실패하였을 때 실행됩니다.
					console.error("Error:", error);
				}

			});
		});

	});
	//--reply addComment  end    -----------------------------------------------------------
	
	
	
	
	// 댓글 삭제 버튼 클릭 이벤트 설정
	$(".replydoDelete").on("click", function() {
	    
	    console.log("댓글 삭제 버튼 클릭");
	    
	    let commentNo = $(this).closest('tbody').find('.commentNo').first().val();
	    
	    console.log("commentNo:", commentNo);
	    
	    if (confirm('정말로 삭제하시겠습니까?') === false) {
	        return;
	    }
	    
	    // 서버에 삭제 요청을 전달
	    $.ajax({
	        type: "GET", // HTTP 메소드를 설정합니다.
	        url: "/ehr/BLUEOCEAN/doReplyDelete.do", // 요청을 전송할 URL을 설정합니다.
	        dataType : "json",
	        data: {
	        	commentNo: commentNo,
	        	contents : $("#contents").val()
	        },
	        success: function(response) {
	        	
	        	console.log(response);
	        	
	            if (response.msgId === "1") {
	            	
	                alert("댓글 삭제 성공"); // 댓글 삭제 성공 메시지 표시
	                
	                location.reload();			 // 화면 새로고침해서 댓글 삭제 확인
	                
	                
	            } else {
	            	alert("댓글 삭제 실패"); //댓글 삭제 실패 메시지 표시
	            }
	        },
	        error: function(error) { // 요청이 실패하였을 때 실행됩니다.
	            console.error("Error:", error);
	        }
	    });
	});//--reply doDelete end -----------------------------------------------------------
	
	

	
	
	// 댓글 수정 버튼을 클릭했을 때의 동작
	$(".replydoUpdate").on("click", function() {
		event.preventDefault(); 
		
		// 현재 댓글의 내용 숨기기
	    $(this).closest('tbody').find('.replyContentDisplay').hide();
	    
	    // 현재 댓글의 수정 폼 보이기
	    $(this).closest('tbody').find('.editForm').show();
	    $(this).closest('tbody').find('.editForm').focus();
	});

	// 수정 폼에서 '저장' 버튼을 클릭했을 때의 동작
	$(".saveEdit").on("click", function() {
	    let commentNo = $(this).closest('tbody').find('.commentNo').first().val();
	    
	    // 수정된 내용 가져오기
	    let contents = $(this).siblings('.editTextarea').val();
	    
	    if (confirm('수정하시겠습니까?') === false) {
	        return;
	    }
	    
	    // 서버에 수정 요청을 전달
	    $.ajax({
	        type: "POST",
	        url: "/ehr/BLUEOCEAN/doReplyUpdate.do",
	        dataType : "json",
	        data: {
	        	commentNo: commentNo,
	        	contents : contents,
	        },
	    	success : function(data) {
	    		console.log("success data:" + data);
	    		alert("댓글 수정 성공");
	    		location.reload();
	    		
	    	},
	    	error : function(data) {
	    		alert("댓글 수정 실패");
	    		console.log("error:" + data);
	    	}
	    });
	});
	//--reply doUpdate end -----------------------------------------------------------


	
	
	
</script>
<script src="${CP}/resources/js/header-main.js"></script>
<script src="${CP}/resources/js/util.js"></script>

</html>
