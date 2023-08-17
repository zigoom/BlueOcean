<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
  <c:set var="CP" value="${pageContext.request.contextPath }"/>  
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="${CP}/resources/css/header.css" />
    <link rel="stylesheet" href="${CP}/resources/css/footer.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css">
<style>
  /* Custom CSS */
  .centered-form {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  .d-flex.justify-content-between {
    justify-content: flex-end;
    }
</style>
</head>
<body>
<div class="container-fluid ps-md-0 centered-form">
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex py-5">
        <div class="container">
          <div class="row">
            <div class="row g-2">
              <div class="col-md-6 col-lg-12">
               <h1 class="login-heading mb-4">마이페이지</h1>

              
              <form>
              console.log("${CP}")
                <input type="text" name="userNo" value="${userinfo.userNo}">
                
                <div class="form-floating mb-5">
                  <input type="name" class="form-control" id="name" name="name" value="${userinfo.name}" required readonly="true" >
                  <label for="name">이름</label>
                </div>
                
                <div class="form-floating mb-5">
                  <input type="id" class="form-control" id="userId" name="userId" value="${userinfo.userId}" readonly="true">
                  <label for="userId">아이디</label>
                </div>
                
                <div class="form-floating mb-5">
                  <input type="text" class="form-control" id="phoneNo" name="phoneNo" value="${userinfo.phoneNo}" required >
                  <label for="phoneNo">전화번호</label>
                </div>
           
                <div class="form-floating mb-5">
                  <input type="text" class="form-control" id="birthday" name="birthday" value="${userinfo.birthday}" >
                  <label for="birthday">생년월일</label>
                </div>
                <!-- 성별 라디오버튼 -->
                <div class="form-floating mb-5">
                  <input type="text" class="form-control" id="gender" name="gender" value="${userinfo.gender}" >
                  <label for="gender">성별</label>
                </div>
                <!-- 성별 라디오버튼 end -->
                                
                <div class="form-floating mb-5">
                  <input type="email" class="form-control" id="email" name="email" value="${userinfo.email}" >
                  <label for="email">이메일</label>
                </div>
                
                <div class="form-floating mb-5">
                  <input type="text" class="form-control" id="keyword" name="keyword" value="${userinfo.keyword}" >
                  <label for="keyword">관심업종 키워드</label>
                </div>                
                  
                      <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2 " type="button" id="updateButton">수정</button>
                    
                    
                      <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2 " type="button" id="cancelButton">취소</button>
                    
                    
                      <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2 " type="button" id="withdrawButton">탈퇴</button>
                    
                                

              </form>
             <script>
	             $(document).ready(function() {
	                 $("#updateButton").click(function() {
	                	 console.log("update")
	                	   var userId = $("#userId").val();
	                     var phoneNo = $("#phoneNo").val();
	                     var birthday = $("#birthday").val();
	                     var gender = $("#gender").val();
	                     var email = $("#email").val();
	                     var keyword = $("#keyword").val();
	
	                     var updateData = {
	                    		 userId: userId,
	                         phoneNo: phoneNo,
	                         birthday: birthday,
	                         gender: gender,
	                         email: email,
	                         keyword: keyword
	                     };
	                    
	
	                     $.ajax({
	                         type: 'POST', // POST 메서드 사용
	                         url: "/ehr/BLUEOCEAN/userUpdate.do",
	                         dataType: 'json', // 예상 응답 데이터 타입
	                         contentType: 'application/json; charset=utf-8',
	                         data: JSON.stringify(updateData),
	                         success: function(response) {
	                        	 console.log(response);
	                             if (response.result === "success") {
	                                 alert("수정완료");
	                                 location.reload(); // 페이지를 새로고침하여 변경 내용을 반영
	                             } else {
	                                 alert("수정실패");
	                             }
	                         },
	                         error: function() {
	                             alert("사용자 정보 업데이트 중 오류가 발생했습니다.");
	                         }
	                     });
						        });
						
						        // 취소 버튼 클릭 시 메인 페이지로 이동
						        $("#cancelButton").click(function() {
						            location.href = "${CP}/BLUEOCEAN/main.do"; // 메인 페이지의 URL로 이동
						        });
						
						          // 탈퇴 버튼 클릭 시 처리
						        $("#withdrawButton").click(function() {
						            var userId = $("#userId").val();
						            console.log("userId :"+userId)
						
						            var withdrawData = {
						                userId: userId,
						            };
						
						            // 탈퇴 버튼 클릭 이벤트 코드
						            $.ajax({
						                type: 'POST',
						                url: "/ehr/BLUEOCEAN/withdraw.do",
						                contentType: 'application/json; charset=utf-8',
						                data: JSON.stringify(withdrawData),
						                success: function(response) {
						                    if (response.result === "success") {
						                        alert("탈퇴가 정상적으로 처리되었습니다.");
						                        location.href = "${CP}/BLUEOCEAN/main.do";
						                    } else {
						                        alert("탈퇴 처리에 실패했습니다.");
						                    }
						                },
						                error: function() {
						                    alert("탈퇴 처리 중 오류가 발생했습니다.");
						                }
						            });
						        });
						    });
	             </script>
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
</html>