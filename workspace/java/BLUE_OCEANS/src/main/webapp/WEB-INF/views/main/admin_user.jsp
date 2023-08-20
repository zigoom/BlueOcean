<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}" />
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${CP}/resources/css/header.css" />
<link rel="stylesheet" href="${CP}/resources/css/footer.css" />
<title>Insert title here</title>
<link rel="stylesheet" href="${CP}/resources/css/admin.css" />
</head>
<body>
	<div>
		<div id="main-container"
			style="background-color: white; width: 100%; height: 100vh; margin: 100px 0px;">
			<div id="header-container"
				style="background-color: #f1f1f1; height: 200px; border: 1px solid black; display: flex; justify-content: space-between; align-items: center;">
				<div style="margin: 0px 130px;">
					<h1>회원관리</h1>
				</div>
				<div
					style="display: flex; justify-content: center; margin: 0px 70px;">
					<h2 class="admin-header-btn">회원관리</h2>
					<h2 class="divide">|</h2>
					<h2 class="admin-header-btn">게시글관리</h2>
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
							<label><input type="radio" name="check" value="all"
								id="all-load">전체</label> <label><input type="radio"
								name="check" value="delete" id="delete-load">탈퇴함</label> <label><input
								type="radio" name="check" value="notDelete" id="notDelete-load">탈퇴하지
								않음</label>
						</div>
						<div id="body-container">

							<table
								style="margin-left: 50px; table-layout: fixed; width: 100%"
								id="data-table">
								<thead>
									<tr>
										<th scope="col">아이디</th>
										<th scope="col">이름</th>
										<th scope="col">생년월일</th>
										<th scope="col">성별</th>
										<th scope="col">핸드폰</th>
										<th scope="col">삭제여부</th>
										<th class="delete" scope="col">삭제</th>
										<th class="notDelete" scope="col">복구</th>
									</tr>
								</thead>
								<tbody class="data-tbody">

								</tbody>
							</table>

						</div>
						<div id="pagination"
							style="display: flex; justify-content: center;">
							<!-- 페이지 번호를 동적으로 생성할 영역 -->
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

	let totalData = null;
	const dataPerPage = 10; // 페이지당 보여줄 데이터 수
	let currentPage = 1; // 현재 페이지

	function allLoad() {
		$.ajax({
			type : "POST",
			url : "/ehr/BLUEOCEAN/admin/loadMember.do",
			async : true,
			dataType : "json",
			data : {},
			success : function(data) {
				totalData = data;
				updateTableWithData(data.slice(0, dataPerPage)); // 첫 페이지 데이터 표시
				createPagination(data.length);
			},
			error : function(data) {
				console.log("error:" + data);
			}
		});
	}

	// 페이지 번호를 클릭했을 때 해당 페이지의 데이터를 표시하는 함수
	function showDataForPage(page) {
		currentPage = page;
		const startIndex = (page - 1) * dataPerPage;
		const endIndex = startIndex + dataPerPage;
		updateTableWithData(totalData.slice(startIndex, endIndex));
	}

	// 데이터 테이블 업데이트 함수
	function updateTableWithData(data) {
		// 데이터를 이용해 테이블 업데이트하는 로직을 여기에 작성
	}

	// 페이지 번호를 동적으로 생성하는 함수
	function createPagination(totalDataCount) {
		const totalPages = Math.ceil(totalDataCount / dataPerPage);
		const pagination = document.getElementById("pagination");
		pagination.innerHTML = "";

		for (let i = 1; i <= totalPages; i++) {
			const button = document.createElement("button");
			button.textContent = i;
			button.type = "button";
			button.classList.add("page_nation"); // 클래스 추가

			button.addEventListener("click", function() {
				showDataForPage(i);
			});

			pagination.appendChild(button);
		}

		// 처음 페이지 설정
		showDataForPage(1);
	}

	// 모든 요소가 로드된 후에 실행
	$(document).ready(function() {
		allLoad();

		// 전체 버튼 클릭 시 다시 데이터 로드
		$("#all-load").on("click", function() {
			allLoad();
		});
	});

	// 탈퇴한 회원만 불러오는 함수 
	function deleteOptionLoad() {
		$.ajax({
			type : "POST",
			url : "/ehr/BLUEOCEAN/admin/loadMemberOption.do",
			async : true,
			dataType : "json",
			data : {
				withdrawal : 1
			},
			success : function(data) {
				totalData = data;
				updateTableWithData(data.slice(0, dataPerPage)); // 첫 페이지 데이터 표시
				createPagination(data.length);
			},
			error : function(data) {
				console.log("error:", data);
			}
		});
	}
	// 	탈퇴함 버튼누를시 탈퇴한 회원 전체 불러오기
	$("#delete-load").on("click", deleteOptionLoad)

	//탈퇴하지 않은 회원만 불러오는 함수
	function notDeleteOptionLoad() {
		$.ajax({
			type : "POST",
			url : "/ehr/BLUEOCEAN/admin/loadMemberOption.do",
			async : true,
			dataType : "json",
			data : {
				withdrawal : 0
			},
			success : function(data) {//통신 성공
				totalData = data;
				updateTableWithData(data.slice(0, dataPerPage)); // 첫 페이지 데이터 표시
				createPagination(data.length);
			},
			error : function(data) {//실패시 처리
				console.log("error:" + data);
			}
		});
	}
	$("#notDelete-load").on("click", notDeleteOptionLoad)

	// 테이블 업데이트 함수
	function updateTableWithData(data) { // userList로 수정
		var tbody = $(".data-tbody");
		tbody.empty();
		data
				.forEach(function(user, i) {

					var tr = $("<tr class='data-tr'></tr>");
					tr
							.append("<td class='user-id'>" + data[i].userId
									+ "</td>");
					tr.append("<td class='user-name'>" + data[i].userName
							+ "</td>");
					tr.append("<td class='birthday'>" + data[i].birthday
							+ "</td>");
					tr.append("<td class='gender'>" + data[i].gender + "</td>");
					tr.append("<td class='phone-no'>" + data[i].phoneNo
							+ "</td>");
					tr.append("<td class='withdrawal'>" + data[i].withdrawal
							+ "</td>");
					tr
							.append("<td><button type='button' class='delete-btn'>삭제</button></td>");
					tr
							.append("<td><button type='button' class='recover-btn'>복구</button></td>");

					tbody.append(tr);
				});
	}

	//선택한 회원 삭제
	$(".data-tbody").on("click", ".delete-btn", function() {
		// 클릭한 버튼의 가장 가까운 상위 <tr> 요소를 찾음
		const trElement = $(this).closest("tr");

		// 해당 <tr> 요소 내의 .user-id 요소의 텍스트를 가져옴
		const userId = trElement.find(".user-id").text();

		$.ajax({
			type : "POST",
			url : "/ehr/BLUEOCEAN/admin/deleteMember.do",
			async : true,
			dataType : "html",
			data : {
				userId : userId
			},
			success : function(data) {
				console.log("data:" + data);
				if ($("#all-load").is(":checked")) { //라디오버튼이 전체로 되어있는경우 함수를불러와서 바로 페이지에 변동사항이 나타나도록 적용
					allLoad();
				} else if ($("#delete-load").is(":checked")) { //라디오버튼이 탈퇴함으로 되어있는경우 함수를불러와서 바로 페이지에 변동사항이 나타나도록 적용
					deleteOptionLoad();
				} else if ($("#notDelete-load").is(":checked")) { //라디오버튼이 탈퇴하지않음으로 되어있는경우 함수를불러와서 바로 페이지에 변동사항이 나타나도록 적용
					notDeleteOptionLoad();
				} else {
					allLoad(); //라디오버튼이 아무것도 체크되어있지않은경우 함수를불러와서 바로 페이지에 변동사항이 나타나도록 적용
				}
			},
			error : function(data) {
				console.log("error:" + data);
			}
		});
	});

	//선택한 회원 복구
	$(".data-tbody").on("click", ".recover-btn", function() {
		// 클릭한 버튼의 가장 가까운 상위 <tr> 요소를 찾음
		const trElement = $(this).closest("tr");

		// 해당 <tr> 요소 내의 .user-id 요소의 텍스트를 가져옴
		const userId = trElement.find(".user-id").text();

		$.ajax({
			type : "POST",
			url : "/ehr/BLUEOCEAN/admin/notDeleteMember.do",
			async : true,
			dataType : "html",
			data : {
				userId : userId
			},
			success : function(data) {
				console.log("data:" + data);
				if ($("#all-load").is(":checked")) { //라디오버튼이 전체로 되어있는경우 함수를불러와서 바로 페이지에 변동사항이 나타나도록 적용
					allLoad();
				} else if ($("#delete-load").is(":checked")) { //라디오버튼이 탈퇴함으로 되어있는경우 함수를불러와서 바로 페이지에 변동사항이 나타나도록 적용
					deleteOptionLoad();
				} else if ($("#notDelete-load").is(":checked")) { //라디오버튼이 탈퇴하지않음으로 되어있는경우 함수를불러와서 바로 페이지에 변동사항이 나타나도록 적용
					notDeleteOptionLoad();
				} else {
					allLoad(); //라디오버튼이 아무것도 체크되어있지않은경우 함수를불러와서 바로 페이지에 변동사항이 나타나도록 적용
				}
			},
			error : function(data) {
				console.log("error:" + data);
			}
		});
	});
</script>
</html>
