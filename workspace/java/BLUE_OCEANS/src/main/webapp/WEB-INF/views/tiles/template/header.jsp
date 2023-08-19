  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <c:set var="CP" value="${pageContext.request.contextPath}" />
  <%@ page session="true"%>
    <html>
    <title>Home</title>
<style>
  ul{
    max-height: 
     200px;
     overflow-y: auto;
  }
</style>
      <header>
        <div id="header-box">
            <img alt="" src="${CP}/resources/imgs/logo.png" id="logo">
            <div class="search-box input-group col- flex-nowrap">
                <span class="input-group-text" id="basic-addon1">종목검색</span> 
                <input id="word" type="text" class="form-control col-sm-4" placeholder="종목명 또는 종목코드를 입력해주세요." aria-label="Username" aria-describedby="basic-addon1">
                <button id="header-search-btn" style="" class="btn btn-primary">검색</button>
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

        <div id="search-results" style="overflow:auto; max-height: 200px;" class="search-box input-group col- flex-nowrap"> <!-- 검색 결과를 표시할 영역 -->
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
		
		
		$(document).ready(function() {
        
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
          //----------ajax end----------
                  });
          
                  
              }
                    else {
                    response([]);
                    }
              },
            
            minLength: 2, // 최소 입력 길이
            select: function(event, ui) {
            $("#word").val(ui.item.value);
            $("#word").data("code", ui.item.code); // 선택한 항목의 코드를 데이터로 설정
            console.log("Selected Code:", ui.item.code); // 선택한 항목의 코드를 콘솔에 출력
            
            let requestData = {
                ticker: ui.item.code,
                <%-- date: '<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>', --%>
                date: '2023-08-16',
                interval: '10'
            };            
            
            console.log("Selected Code:", requestData.ticker); // 선택한 항목의 코드를 콘솔에 출력
            console.log("Selected Date:", requestData.date);
            console.log("Selected Interval:", requestData.interval);
            
            searchWithSelectedCode(requestData); // 선택된 코드로 검색
            return false; // 기본 동작 중단
        }
    });
            
          $("#header-search-btn").on("click", function() {
              searchWithSelectedCode(); // 버튼 클릭으로 검색
          });
        
          // 검색어 입력란의 값이 변경될 때마다 실행될 함수
            function searchWithSelectedCode(requestData) {
            let keyword = $("#word").val();
            if (eUtil.ISEmpty(keyword) == true) {
                alert("검색어를 입력해주세요");
                $("#word").focus();
                return;
            } else {

                $.ajax({
                    type: "POST",
                    url: 'http://125.142.47.191:5001/blue-oceans/search-tickers-getinterval',
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
      
          
            $("#logout").on("click",function() {
              let logout = confirm(`${sessionScope.user}님 로그아웃?`);
              
              if(logout){
                $.ajax({
                              type : "POST",
                              url : "/ehr/user/logout.do",
                              asyn : "true",
                              dataType : "html",
                              data : {},
                              success : function(data) {// 통신
                                // 성공
                                console.log("data:"+ data);
                              alert("로그아웃 됨");
                              location.reload();
                              },
                              error : function(data) {// 실패시 처리
                                console.log("error:"+ data);
                              }
                            });
                   }
           
           
            });
 });
		</script>
	</html>