<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2th55rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${CP}/resources/css/header.css" />
<link rel="stylesheet" href="${CP}/resources/css/footer.css" />
<title>Insert title here</title>
<link rel="stylesheet" href="${CP}/resources/css/admin.css"/>
</head>
<body>
	<div>
		<div id="main-container"
			style="background-color: white; width: 100%; height: 100vh; margin: 100px 0px;">
			<div id="header-container"
				style="background-color: #f1f1f1; height: 200px; border: 1px solid black; display: flex; justify-content: space-between; align-items: center;">
				<div style="margin: 0px 130px;">
					<h1>게시글관리</h1>
				</div>
				<div
					style="display: flex; justify-content: center; margin: 0px 70px;">
					<h2 class="admin-header-btn">회원관리</h2>
					<h2 class="divide">|</h2>
					<h2 class="admin-header-btn" style="border-bottom: 3px solid black;">게시글관리</h2>
					<h2 class="divide">|</h2>
					<h2 class="admin-header-btn">댓글관리</h2>
					<h2 class="divide">|</h2>
					<h2 class="admin-header-btn">약관관리</h2>
					<h2 class="divide">|</h2>
					<h2 class="admin-header-btn">로그확인</h2>
				</div>
			</div>
			<div style="display: flex;">
				<div id="side-container"
					style="width: 20%; height: 77vh; background-color: #f1f1f1; display: flex; justify-content: center; align-items: center;">
					<h2>BLUEOCEANS</h2>
				</div>
				<div id="admin-container"
					style="background-color: white; width: 80%; height: 77vh;">
					<form>
						<div id="radio-container" style="margin: 30px 100px;">
							<label><input type="radio" name="check" value="all">전체글</label>
							<label><input type="radio" name="check" value="delete">삭제된
								글</label> <label><input type="radio" name="check"
								value="notDelete">삭제되지 않은글</label>
						</div>
						<div id="body-container">

							<table style="margin-left: 50px;table-layout: fixed; width: 100%">
								<tr>
									<th scope="col">제목</th>
									<th scope="col">아이디</th>
									<th scope="col">조회수</th>
									<th scope="col">등록일</th>
									<th scope="col">삭제여부</th>
									<th scope="col">삭제</th>
									<th scope="col">복구</th>
								</tr>
								<tr>
									<td>A-팀 프로젝트222222222222222222222222222222222222222222222222222222222</td>
									<td>test1234</td>
									<td>24</td>
									<td>2023-08-18</td>
									<td>삭제됨</td>
									<td>삭제</td>
									<td>복구</td>
								</tr>

								<tr>
									<td>자전거 동호회</td>
									<td>test12</td>
									<td>21</td>
									<td>2023-08-18</td>
									<td>삭제되지않음</td>
									<td>삭제</td>
									<td>복구</td>
								</tr>
							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${CP}/resources/js/header-main.js"></script>
<script src="${CP}/resources/js/util.js"></script>
<script>
	let adminHeaderBtn = document.querySelectorAll(".admin-header-btn");
	adminHeaderBtn[0].addEventListener("click", function() {
		window.location.href = "${CP}/BLUEOCEAN/admin/user.do";
	})
	adminHeaderBtn[1].addEventListener("click", function() {
		window.location.href = "${CP}/BLUEOCEAN/admin/board.do";
	})
	adminHeaderBtn[2].addEventListener("click", function() {
		window.location.href = "${CP}/BLUEOCEAN/admin/reply.do";
	})
	adminHeaderBtn[3].addEventListener("click", function() {
		window.location.href = "${CP}/BLUEOCEAN/admin/termsofuse.do";
	})
	adminHeaderBtn[4].addEventListener("click", function() {
		window.location.href = "${CP}/BLUEOCEAN/admin/log.do";
	})
</script>
</html>
