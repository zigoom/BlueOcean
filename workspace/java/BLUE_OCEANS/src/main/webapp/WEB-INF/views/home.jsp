<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Home</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<style>
.modal-containor div {
	margin: 15px;
	text-align: center;
}

.modal-containor div input {
	margin-left: 15px;
}

.modal-header button {
	margin-left: 15px;
}
</style>
</head>
<body>
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Launch demo modal</button>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title fs-5" id="exampleModalLabel">로그인</h5>
					<button id="signIn" type="button" class="btn btn-light">로그인</button>
					<button id="signUp" type="button" class="btn btn-light">회원가입</button>
					<button id="find-id" type="button" class="btn btn-light">ID찾기</button>
					<button id="find-pw" type="button" class="btn btn-light">PW찾기</button>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class='modal-containor'>
							<div>
								<label>아이디</label>
								<input type='text'>
							</div>
							<div>
								<label>비밀번호</label>
								<input type='text'>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer"><button class='btn btn-primary'>로그인</button></div>
			</div>
		</div>
	</div>
</body>
<script>
	let signInhtml = "";
	let signInActive = 0;
	let signUphtml = "";
	let signUpActive = 0;
	let findIdhtml = "";
	let findIdActive = 0;
	let findPwhtml = "";
	let findPwActive = 0;

	signInhtml += "<form>                         "
	signInhtml += "<div class='modal-containor'>  "
	signInhtml += "<div>                          "
	signInhtml += "<label>아이디</label>            "
	signInhtml += "<input type='text'>            "
	signInhtml += "</div>                         "
	signInhtml += "<div>                          "
	signInhtml += "<label>비밀번호</label>          "
	signInhtml += "<input type='text'>            "
	signInhtml += "</div>                         "
	signInhtml += "</div>                         "
	signInhtml += "</form>                        "

	signUphtml += "<form>"
	signUphtml += "<div class='modal-containor'>"
	signUphtml += "<div>"
	signUphtml += "<label>이름</label>"
	signUphtml += "<input type='text'>"
	signUphtml += "</div>"
	signUphtml += "<div>"
	signUphtml += "<label>핸드폰번호</label>"
	signUphtml += "<input type='text'>"
	signUphtml += "</div>"
	signUphtml += "<div>"
	signUphtml += "<label>이메일</label>"
	signUphtml += "<input type='text'>"
	signUphtml += "</div>"
	signUphtml += "<div>"
	signUphtml += "<label>주소</label>"
	signUphtml += "<input type='text'>"
	signUphtml += "</div>"
	signUphtml += "<div>"
	signUphtml += "<label>나머지주소</label>"
	signUphtml += "<input type='text'>"
	signUphtml += "</div>"
	signUphtml += "</div>"
	signUphtml += "</form>"

	findIdhtml += "<form>"
	findIdhtml += "<div class='modal-containor'>"
	findIdhtml += "<div>"
	findIdhtml += "<label>이름</label>"
	findIdhtml += "<input type='text'>"
	findIdhtml += "</div>"
	findIdhtml += "<div>"
	findIdhtml += "<label>이메일</label>"
	findIdhtml += "<input type='text'>"
	findIdhtml += "</div>"
	findIdhtml += "</div>"
	findIdhtml += "</form>"
			
	findPwhtml += "<form>"
	findPwhtml += "<div class='modal-containor'>"
	findPwhtml += "<div>"
	findPwhtml += "<label>아이디</label>"
	findPwhtml += "<input type='text'>"
	findPwhtml += "</div>"
	findPwhtml += "<div>"
	findPwhtml += "<label>이름</label>"
	findPwhtml += "<input type='text'>"
	findPwhtml += "</div>"
	findPwhtml += "<div>"
	findPwhtml += "<label>이메일</label>"
	findPwhtml += "<input type='text'>"
	findPwhtml += "</div>"
	findPwhtml += "</div>"
	findPwhtml += "</form>"
	
	function appendAndShow(title) {
		$(".modal-body").html("");
		$(".modal-footer").html("");
		$(".modal-body").append(title)
		$(".modal-body").show(title)
	}

	$("#signIn").click(function() {
		document.querySelector("#exampleModalLabel").innerHTML = "로그인";
		$(".modal-body").hide(findIdhtml)
		$(".modal-body").hide(signUphtml)
		signInActive = signInActive + 1
		findIdActive = 0;
		findPwActive = 0;
		signUpActive = 0;
		if (signInActive >= 1) {
			appendAndShow(signInhtml)
			
			$(".modal-footer").append("<button class='btn btn-primary'>로그인</button>")
			
		}

	})

	$("#signUp").click(function() {
		document.querySelector("#exampleModalLabel").innerHTML = "회원가입";
		$(".modal-body").hide(findIdhtml)
		$(".modal-body").hide(signInhtml)
		signUpActive = signUpActive + 1
		signInActive = 0;
		findIdActive = 0;
		findPwActive = 0;
		if (signUpActive >= 1) {
			appendAndShow(signUphtml)
			
			$(".modal-footer").append("<button class='btn btn-primary'>회원가입</button>")
		}

	})
	$("#find-id").click(function() {
		document.querySelector("#exampleModalLabel").innerHTML = "ID찾기";
		$(".modal-body").hide(signInhtml)
		$(".modal-body").hide(signUphtml)
		signInActive = 0;
		signUpActive = 0;
		findPwActive = 0;
		findIdActive = findIdActive + 1;
		if (findIdActive >= 1) {
			appendAndShow(findIdhtml)
			
			$(".modal-footer").append("<button class='btn btn-primary'>ID찾기</button>")
		}

	})
	
	$("#find-pw").click(function() {
		document.querySelector("#exampleModalLabel").innerHTML = "PW찾기";
		$(".modal-body").hide(signInhtml)
		$(".modal-body").hide(signUphtml)
		signInActive = 0;
		signUpActive = 0;
		findIdActive = 0;
		findPwActive = findPwActive + 1;
		if (findPwActive >= 1) {
			appendAndShow(findPwhtml)
			
			$(".modal-footer").append("<button class='btn btn-primary'>PW찾기</button>")
		}

	})
	
</script>
</html>
