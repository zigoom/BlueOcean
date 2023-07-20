let signInhtml = "";
let signInActive = 0;
let signUphtml = "";
let signUpActive = 0;
let findIdhtml = "";
let findIdActive = 0;
let findPwhtml = "";
let findPwActive = 0;
let signIn = document.querySelector("#signIn")
let signUp = document.querySelector("#signUp")
let findId = document.querySelector("#find-id")
let findPw = document.querySelector("#find-pw")
let modalFooter = $(".modal-footer")
let modalBody = $(".modal-body")

signInhtml += "<form>";
signInhtml += "  <div class='modal-containor'>";
signInhtml += "    <div>";
signInhtml += "      <label>아이디</label>";
signInhtml += "      <input type='text' class='form-control'>";
signInhtml += "    </div>";
signInhtml += "    <div>";
signInhtml += "      <label>비밀번호</label>";
signInhtml += "      <input type='text' class='form-control'>";
signInhtml += "    </div>";
signInhtml += "  </div>";
signInhtml += "</form>";

signUphtml += "<form>";
signUphtml += "  <div class='modal-containor'>";
signUphtml += "    <div>";
signUphtml += "      <label>이름</label>";
signUphtml += "      <input type='text' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>핸드폰번호</label>";
signUphtml += "      <input type='text' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>이메일</label>";
signUphtml += "      <input type='text' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>주소</label>";
signUphtml += "      <input type='text' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>나머지주소</label>";
signUphtml += "      <input type='text' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "  </div>";
signUphtml += "</form>";

findIdhtml += "<form>";
findIdhtml += "  <div class='modal-containor'>";
findIdhtml += "    <div>";
findIdhtml += "      <label>이름</label>";
findIdhtml += "      <input type='text' class='form-control'>";
findIdhtml += "    </div>";
findIdhtml += "    <div>";
findIdhtml += "      <label>이메일</label>";
findIdhtml += "      <input type='text' class='form-control'>";
findIdhtml += "    </div>";
findIdhtml += "  </div>";
findIdhtml += "</form>";

findPwhtml += "<form>";
findPwhtml += "  <div class='modal-containor'>";
findPwhtml += "    <div>";
findPwhtml += "      <label>아이디</label>";
findPwhtml += "      <input type='text' class='form-control'>";
findPwhtml += "    </div>";
findPwhtml += "    <div>";
findPwhtml += "      <label>이름</label>";
findPwhtml += "      <input type='text' class='form-control'>";
findPwhtml += "    </div>";
findPwhtml += "    <div>";
findPwhtml += "      <label>이메일</label>";
findPwhtml += "      <input type='text' class='form-control'>";
findPwhtml += "    </div>";
findPwhtml += "  </div>";
findPwhtml += "</form>";

function appendAndShow(title) {
	modalBody.html("");
	modalFooter.html("");
	modalBody.append(title);
	modalBody.show(title);
}

$("#signIn").click(function() {
	signIn.classList.remove("btn-light")
	signIn.classList.add("btn-secondary")
	if (signIn.classList.contains("btn-secondary")) {
		signUp.classList.remove("btn-secondary")
		signUp.classList.add("btn-light")
		findId.classList.remove("btn-secondary")
		findId.classList.add("btn-light")
		findPw.classList.remove("btn-secondary")
		findPw.classList.add("btn-light")
	}

	modalBody.hide(findIdhtml);
	modalBody.hide(signUphtml);
	signInActive = signInActive + 1;
	findIdActive = 0;
	findPwActive = 0;
	signUpActive = 0;
	if (signInActive >= 1) {
		appendAndShow(signInhtml);
		modalFooter.append("<button class='btn btn-primary'>로그인</button>");
	}
});

$("#signUp").click(function() {
	signUp.classList.remove("btn-light")
	signUp.classList.add("btn-secondary")
	if (signUp.classList.contains("btn-secondary")) {
		signIn.classList.remove("btn-secondary")
		signIn.classList.add("btn-light")
		findId.classList.remove("btn-secondary")
		findId.classList.add("btn-light")
		findPw.classList.remove("btn-secondary")
		findPw.classList.add("btn-light")
	}

	modalBody.hide(findIdhtml);
	modalBody.hide(signInhtml);
	signUpActive = signUpActive + 1;
	signInActive = 0;
	findIdActive = 0;
	findPwActive = 0;
	if (signUpActive >= 1) {
		appendAndShow(signUphtml);
		modalFooter.append("<button class='btn btn-primary'>회원가입</button>");
	}
});

$("#find-id").click(function() {
	findId.classList.remove("btn-light")
	findId.classList.add("btn-secondary")
	if (findId.classList.contains("btn-secondary")) {
		signUp.classList.remove("btn-secondary")
		signUp.classList.add("btn-light")
		signIn.classList.remove("btn-secondary")
		signIn.classList.add("btn-light")
		findPw.classList.remove("btn-secondary")
		findPw.classList.add("btn-light")
	}

	modalBody.hide(signInhtml);
	modalBody.hide(signUphtml);
	signInActive = 0;
	signUpActive = 0;
	findPwActive = 0;
	findIdActive = findIdActive + 1;
	if (findIdActive >= 1) {
		appendAndShow(findIdhtml);
		modalFooter.append("<button class='btn btn-primary'>ID찾기</button>");
	}
});

$("#find-pw").click(function() {
	findPw.classList.remove("btn-light")
	findPw.classList.add("btn-secondary")
	if (findPw.classList.contains("btn-secondary")) {
		signUp.classList.remove("btn-secondary")
		signUp.classList.add("btn-light")
		findId.classList.remove("btn-secondary")
		findId.classList.add("btn-light")
		signIn.classList.remove("btn-secondary")
		signIn.classList.add("btn-light")
	}

	modalBody.hide(signInhtml);
	modalBody.hide(signUphtml);
	signInActive = 0;
	signUpActive = 0;
	findIdActive = 0;
	findPwActive = findPwActive + 1;
	if (findPwActive >= 1) {
		appendAndShow(findPwhtml);
		modalFooter.append("<button class='btn btn-primary'>PW찾기</button>");
	}
});
