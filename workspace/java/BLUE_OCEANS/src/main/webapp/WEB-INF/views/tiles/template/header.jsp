
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="CP" value="${pageContext.request.contextPath}" />
<%@ page session="true"%>
<html>
<title>Home</title>
<style>
ul {
	max-height: 200px;
	overflow-y: auto;
}
</style>
<header>
    <div id="header-box" style="padding: 0px 180px 0px 180px;">
        <img alt="" src="${CP}/resources/imgs/logo.png" id="logo" style="margin-right: 5px; padding: 5px;">
        <div class="search-box input-group col-flex-nowrap">
			<span class="input-group-text" id="basic-addon1">종목검색</span>
			<input id="word" type="text" class="form-control col-sm-4" placeholder="종목명 또는 종목코드를 입력해주세요." aria-label="Username" aria-describedby="basic-addon1">
			<button id="header-search-btn" style="" class="btn btn-primary">검색</button>
		</div>
		<button class="btn btn-light header-btn" id="boardBtn">토론게시판</button>
		<button class="btn btn-light header-btn" id="favoriteBtn">관심목록</button>
         
		<c:choose>
			<c:when test="${not empty sessionScope.user}">
			  <button class="btn btn-light header-btn" id="mypageBtn">마이페이지</button>
			  <span class="input-group-text" id="basic-addon1">${sessionScope.user}님</span>
				<button class="btn btn-light header-btn" type="button" id="logout">로그아웃</button>
        <c:choose>
            <c:when test="${sessionScope.level == 0}">
                <button class="btn btn-light header-btn" id="adminBtn">관리자 페이지</button>              
            </c:when>
        </c:choose>
			</c:when>
			<c:otherwise>
				<button type="button" id="modal-btn" class="btn btn-light header-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">로그인/회원가입</button>
			</c:otherwise>
		</c:choose>
	</div>

    <div id="search-results" style="overflow: auto; max-height: 200px; padding: 0px 180px 0px 180px; display: flex; justify-content: flex-end;" class="col-flex-nowrap">
        <c:choose>
            <c:when test="${sessionScope.level == 0}">
                <p> <a href="http://125.142.47.191:5001/">파이썬 서버</a>
                <br>
                <a>DB IP:125.142.47.191:1521</a>
                </p>
            </c:when>
        </c:choose>
		<ul id="related-searches"></ul>
	</div>


	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button id="signIn" type="button" class="btn btn-secondary">로그인</button>
					<button id="signUp" type="button" class="btn btn-light">회원가입</button>
					<button id="find-id" type="button" class="btn btn-light">ID찾기</button>
          <button id="find-pw" type="button" class="btn btn-light">PW초기화</button>
					<button id="agree" type="button" class="btn btn-light" hidden="">동의</button>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class='modal-containor'>
							<div>
								<label>아이디</label>
								<input type='text' class="form-control">
							</div>
							<div>
								<label>비밀번호</label>
								<input type='text' class="form-control">
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
		


		
		$(document).ready(function() {
					   $("#adminBtn").on("click", function() {
		            console.log('어드민');
		              window.location.href = "${CP}/BLUEOCEAN/admin/user.do"; // 여기에 실제 관리자 페이지의 URL을 넣어주세요 
		          });
			     
             $("#word").autocomplete({
              source: function(request, response) {
                  let keyword = request.term; // 입력된 검색어 가져오기
                  if (keyword.trim() !== "") {
                      let requestData = {
                          name: keyword
                      };
          //----------ajax----------
                  $.ajax({
                      type: "POST",
                      url: 'http://125.142.47.191:5001/blue-oceans/search-stocks-list',
                      data: JSON.stringify(requestData),
                      contentType: 'application/json',
                      success: function(data) {
                        let autocompleteData = [];
                        data.data.forEach(function(data) {
                            autocompleteData.push({
                                label: data.Name + ' (' + data.Code + ')',
                                value: data.Name,
                                code: data.Code
                            });
                        });
                        // response 함수를 호출하여 검색 결과를 출력합니다.
                        response(autocompleteData);
                      
                      },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log("error:" + errorThrown);
                    }
          
                  });
          //----------ajax end----------
                  
              }
                    else {
                    response([]);
                    }
              },             
            
            minLength: 2, // 최소 입력 길이
            select: function(event, ui) {
						itemname = ui.item.value;
						itemcode = ui.item.code;

                      //----------ajax----------
                  $.ajax({
                      type: "GET",
                      url: '/ehr/BLUEOCEAN/detail.do',
			                async: true,
			                dataType: 'html',                      
                      data: {
      	                  stockName: itemname,
                          stockCode: itemcode,
                      },
                      success: function(data) {
                        window.location.href = '/ehr/BLUEOCEAN/detail.do?' + $.param({ stockName: itemname, stockCode: itemcode });
                      },
                    error: function(xhr, textStatus, errorThrown) {
                        console.log("error:" + errorThrown);
                    }
          
                  });
          //----------ajax end----------
        }
        
        
    });
            
					// 검색 버튼 클릭 시 이벤트 핸들러
					$("#header-search-btn").on("click", function() {
					    performSearch();
					});
					
					// 엔터 키 눌렀을 때 이벤트 핸들러
					$("#word").on("keydown", function(event) {
					    if (event.keyCode === 13) { // Enter key
					        event.preventDefault(); // 기본 동작 방지 (폼 제출 방지)
					        performSearch();
					    }
					});
					
					function performSearch() {
					    let keyword = $("#word").val();
					
					    if (keyword.trim() !== "") {
					        let requestData = {
					            name: keyword
					        };
					
					        $.ajax({
					            type: "POST",
					            url: 'http://125.142.47.191:5001/blue-oceans/search-stocks-list',
					            data: JSON.stringify(requestData),
					            contentType: 'application/json',
					            success: function(data) {
					                let autocompleteData = [];
					                data.data.forEach(function(data) {
					                    autocompleteData.push({
					                        label: data.Name + ' (' + data.Code + ')',
					                        value: data.Name,
					                        code: data.Code
					                    });
					                });
					
					                // 처리한 데이터를 사용하여 리다이렉트
					                var encodedData = encodeURIComponent(JSON.stringify(autocompleteData));
					                var redirectUrl = '${CP}/BLUEOCEAN/searchlist.do?data=' + encodedData;
					                window.location.href = redirectUrl;
					            },
					            error: function(xhr, textStatus, errorThrown) {
					                console.log("error:" + errorThrown);
					            }
					        });
					    }
					}
       

        

      
          

 });
		
            $("#logout").on("click",function() {
              let logout = confirm(`${sessionScope.user}님 로그아웃?`);
              
              if(logout){
                $.ajax({
                              type : "POST",
                              url : "/ehr/BLUEOCEAN/logout.do",
                              asyn : "true",
                              dataType : "html",
                              data : {},
                              success : function(data) {// 통신
                                // 성공
                                console.log("data:"+ data);
                              alert("로그아웃 됨");
                              window.location.href = "${CP}/BLUEOCEAN/main.do"; 
                              },
                              error : function(data) {// 실패시 처리
                                console.log("error:"+ data);
                              }
                            });
                   }
           
           
            });		
		
		          // 검색어 입력란의 값이 변경될 때마다 실행될 함수
            function searchWithSelectedCode(requestData) {
            let keyword = $("#word").val();
            if (eUtil.ISEmpty(keyword) == true) {
                alert("검색어를 입력해주세요");
                $("#word").focus();
                return;
            } else {

              
            let currentDate = new Date();
            
            currentDate.setDate(currentDate.getDate() - 1);
            
            let formattedDate = currentDate.toISOString().split('T')[0];              
              
            let requestData = {
                ticker: itemcode, // 변경된 부분
                startDate: formattedDate,
                endtDate: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>',
            };                      
                $.ajax({
                    type: "POST",
                    url: 'http://125.142.47.191:5001/blue-oceans/search-tickers',
                    data: JSON.stringify(requestData),
                    contentType: 'application/json',
                    mode: 'cors',
                    success: function(data) {
                        var encodedData = encodeURIComponent(JSON.stringify(data));
                        var redirectUrl = '${CP}/BLUEOCEAN/searchlist.do?data=' + encodedData;
                        window.location.href = redirectUrl;
                    },
                    error: function(xhr, textStatus, errorThrown) {
                        if (xhr.status === 404) {
                            alert("검색된 단어가 없음");
                        } else {
                            console.log("error:" + errorThrown);
                        }
                    }
                });
            }
        }
		          
            function validatePhoneNumber(input) {
                input.value = input.value.replace(/[^0-9]/g, ''); // 입력값에서 숫자 이외의 문자 제거
            }		          
		
		
		</script>
</html>