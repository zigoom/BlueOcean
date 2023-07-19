let signInhtml = "";
let signInActive = 0;
let signUphtml = "";
let signUpActive = 0;
let findIdhtml = "";
let findIdActive = 0;
let findPwhtml = "";
let findPwActive = 0;

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
  $(".modal-body").html("");
  $(".modal-footer").html("");
  $(".modal-body").append(title);
  $(".modal-body").show(title);
}

$("#signIn").click(function() {
  document.querySelector("#exampleModalLabel").innerHTML = "로그인";
  $(".modal-body").hide(findIdhtml);
  $(".modal-body").hide(signUphtml);
  signInActive = signInActive + 1;
  findIdActive = 0;
  findPwActive = 0;
  signUpActive = 0;
  if (signInActive >= 1) {
    appendAndShow(signInhtml);
    $(".modal-footer").append("<button class='btn btn-primary'>로그인</button>");
  }
});

$("#signUp").click(function() {
  document.querySelector("#exampleModalLabel").innerHTML = "회원가입";
  $(".modal-body").hide(findIdhtml);
  $(".modal-body").hide(signInhtml);
  signUpActive = signUpActive + 1;
  signInActive = 0;
  findIdActive = 0;
  findPwActive = 0;
  if (signUpActive >= 1) {
    appendAndShow(signUphtml);
    $(".modal-footer").append("<button class='btn btn-primary'>회원가입</button>");
  }
});

$("#find-id").click(function() {
  document.querySelector("#exampleModalLabel").innerHTML = "ID찾기";
  $(".modal-body").hide(signInhtml);
  $(".modal-body").hide(signUphtml);
  signInActive = 0;
  signUpActive = 0;
  findPwActive = 0;
  findIdActive = findIdActive + 1;
  if (findIdActive >= 1) {
    appendAndShow(findIdhtml);
    $(".modal-footer").append("<button class='btn btn-primary'>ID찾기</button>");
  }
});

$("#find-pw").click(function() {
  document.querySelector("#exampleModalLabel").innerHTML = "PW찾기";
  $(".modal-body").hide(signInhtml);
  $(".modal-body").hide(signUphtml);
  signInActive = 0;
  signUpActive = 0;
  findIdActive = 0;
  findPwActive = findPwActive + 1;
  if (findPwActive >= 1) {
    appendAndShow(findPwhtml);
    $(".modal-footer").append("<button class='btn btn-primary'>PW찾기</button>");
  }
});
