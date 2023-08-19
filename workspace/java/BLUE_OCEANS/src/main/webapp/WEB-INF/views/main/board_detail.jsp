<%@ page import="com.pcwk.ehr.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link rel="stylesheet" href="${CP}/resources/css/header.css">
<link rel="stylesheet" href="${CP}/resources/css/footer.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${CP}/resources/js/jquery-3.7.0.js"></script>

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
	      <input type="button" class="btn btn-success" value="수정" id="doUpdate">
	      <input type="button" class="btn btn-success" value="삭제" id="doDelete">
	      <input type="button" class="btn btn-success" value="목록" id="moveToList">
      </div>
    </div>
    
    <!--// 버튼 ----------------------------------------------------------------->
    
    <!-- 내용 (contents)  ------------------------------------------------------------>
    
    <table class="table" class="view" style="width: 1000px;">
		<tr>
			<th>
				<strong>제목 내용 공간</strong>
			</th>
			<th>
				<a>조회수 출력 공간</a>
			</th>
		</tr>
		<tr>
			<th>
				<strong>유저 아이디 출력 공간</strong>
				<td>날짜 출력 공간</td>
			</th>
		</tr>
    </table>
    <br>
    <div class="mb-3" style="width: 1000px;">
	  <label for="exampleFormControlTextarea1" class="form-label"></label>
	  <textarea class="form-control" id="exampleFormControlTextarea1" rows="8" readonly="readonly" placeholder="나중에 내용 (contents) 출력될곳">${boardVO.contents}</textarea>
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
						<a href="#" class="btn btn-sm btn-success" onclick="doDetail();">등록</a>
					</div>
				</form>
			</div>
		</div>
		</div>
</div>		

</body>

<script>

	function moveToListView(){
	    window.location.href="${CP}/BLUEOCEAN/boardView.do?div="+$("#div").val();
	}
	
	$("#moveToList").on("click",function(){
	     console.log("moveToList click");
	     if(confirm('목록 화면으로 이동 하시겠습니까?')==false) return;
	     moveToListView();
	 
	});

</script>

</html>
