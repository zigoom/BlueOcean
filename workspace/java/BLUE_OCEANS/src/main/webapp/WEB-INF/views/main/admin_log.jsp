<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="${encoding}" />
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${CP}/resources/css/header.css" />
<link rel="stylesheet" href="${CP}/resources/css/footer.css" />
<title>Insert title here</title>
<link rel="stylesheet" href="${CP}/resources/css/admin.css" />
<style>
#body-container {
	max-width: 100%; /* 최대 너비 설정 */
	max-height: 70vh; /* 최대 높이 설정 */
	overflow-y: auto; /* 스크롤 활성화 */
	overflow-x: hidden; /* 가로스크롤 비활성화 */
}

#data-table {
	margin-left: 50px;
	table-layout: fixed;
	width: 100%;
}

/* 미디어 쿼리를 사용하여 화면 너비에 따라 스타일 변경 */
@media screen and (max-width: 768px) {
	#data-table {
		margin-left: 0; /* 작은 화면에서는 왼쪽 마진 제거 */
	}
}

#pagination {
	margin-left: 170px;
}

#button-container {
	display: flex;
	justify-content: center;
	margin-left: 120px;
	margin-top: 20px;
	margin-bottom: 20px;
	align-items: center;
}

#button-container>* {
	margin-left: 7px;
}

.hstack {
	display: flex;
	flex-direction: row;
	align-items: center;
	align-self: stretch;
	justify-content: center;
	margin-left: 150px;
}

.gap-3 {
	gap: 0rem !important;
}

.mx-5 {
	margin-right: 1rem !important;
	margin-left: 25rem !important;
	padding-top: 17px;
	padding-bottom: 20px;
	height: 100px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.level != 0}">
			<script>
				alert("접근할 수 없습니다.")
				window.location.href = "${CP}/BLUEOCEAN/main.do"
			</script>
		</c:when>
		<c:otherwise>
			<div>
				<div id="main-container" style="background-color: white; width: 100%; ">
					<div id="header-container" style="background-color: #f1f1f1; height: 200px; border: 1px solid black; display: flex; justify-content: space-between; align-items: center;">
						<div style="margin: 0px 130px;">
							<h1>로그확인</h1>
						</div>
						<div style="display: flex; justify-content: center; margin: 0px 70px;">
							<h2 class="admin-header-btn">회원관리</h2>
							<h2 class="divide">|</h2>
							<h2 class="admin-header-btn">게시글관리</h2>
							<h2 class="divide">|</h2>
							<h2 class="admin-header-btn">댓글관리</h2>
							<h2 class="divide">|</h2>
							<h2 class="admin-header-btn">약관관리</h2>
							<h2 class="divide">|</h2>
							<h2 class="admin-header-btn" style="border-bottom: 3px solid black;">로그확인</h2>
						</div>
					</div>
					<div style="display: flex;">
						<div id="side-container" style="width: 20%; height: 77vh; background-color: #f1f1f1; display: flex; justify-content: center; align-items: center;">
							<h2>BLUEOCEANS</h2>
						</div>
						<div id="admin-container" style="background-color: white; width: 80%; height: 77vh;">
							<div id="radio-container" style="margin: 30px 100px;">
								<label>발생일자<input type="date" class="date-input"></label> <label>~<input type="date" class="date-input"></label> <label>아이디<input type="text" class="search-id"></label> <input type="button" class="btn btn-primary search-id-btn" value="조회">
								<input type="button" value="초기화" class="btn btn-primary reset-btn"> 
							</div>

							<div id="body-container">

								<table class="table table-hover" style="table-layout: fixed; width: 98.5%; margin-left: 10px;" id="data-table">
									<thead>
										<tr>
											<th scope="col">아이디</th>
											<th scope="col">발생시간</th>
											<th scope="col">로그이름</th>
											<th scope="col">로그내용</th>
										</tr>
									</thead>
									<tbody class="data-tbody">

									</tbody>
								</table>

							</div>

						</div>

					</div>
					<div class="hstack mx-5">
						<div id="pagination" class="mx-auto">
							<!-- 페이지 번호를 동적으로 생성할 영역 -->
						</div>

					</div>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
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
	const pagesPerGroup = 10; // 페이지 그룹 당 보여줄 페이지 수

	function allLoad() {
		$.ajax({
			type : "POST",
			url : "/ehr/BLUEOCEAN/admin/loadLog.do",
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
	  const endIndex = Math.min(startIndex + dataPerPage, totalData.length);
	  updateTableWithData(totalData.slice(startIndex, endIndex));
	  updatePagination();
	}
	
	// 이전 페이지 그룹으로 이동
	function goToPreviousGroup() {
	  const targetGroup = Math.max(Math.ceil(currentPage / pagesPerGroup) - 1, 1);
	  const targetPage = (targetGroup - 1) * pagesPerGroup + 1;
	  showDataForPage(targetPage);
	}
	
	// 다음 페이지 그룹으로 이동
	function goToNextGroup() {
		const totalPages = Math.ceil(totalData.length / dataPerPage);
		const targetGroup = Math.min(Math.ceil(currentPage / pagesPerGroup) + 1, Math.ceil(totalData.length / dataPerPage / pagesPerGroup));
	  const targetPage = (targetGroup - 1) * pagesPerGroup + 1;
	  showDataForPage(targetPage);
	}
	
	// 페이지 번호와 이전/다음 버튼을 업데이트하는 함수
	function updatePagination() {
	  const totalPages = Math.ceil(totalData.length / dataPerPage);
	  const currentGroup = Math.ceil(currentPage / pagesPerGroup);
	  const pagination = document.getElementById("pagination");
	  pagination.innerHTML = "";

	  const startPage = (currentGroup - 1) * pagesPerGroup + 1;
	  const endPage = Math.min(startPage + pagesPerGroup - 1, totalPages);

	  for (let i = startPage; i <= endPage; i++) {
	    const button = document.createElement("button");
	    button.textContent = i;
	    button.type = "button";
	    button.classList.add("page_nation", "btn", "btn-primary");
	    button.style.margin = "5px";
	    button.addEventListener("click", function() {
	      showDataForPage(i);
	    });

	    pagination.appendChild(button);
	  }
	  
	// 이전 버튼 추가
	  if (startPage > 1) {
	    const previousButton = document.createElement("button");
	    previousButton.textContent = "이전";
	    previousButton.type = "button";
	    previousButton.classList.add("page_nation", "btn", "btn-primary");
	    previousButton.style.margin = "5px";
	    previousButton.addEventListener("click", goToPreviousGroup);

	    pagination.insertBefore(previousButton, pagination.firstChild);
	  }
	// 다음 버튼 추가
	  if (endPage < totalPages) {
	    const nextButton = document.createElement("button");
	    nextButton.textContent = "다음";
	    nextButton.type = "button";
	    nextButton.classList.add("page_nation", "btn", "btn-primary");
	    nextButton.style.margin = "5px";
	    nextButton.addEventListener("click", goToNextGroup);

	    pagination.appendChild(nextButton);
	  }
	}
	// 초기 페이지 설정
	function initializePagination() {
	  updatePagination();
	  showDataForPage(currentPage);
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

	    // 현재 페이지가 속한 페이지 그룹 계산
	    const currentGroup = Math.ceil(currentPage / pagesPerGroup);

	    // 현재 페이지 그룹의 첫 번째 페이지 계산
	    const startPage = (currentGroup - 1) * pagesPerGroup + 1;
	    
	    // 현재 페이지 그룹의 마지막 페이지 계산
	    const endPage = Math.min(startPage + pagesPerGroup - 1, totalPages);

	    for (let i = startPage; i <= endPage; i++) {
	      const button = document.createElement("button");
	      button.textContent = i;
	      button.type = "button";
	      button.classList.add("page_nation", "btn", "btn-primary");
	      button.style.margin = "5px";
	      button.addEventListener("click", function() {
	        showDataForPage(i);
	      });
        
        pagination.appendChild(button);
       }  
    
		    // 처음 페이지 설정
		    showDataForPage(startPage);
		  }
	// 모든 요소가 로드된 후에 실행
	$(document).ready(function() {
		allLoad();
	});

	// 테이블 업데이트 함수
	function updateTableWithData(data) { // userList로 수정
		let tbody = $(".data-tbody");
		tbody.empty();
		data.forEach(function(user, i) {

			let tr = $("<tr class='data-tr'></tr>");
			tr.append("<td class='user-id'>" + data[i].userId + "</td>");
			tr.append("<td class='log-date'>" + data[i].logDate + "</td>");
			tr.append("<td class='log1'>" + data[i].log1 + "</td>");
			tr.append("<td class='log2'>" + data[i].log2 + "</td>");

			tbody.append(tr);
		});
	}

	$(".search-id-btn")
			.on(
					"click",
					function() {
						let dateInput = document
								.querySelectorAll(".date-input");
						if ((dateInput[0].value == '')
								&& (dateInput[1].value == '')) {
							$.ajax({
								type : "POST",
								url : "/ehr/BLUEOCEAN/admin/loadLogFromId.do",
								async : true,
								dataType : "json",
								data : {
									userId : $(".search-id").val()
								},
								success : function(data) {
									totalData = data;
									updateTableWithData(data.slice(0,
											dataPerPage)); // 첫 페이지 데이터 표시
									createPagination(data.length);

								},
								error : function(data) {
									console.log("error:" + data);
								}
							})
						} else if ((dateInput[0].value == '')
								|| (dateInput[1].value == '')) {
							alert("발생일자를 모두 입력해주세요.");
						} else if (!((dateInput[0].value == '') && (dateInput[1].value == ''))
								&& ($(".search-id").val() == '')) {
							
							$.ajax({
								type : "POST",
								url : "/ehr/BLUEOCEAN/admin/loadLogOption.do",
								async : true,
								dataType : "json",
								data : {
									startDate : dateInput[0].value + " 00:00:00",
									endDate : dateInput[1].value + " 23:59:59"
								},
								success : function(data) {
									totalData = data;
									updateTableWithData(data.slice(0,
											dataPerPage)); // 첫 페이지 데이터 표시
									createPagination(data.length);

								},
								error : function(data) {
									console.log("error:" + data);
								}

							})
						} else {
							$
									.ajax({
										type : "POST",
										url : "/ehr/BLUEOCEAN/admin/loadLogOptionFromId.do",
										async : true,
										dataType : "json",
										data : {
											startDate : dateInput[0].value + " 00:00:00",
											endDate : dateInput[1].value + " 23:59:59",
											userId : $(".search-id").val()
										},
										success : function(data) {
											totalData = data;
											updateTableWithData(data.slice(0,
													dataPerPage)); // 첫 페이지 데이터 표시
											createPagination(data.length);

										},
										error : function(data) {
											console.log("error:" + data);
										}

									})
						}

					})
					$(".reset-btn").on("click",function(){
						allLoad();
						document.querySelectorAll(".date-input")[0].value = null
						document.querySelectorAll(".date-input")[1].value = null
					})
</script>
</html>
