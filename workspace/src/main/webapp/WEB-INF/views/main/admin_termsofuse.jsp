<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<script src="https://code.jquery.com/jquery-3.7.0.js"
			integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
			crossorigin="anonymous"></script>
		<link rel="stylesheet"
			href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="${CP}/resources/css/header.css" />
		<link rel="stylesheet" href="${CP}/resources/css/footer.css" />
		<title>약관관리</title>
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
				margin-left: 120px;
			}
			
			#button-container {
				display: flex;
				justify-content: center;
				margin-left: 120px;
				margin-top: 20px;
				margin-bottom: 20px;
				align-items: center;
			}
			.hstack {
			    display: flex;
			    flex-direction: row;
			    align-items: center;
			    align-self: stretch;
			    justify-content: space-around;
			
			}
			.gap-3 {
			    gap: 0rem !important;
			}
			.mx-5 {
			    margin-right: 1rem!important;
			    margin-left: 35rem!important;
			    t: ;
			}
			.contents {
			    white-space: nowrap; /* 긴 문자열을 한 줄로 유지 */
			    overflow: hidden; /* 넘치는 부분 숨김 */
			    text-overflow: ellipsis; /* 넘치는 부분에 ... 추가 */
			    max-width: 300px; /* 최대 너비 지정 */
			}
			#button-container>* {
				margin-left: 7px;
			}
		</style>
	</head>
	
	<body>
		<div>
			<div id="main-container" style="background-color: white; width: 100%; ">
				<div id="header-container"
					style="background-color: #f1f1f1; height: 200px; border: 1px solid black; display: flex; justify-content: space-between; align-items: center;">
					<div style="margin: 0px 130px;">
						<h1>약관관리</h1>
					</div>
					<div
						style="display: flex; justify-content: center; margin: 0px 70px;">
						<h2 class="admin-header-btn">회원관리</h2>
						<h2 class="divide">|</h2>
						<h2 class="admin-header-btn">게시글관리</h2>
						<h2 class="divide">|</h2>
						<h2 class="admin-header-btn">댓글관리</h2>
						<h2 class="divide">|</h2>
						<h2 class="admin-header-btn"  style="border-bottom: 3px solid black;">약관관리</h2>
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
							</div>
							<div id="body-container">
								<table style="margin-left: 50px;table-layout: fixed; width: 100%" id="data-table">
									<thead>
										<tr>
											<th scope="col" style="text-align: center;"> 순번 </th>
											<th scope="col" style="text-align: center;"> 이용약관 이름 </th>
											<th scope="col" style="text-align: center;"> 이용약관 내용 </th>
											<th scope="col" style="text-align: center;"> 이용약관 등록일자 </th>
										</tr>
									</thead>
									<tbody class="data-tbody">
										
									</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="hstack gap-3 mx-5">
			<div id="pagination" class="mx-auto">
				<!-- 페이지 번호를 동적으로 생성할 영역 -->
			</div>
			<div id="button-container" style="margin-right: 50px">
				<label>제목
					<input type="text" class="search-title">
				</label>
				<button class="btn btn-primary search-title-btn">검색</button>
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
		const dataPerPage = 10;	// 페이지당 보여줄 데이터 
		let currentPage = 1;	// 현재 페이지
		
		
		// 이용약관을 불러오는 함수
		function allLoad() {
			$.ajax({
				type : "POST",
				url : "/ehr/BLUEOCEAN/admin/loadtermsofuse.do",
				async : true,
				dataType : "json",
				data : {},
				success : function(data) {
					totalData = data;
					updateTableWithData(data.slice(0, dataPerPage)); // 첫 페이지 데이터 표시
					createPagination(data.length); 
					console.log(data);
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
		function updateTableWithData(data) { // boardList로 수정
			let tbody = $(".data-tbody");
			tbody.empty();
			data.forEach(function(user, i) {

					let tr = $("<tr class='data-tr'></tr>");
					tr.append("<td class='no'>" + data[i].no + "</td>");
					tr.append("<td class='subject'>" + data[i].subject + "</td>");
					tr.append("<td class='context'>" + data[i].context.substring(0, 10) + "</td>");
					tr.append("<td class='registrationDate'>" + data[i].registrationDate + "</td>");
					

					tbody.append(tr);
			});
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
				button.classList.add("page_nation", "btn", "btn-primary"); // 클래스 추가
				button.style.margin = "5px";
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
			// allLoad 함수 실행
			allLoad();

			// 전체 버튼 클릭 시 다시 데이터 로드
			$("#all-load").on("click", function() {
				allLoad();
			});
		});
		
		// 댓글내용 click시  상세페이지 이동
		$("#data-table>tbody").on("click","tr",
			function(e) {
				console.log("#data-table>tBody");
				let tdArray = $(this).children();
				
				tdArray.each(function(index) {
					console.log('Cell ' + index + ': ' + $(this).text());
				});
				
				let no = tdArray.eq(0).text();
			
				if ($(e.target).hasClass('delete-btn') || $(e.target).hasClass('recover-btn')) {
					// 삭제 버튼 또는 복구 버튼을 클릭한 경우, 상세 페이지로 이동하지 않음
					return;
				}
				
				console.log('no:' + no);
				
				if (confirm("상세 조회 하시겠어요?") == false)
					return;
				
				//div, seq
				window.location.href = "${CP}/BLUEOCEAN/admin/termsofusedetail.do?no="+no
			}
		);
		console.log("!")
		
	</script>
</html>