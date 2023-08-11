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
                <input type="hidden" name="userNo" value="${user.userNo}">
                
                <div class="form-floating mb-5">
                  <input type="name" class="form-control" id="name" name="name" value="${user.name}" required readonly="true" >
                  <label for="name">이름</label>
                </div>
                
                <div class="form-floating mb-5">
                  <input type="id" class="form-control" id="floatingInput" value="${user.id}" readonly="true">
                  <label for="floatingInput">아이디</label>
                </div>
                
                <div class="form-floating mb-5">
                  <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}" required >
                  <label for="phone">전화번호</label>
                </div>
           
                <div class="form-floating mb-5">
                  <input type="text" class="form-control" id="birthday" name="birthday" value="${user.birthday}" >
                  <label for="birthday">생년월일</label>
                </div>
                <!-- 성별 라디오버튼 -->
                <div class ="form-check mb-5">
	                <div class="form-check ">                                        
									  <input class="form-check-input" type="radio" name="gender" id="gender">
									  <label class="form-check-label" for="flexRadioDefault1">
									    남성
									  </label>
									</div>
									
									
									<div class="form-check">
									  <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
									  <label class="form-check-label" for="flexRadioDefault2">
									    여성
									  </label>
									</div>
                </div>
                <!-- 성별 라디오버튼 end -->
                                
                <div class="form-floating mb-5">
                  <input type="email" class="form-control" id="floatingEmail"  >
                  <label for="floatingEmail">이메일</label>
                </div>
                
                <div class="form-floating mb-5">
                  <input type="keyword" class="form-control" id="keyword" name="keyword" value="${user.keyword}" >
                  <label for="floatingphoneNumber">관심업종 키워드</label>
                </div>                
                  
                  
                   

                  
                   
                      <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2 " type="submit">수정</button>
                    
                    
                      <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2 " type="submit">취소</button>
                    
                    
                      <button class="btn btn-lg btn-primary btn-login text-uppercase fw-bold mb-2 " type="submit">탈퇴</button>
                    
                                

              </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>