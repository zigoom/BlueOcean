<%@ page import="com.pcwk.ehr.cmn.StringUtil"%>
<%@ page import="com.pcwk.ehr.domain.BoardVO"%>
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
<link rel="stylesheet" href="${CP}/resources/css/header.css"/>
<link rel="stylesheet" href="${CP}/resources/css/footer.css"/>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>

<title>토론 게시판</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<table class="table">
				<thead class="table-primary">
					<tr>
						<th class="table-success" style="text-align: center;">번호</th>
						<th class="table-success" style="text-align: center;">날짜</th>
						<th class="table-success" style="text-align: center;">제목</th>
						<th class="table-success" style="text-align: center;">글쓴이</th>
						<th class="table-success" style="text-align: center;">조회</th>
					</tr>
				</thead>
				<tbody>
				<c:choose>
				<c:when test="${not empty boardList}">
					<c:forEach items="${boardList}" var="board">
						<tr style="text-align: center;">
							<td>${board.num}</td>
							<td>${board.modDt}</td>
							<td><a href="#" style="color: black; text-decoration: none;">${board.title}</a></td> <!-- ${CP}/detail/${board.title}  -->
							<td>${board.userId}</td>
							<td>${board.readCnt}</td>
						</tr>					
					</c:forEach>	
					</c:when>
					<%-- 조회 데이터가 없는 경우 --%>
          <c:otherwise>
            <tr>
              <td class="text-center" colspan="99">No data found</td>
            </tr>
          </c:otherwise>
        </c:choose>
				</tbody>
			</table>
			<div class="d-flex justify-content-end">
				<a href="#" class="btn btn-sm btn-success" onclick="doMoveToReg();">글쓰기</a> <!--  -->
			</div>
		</div>
	</div>
	</div>
	<!-- <form action="${CP}/search" method="GET">
		<div class="d-flex justify-content-center">
			<input type="text" class="form-control" placeholder="제목을 입력하세요"
				name="searchDiv" style="max-width: 250px;">
			<div class="d-flex justify-content-center">
				<button class="btn btn-sm btn-success" type="submit">검색</button>
			</div>
		</div>
	</form> -->


	<!-- paging  -->

    <div class="d-flex justify-content-center">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		    <li class="page-item">
		      <a class="page-link" href="/BLUEOCEAN/boardView.do?pageNo=<%= pageNo - 1 %>" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
				<%=StringUtil.renderPaging(totalCnt, pageNo, pageSize, bottomCount, "/board/boardView.do", "do_Retrieve")%> 
		    <li class="page-item">
		      <a class="page-link" href="/BLUEOCEAN/boardView.do?pageNo=<%= pageNo + 1 %>" aria-label="Next">
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
          <input type="radio" name="searchDiv" id="searchTitle" value="10" checked>
			<label for="searchTitle">제목</label>
            <c:forEach var="vo" items="${searchList}">
              <option <c:if test="${vo.code == inVO.searchDiv}">selected</c:if> value="<c:out value='${vo.code}'/>">
                 <c:out value= '${vo.codeNm}'/>
              </option>
            </c:forEach>
          </select>
        </div>
        <div class="col-auto">
          <input type="text" name="searchWord" id="searchWord" value="<c:out value = '${inVO.searchWord}'/>" placeholder="제목을 입력하세요" class="form-control" style="width: 250px;">
        </div>
		<div class="col-auto">
        	<a href="#" class="btn btn-sm btn-success" id="doRetrieve">검색</a>
    	</div>
      </div>
   </form>
   <!-- //검색 form end--------------------------------------------------------->
   
	
   
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



   //table 목록 click시  seq값 찾기
/*    $("#boardTable>tbody").on("click","tr", function(e){
     console.log("#boardTable>tBody");
     let tdArray = $(this).children();
     console.log('tdArray:'+tdArray);
     let seq = tdArray.eq(4).text();
     console.log('seq:'+seq);
     if(confirm("상세 조회 하시겠어요?") == false ) return;
		//div, seq
     window.location.href = "${CP}/board/doSelectOne.do?div="+$("#div").val() + "&seq=" + seq;
   }); */
   
   
   function doMoveToReg(){
     console.log("doMoveToReg");
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
     window.alert("doRetrieve");
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
</body>
</html>
