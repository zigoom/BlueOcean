<%@ page import="com.pcwk.ehr.cmn.StringUtil"%>
<%@ page import="com.pcwk.ehr.domain.BoardVO"%>
<%@ page import="com.pcwk.ehr.domain.ReplyVO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
     BoardVO vo = (BoardVO)request.getAttribute("inVO");
      String divValue = vo.getDiv();
    String title    = "자유게시판"; //10 : 자유게시판, 20 : 공지사항
    if("20".equals(divValue)){
      title = "공지사항";
    }
    request.setAttribute("title", title);   
    
    //paging
    //(int maxNum, int currPageNO, int rowPerPage, int bottomCount, String url. String s)
    
    int bottomCount = 10;
    int pageSize    = 10;
    int pageNo      =  1;
    int totalCnt    =  0;
    
    String searchWord = "";
    String searchDiv  = "";
    
     if(null != vo){
    	 pageSize = vo.getPageSize();
    	 pageNo   = vo.getPageNo();
    	 /* searchDiv = vo.getSearchDiv(); */
    	 searchWord = vo.getSearchWord();    	
    } 
    
    if(null != request.getAttribute("totalCnt")){
    	totalCnt = Integer.parseInt(request.getAttribute("totalCnt").toString());
    }
    
    String cPath = request.getContextPath();
    
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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${CP}/resources/css/header.css">
<link rel="stylesheet" href="${CP}/resources/css/footer.css">

</head>

<body>
<div class="container">
	<div class="row">		
	    <div style="padding-left: 110px; padding-right: 110px; margin-bottom: -15px;" >
		    <h1 class="login-heading mb-4" style="margin-top: 18px;"> &nbsp;&nbsp;&nbsp;&nbsp;<b>토론게시판</b></h1>
            <hr class="my-1"><br>	        
            <table class="table" id="boardTable" style="width: 1000px; margin: 0 auto;">
                <thead class="table-primary">
                    <tr>
                        <th class="table-primary" style="text-align: center; width: 5%;">번호</th>
                        <th class="table-primary" style="text-align: center; width: 15%;">날짜</th>
                        <th class="table-primary" style="text-align: center; width: 40%;">제목</th>
                        <th class="table-primary" style="text-align: center; width: 15%;">글쓴이</th>
                        <th class="table-primary" style="text-align: center; width: 5%;">조회</th>
                        <th style="display:none;">DIV</th>
                    </tr>
                </thead>
                <tbody>
                   <c:choose>
	                   <c:when test="${not empty boardList}">
		                   <c:forEach items="${boardList}" var="board">
		                        <tr style="text-align: center;">
		                            <td>${board.num}</td>
		                            <td>${board.modDt}</td>
		                            <td><a href="#" style="color: black; text-decoration: none;">${board.title} </a></td> <!-- href는 수정 필요  -->
		                            <td>${board.userId}</td>
		                            <td>${board.readCnt}</td>
		                            <td style="display:none;"><c:out value="${board.seq}"/></td>  
		                        </tr>                   
		                    </c:forEach>    
	                    </c:when>
                    <%-- 조회 데이터가 없는 경우 --%>
			           <c:otherwise>
			            <tr>
			              <td class="text-center" colspan="99">찾는 제목이 없습니다</td>
			            </tr>
			           </c:otherwise>
		           </c:choose>
                </tbody>
            </table>
            </br>
	    </div> 
        <div class="d-flex justify-content-end">
            <a href="#" class="btn btn-sm btn-primary" style="margin: 5px 150px 0 0;" onclick="doMoveToReg();">글쓰기</a>
        </div>
	</div>
	
	<!-- paging  -->
	<div class="d-flex justify-content-center">
	    <nav aria-label="Page navigation example">
	        <ul class="pagination">
	            <!-- 맨 처음 페이지로 이동 -->
	            <li class="page-item">
	                <a class="page-link" href="/ehr/BLUEOCEAN/boardView.do?pageNo=1" aria-label="First">
	                    <span aria-hidden="true">&laquo;</span>
	                </a>
	            </li>
	            <!-- 이전 페이지로 이동 -->
	            <li class="page-item">
	                <a class="page-link" href="/ehr/BLUEOCEAN/boardView.do?pageNo=<%= pageNo - 1 %>" aria-label="Previous">
	                    <span aria-hidden="true">&lt;</span>
	                </a>
	            </li>
	            <%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, "/ehr/BLUEOCEAN/boardView.do", "do_Retrieve")%>
	            <!-- 다음 페이지로 이동 -->
	            <li class="page-item">
	                <a class="page-link" href="/ehr/BLUEOCEAN/boardView.do?pageNo=<%= pageNo + 1 %>" aria-label="Next">
	                    <span aria-hidden="true">&gt;</span>
	                </a>
	            </li>
	            <!-- 맨 마지막 페이지로 이동 -->
	            <li class="page-item">
	                <a class="page-link" href="/ehr/BLUEOCEAN/boardView.do?pageNo=<%= (int) Math.ceil((double) totalCnt / pageSize) %>" aria-label="Last">
	                    <span aria-hidden="true">&raquo;</span>
	                </a>
	            </li>
	        </ul>
	    </nav>
	</div>
    <!--// paging --------------------------------------------------------------->
	<!-- 검색 form -->
	 <form class="d-flex justify-content-center" action="${CP}/BLUEOCEAN/boardView.do" method="get" name="boardFrm">
	   <input type="hidden" name="pageNo" id="pageNo">
	   <input type="hidden" name="div"    id="div" value='${inVO.getDiv()}'>
	    <div class="row g-1 d-flex justify-content-end">
	     <div class="col-auto">
	       
	         <c:forEach var="vo" items="${searchList}">
	           <option <c:if test="${vo.code == inVO.searchDiv}">selected</c:if> value="<c:out value='${vo.code}'/>">
	              <c:out value= '${vo.codeNm}'/>
	           </option>
	         </c:forEach>
	       
	     </div>
	     <div class="col-auto">
	       <input type="text" name="searchWord" id="searchWord" value="<c:out value = '${inVO.searchWord}'/>" placeholder="제목을 입력하세요" class="form-control" style="width: 250px;">
	     </div>
	     <div class="col-auto" style="padding: 4px; margin-left: 5px">
	         <a href="#" class="btn btn-sm btn-primary" id="doRetrieve">&nbsp;검색&nbsp;</a>
	     </div>
	   </div>
	</form>
	<br><br>
	<!-- //검색 form end--------------------------------------------------------->
</div>
<script>
   function do_Retrieve(url, pageNo){
	   console.log("url:"+url);
	   console.log("pageNo:"+pageNo);
	   let frm = document.boardFrm;
	   $("pageNo").val(1); //jquery
	   frm.action = url;
	   frm.pageNo.value=pageNo; //javascript
	   frm.submit(); //controller call 
   }

   // table 목록 click시  seq값 찾기
     $("#boardTable>tbody").on("click","tr", function(e){
     console.log("#boardTable>tBody");
     let tdArray = $(this).children();
     tdArray.each(function(index) {
         console.log('Cell ' + index + ': ' + $(this).text());
     });
     let seq = tdArray.eq(5).text();
     let userId = tdArray.eq(3).text();
     console.log('seq:'+seq);
     if(confirm("상세 조회 하시겠어요?") == false ) return;
		//div, seq
     window.location.href = "${CP}/BLUEOCEAN/doSelectOne.do?&seq=" + seq + "&userId=" + userId;
   });   
   
   
   function doMoveToReg(){
     console.log("글쓰기 doMoveToReg");
     let frm = document.boardFrm;
     //$("#pageNo").val(1); //jquery
     console.log("frm.div.value"+frm.div.value);
     //frm.div.value = pageNo; //javascript
     frm.pageNo.value = 1;
     frm.action = "${CP}/BLUEOCEAN/doMoveToReg.do";
     frm.submit(); //controller call
	 }
   
   
   function doRetrieveCall(pageNo) {
     let frm = document.boardFrm;
     //$("pageNo").val(1); //jquery
     frm.pageNo.value=pageNo; //javascript
     frm.submit(); //controller call
   }
   
   $("#searchWord").on("keypress", function(e){
     console.log("searchWord");
     
     if(13 == e.which) {
       e.preventDefault();
       doRetrieveCall(1);
     }
   });
   
   $("#doRetrieve").on("click",function(){
     console.log("doRetrieve");
     //window.alert("doRetrieve");
     doRetrieveCall(1);
   });
   
   $("#regBtn").on("click",function(){
     let frm = document.boardFrm;
     //$("pageNo").val(1); //jquery
     //frm.div.value=pageNo; //javascript
     frm.pageNo.value=1;
     frm.action = "${CP}/BLUEOCEAN/doMoveToReg.do"
     frm.submit(); //controller call
   });
    
</script> 
<script src="${CP}/resources/js/header-main.js"></script>
<script src="${CP}/resources/js/util.js"></script>

</body>
</html>
