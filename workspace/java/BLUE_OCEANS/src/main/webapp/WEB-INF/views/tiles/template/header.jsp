<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="CP" value="${pageContext.request.contextPath}" />
<%@ page session="true"%>
	<html>
	<title>Home</title>
	
		<header>
			<div id="header-box">
				<img alt="" src="${CP}/resources/imgs/logo.png" id="logo">
				<div class="input-group col- flex-nowrap">
					<span class="input-group-text" id="basic-addon1">종목검색</span> <input type="text" class="form-control col-sm-4" placeholder="종목명 또는 종목코드를 입력해주세요." aria-label="Username" aria-describedby="basic-addon1">
					<button id="header-search-btn" class="btn btn-primary">검색</button>
				</div>
				<button class="btn btn-light header-btn" id="boardBtn">토론게시판</button>
				<button class="btn btn-light header-btn" id="favoriteBtn">관심목록</button>
				<button class="btn btn-light header-btn" id="mypageBtn">마이페이지</button>
				<c:choose>
        <c:when test="${not empty sessionScope.user}">
            <button class="btn btn-light header-btn" type="button" id="logout">로그아웃</button>
        </c:when>
        <c:otherwise>
        <button type="button" id="modal-btn" class="btn btn-light header-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">로그인/회원가입</button>
        </c:otherwise>
        </c:choose>
      
      

			</div>
			<!-- Modal -->
			<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button id="signIn" type="button" class="btn btn-secondary">로그인</button>
							<button id="signUp" type="button" class="btn btn-light">회원가입</button>
							<button id="find-id" type="button" class="btn btn-light">ID찾기</button>
							<button id="find-pw" type="button" class="btn btn-light">PW찾기</button>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form>
								<div class='modal-containor'>
									<div>
										<label>아이디</label> <input type='text' class="form-control">
									</div>
									<div>
										<label>비밀번호</label> <input type='text' class="form-control">
									</div>
								</div>
							</form>
						</div>
						<div class="modal-footer">
							<button class='btn btn-primary'>로그인</button>
						</div>
					</div>
				</div>
			</div>
		</header>
		<script>
		$("#logo").on("click",function(){
			window.location.href = "${CP}/BLUEOCEAN/main.do";
		})
		$("#boardBtn").on("click",function(){
			window.location.href = "${CP}/BLUEOCEAN/boardView.do";
		})
		$("#favoriteBtn").on("click",function(){
			window.location.href = "${CP}/BLUEOCEAN/bookmark.do";
		})
		$("#mypageBtn").on("click",function(){
			window.location.href = "${CP}/BLUEOCEAN/mypage.do";
		})
		  $("#logout").on("click",function() {
			  alert(`${sessionScope.user}님 로그아웃?`);
			  
			  $.ajax({
                          type : "POST",
                          url : "/ehr/user/logout.do",
                          asyn : "true",
                          dataType : "html",
                          data : {
                          },
                          success : function(data) {// 통신
                        	  // 성공
                            console.log("data:"+ data);
                          alert("로그아웃 됨");
                          location.reload();
                          },
                          error : function(data) {// 실패시
                                      // 처리
                            console.log("error:"
                                + data);
                          }
                        });
			  
		  });
		</script>
	</html>