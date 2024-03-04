<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="CP" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="${encoding}" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!-- CSS only -->
		<!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
		<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="${CP}/resources/css/header.css" />
		<link rel="stylesheet" href="${CP}/resources/css/footer.css" />
		<title>약관관리 상세 페이지</title>
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
			margin-right: 1rem !important;
			margin-left: 35rem !important;
			t:;
		}
		
		#button-container>* {
			margin-left: 7px;
		}
		</style>
		
	</head>
		
	<body>
		<div>
			<div id="main-container" style="background-color: white; width: 100%;">
				<div id="header-container" style="background-color: #f1f1f1; height: 200px; border: 1px solid black; display: flex; justify-content: space-between; align-items: center;">
					<div style="margin: 0px 130px;">
						<h1>약관관리</h1>
					</div>
					<div style="display: flex; justify-content: center; margin: 0px 70px;">
						<h2 class="admin-header-btn">회원관리</h2>
						<h2 class="divide">|</h2>
						<h2 class="admin-header-btn">게시글관리</h2>
						<h2 class="divide">|</h2>
						<h2 class="admin-header-btn">댓글관리</h2>
						<h2 class="divide">|</h2>
						<h2 class="admin-header-btn" style="border-bottom: 3px solid black;">약관관리</h2>
						<h2 class="divide">|</h2>
						<h2 class="admin-header-btn">로그확인</h2>
					</div>
				</div>
				<div style="display: flex;">
					<div id="side-container" style="width: 20%; height: 77vh; background-color: #f1f1f1; display: flex; justify-content: center; align-items: center;">
						<h2>BLUEOCEANS</h2>
					</div>
					<div id="admin-container" style="background-color: white; width: 80%; height: 77vh;">
						<!-- contents  -->
						<div class="container ">
							<div class="row g-1 d-flex justify-content-center">
								<div id="body-container"></div>
								<div class="row g-1 d-flex justify-content-end" style="padding-right: 150px;">
									<div class="col-auto">
										<input type="button" class="btn btn-sm btn-primary" value="목록" id="moveToList"> 
										<input type="button" class="btn btn-sm btn-primary" value="수정" id="doEdit"> 
										<input type="button" class="btn btn-sm btn-primary" value="삭제" id="doDelete">
									</div>
								</div>
	
	
								<br>
								<!-- name="contents" : 폼 데이터 전송 시 name 속성으로 지정한 이름으로 데이터가 전송 -->
								<div class="mb-3" style="width: 1000px;">
									<label for="exampleFormControlTextarea1" class="form-label"></label>
									<textarea class="form-control" id="subject" rows="2" name="contents">${result.subject}</textarea>
								</div>
								<div class="mb-3" style="width: 1000px;">
									<label for="exampleFormControlTextarea1" class="form-label"></label>
									<textarea class="form-control" id="context" rows="18" name="contents">${result.context}</textarea>
									<input type="hidden" value="${result.no}" id="no">
								</div>
							</div>
						</div>
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
		
		// 이용약관 페이지 이동 메소드
		function moveTotermsofuse(){
		    window.location.href= "${CP}/BLUEOCEAN/admin/termsofuse.do"
		}
		
		// 목록 버튼 클릭 이벤트 설정
		$("#moveToList").on("click",function(){
		     console.log("moveToList click");
		     if(confirm('목록 화면으로 이동 하시겠습니까?')==false) return;
		     moveTotermsofuse();
		 
		}); 
		
		// 수정 버튼 클릭 이벤트 설정
		$("#doEdit").on("click", function() {
			console.log("doEdit click");
			$.ajax({
				type : "POST",
				url : "/ehr/BLUEOCEAN/admin/termsofuseUpdate.do",
				async : true,
				dataType : "html",
				data : {
					subject : $("#subject").val(),
					context : $("#context").val(),
					no : $("#no").val()
				},
				success : function(data) {
					console.log(data);
					if(data == 1){
						alert("수정되었습니다.")
						moveTotermsofuse();
					}
				},
				error : function(data) {
					console.log("error:" + data);
				}
	
			})
		})
		
		// 삭제 버튼 클릭 이벤트 설정
		$("#doDelete").on("click", function() {
		    // 사용자에게 삭제 확인 메시지 표시
		    console.log("doDelete");
		    console.log("no:"+$("#no").val());
		    if (confirm('정말로 삭제하시겠습니까?') === false) {
		        return;
		    }
		    // 서버에 삭제 요청을 전달
		    $.ajax({
		        type: "POST", // HTTP 메소드를 설정합니다.
		        url: "/ehr/BLUEOCEAN/admin/termsofuseDelete.do", // 요청을 전송할 URL을 설정합니다.
		        async : true,
				dataType : "html",
		        data: {
		            no: $("#no").val(), // 삭제할 게시물의 일련 번호 (no)를 전달합니다. 
		        },
		        success: function(response) {
		        	console.log(response);
		            if (response == "1") {
		            	alert("게시글 삭제 성공"); // 삭제 성공 메시지 표시
		            	moveTotermsofuse();
		            } else {
		            	alert("게시글 삭제 실패"); // 삭제 실패 메시지 표시
		            }
		        },
		        error: function(error) { // 요청이 실패하였을 때 실행됩니다.
		            console.error("Error:", error);
		        }
		    });
		});
	</script>

</html>
