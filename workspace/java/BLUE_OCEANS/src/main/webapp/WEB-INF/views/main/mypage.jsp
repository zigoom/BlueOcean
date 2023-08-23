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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
   .py-5{
   
    padding-bottom: 11rem!important;
   }
</style>
</head>
<body>
<div class="container-fluid ps-md-0 centered-form">
    <div class="col-md-8 col-lg-4">
      <div class="login d-flex py-5">
        <div class="container">
          <div class="row">
              <div class="col-md-6 col-lg-11">
               <h1 class="login-heading mb-4">마이페이지</h1>

              
              <form>
                <hr class="my-1">
                <input type="hidden" name="userNo" value="${userinfo.userNo}">
                
		            <div class="col-12 py-2">
		              <label for="name" class="form-label"><strong>이름</strong></label>
		              <input type="text" class="form-control" id="name" name="name" value="${userinfo.name}" readonly="readonly">
		            </div>
		            
                
		            <div class="col-12 py-2">
		              <label for="userId" class="form-label"><strong>아이디</strong></label>
		              <input type="text" class="form-control" id="userId" name="userId" value="${userinfo.userId}" readonly="readonly">
		            </div>
                
               
		            <div class="col-12 py-2">
		              <label for="phoneNo" class="form-label"><strong>전화번호</strong></label>
		              <input type="text" class="form-control" id="phoneNo" name="phoneNo" value="${userinfo.phoneNo}">
		            </div>
               
                <div class="col-12 py-2">
		              <label for="birthday" class="form-label"><strong>생년월일</strong></label>
		              <input type="text" class="form-control" id="birthday" name="birthday" value="${userinfo.birthday}">
                </div>
                
                <!-- 성별 라디오버튼 -->
                
                <div>
								  <h6><strong>성별</strong></h6>
	                <div class="form-floating mb-1">
								    <div class="form-check form-check-inline">
								        <input class="form-check-input" type="radio" name="gender" id="genderMale" value="M" ${userinfo.gender == 'M' ? 'checked' : ''}>
								        <label class="form-check-label" for="genderMale">남성</label>
								    </div>
								    <div class="form-check form-check-inline">
								        <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="F" ${userinfo.gender == 'F' ? 'checked' : ''}>
								        <label class="form-check-label" for="genderFemale">여성</label>
								    </div>
								 </div>
								</div>
              
                <!-- 성별 라디오버튼 end -->
                                
                <div class="col-12 py-2">
                  <label for="email" class="form-label"><strong>이메일</strong></label>
                  <input type="email" class="form-control" id="email" name="email" value="${userinfo.email}">
                </div>
                
                <div class="col-12 py-2">
                  <label for="keyword" class="form-label"><strong>관심분야</strong></label>
                  <input type="text" class="form-control" id="keyword" name="keyword" value="${userinfo.keyword}">
                </div>           
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                      <button class="btn btn-lg btn-primary btn-update text-uppercase fw-bold mb-2 " type="button" id="updateButton">수정</button>
                      <button class="btn btn-lg btn-primary btn-withdraw text-uppercase fw-bold mb-2 " type="button" id="withdrawButton">탈퇴</button>
                      <button class="btn btn-lg btn-primary btn-cancle text-uppercase fw-bold mb-2 " type="button" id="cancelButton">취소</button>
                  </div> 
              </form>

             <script>
	             $(document).ready(function() {
	                 $("#updateButton").click(function() {
	                	 console.log("update")
	                	   var userId = $("#userId").val();
	                     var phoneNo = $("#phoneNo").val();
	                     var birthday = $("#birthday").val();
	                     var gender = $("input[name='gender']:checked").val();
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
	                    
	                     // 확인 메시지 출력
	                     var confirmResult = confirm("정말로 수정하시겠습니까?");
	                     if (confirmResult) {
	
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
	                     }else {
	                    	  alert("수정이 취소 되었습니다.");
	                       }
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
							            // 확인 메시지 출력
							            var confirmResult = confirm("정말로 탈퇴하시겠습니까?");
							            if (confirmResult) {
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
							            } else {
							                // 사용자가 취소한 경우
							                alert("탈퇴가 취소되었습니다.");
							            }
							            
							        });
							    });
	             </script>
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