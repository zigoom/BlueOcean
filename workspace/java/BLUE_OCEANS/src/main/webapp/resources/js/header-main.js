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
signInhtml += "      <input id='login_id' type='text' class='form-control'>";
signInhtml += "    </div>";
signInhtml += "    <div>";
signInhtml += "      <label>비밀번호</label>";
signInhtml += "      <input id='login_pw' type='text' class='form-control'>";
signInhtml += "    </div>";
signInhtml += "  </div>";
signInhtml += "</form>";

signUphtml += "<form>";
signUphtml += "  <div class='modal-containor'>";
signUphtml += "    <div>";
signUphtml += "      <label>아이디</label>";
signUphtml += "      <input type='text' id='signUp_id' name='signUp_id' maxlength='15' class='form-control'>";
signUphtml += "    	 <button type='button' class='btn btn-outline-primary' id='sigup_idcheck'>아이디체크</button>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>이름</label>";
signUphtml += "      <input type='text' id='signUp_name' name='signUp_name' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>비밀번호</label>";
signUphtml += "      <input type='password' id='signUp_pw' name='signUp_pw' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>비밀번호 확인</label>";
signUphtml += "      <input type='password' id='signUp_pw_check' name='signUp_pw_check' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>생년월일</label>";
signUphtml += "      <input maxlength='6' type='text' id='signUp_birthday' name='signUp_birthday' class='form-control' placeholder='생년월일 6자리만 입력해주세요'>";
signUphtml += "    </div>";
signUphtml += "    <div style='display: flex; align-items: center;'>";
signUphtml += "  	 <label>성별</label>";
signUphtml += "  	 <label for='genderM' style='margin-left: 10px; margin-right: 5px;'>남</label>";
signUphtml += "  	 <input type='radio' name='gender' value='M' id='signUp_M' style='margin-right: 10px;' checked>";
signUphtml += "  	 <label for='genderF' style='margin-left: 10px;'>여</label>";
signUphtml += "  	 <input type='radio' name='gender' value='F' id='signUp_F' style='margin-right: 10px;'>";
signUphtml += "	   </div>";
signUphtml += "    <div>";
signUphtml += "      <label>핸드폰</label>";
signUphtml += "      <input type='text' id='signUp_phone' name='signUp_phone' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>이메일</label>";
signUphtml += "      <input type='text' id='signUp_email' name='signUp_email' class='form-control'>";
signUphtml += "    </div>";
signUphtml += "    <div>";
signUphtml += "      <label>키워드</label>";
signUphtml += "      <input placeholder='선택사항' type='text' id='signUp_keyword' name='signUp_keyword' class='form-control'>";
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
findPwhtml += "      <input type='text' class=''>";
findPwhtml += "    </div>";
findPwhtml += "  </div>";
findPwhtml += "</form>";

function appendAndShow(title) {
	modalBody.html("");
	modalFooter.html("");
	modalBody.append(title);
	modalBody.show();
}

let idcheck = 0;// 아이디 체크 했으면 1 안했으면 0
let idEffectiveness = 0;// 아이디 체크 했으면 1 안했으면 0
let isPasswordValidationDone = 0;
let isPasswordCheckValidationDone = 0;

$(document)
		.ready(
				function() {
					console.log("테스트중")

					$("#signIn")
							.click(
									function() {
										signIn.classList.remove("btn-light")
										signIn.classList.add("btn-secondary")
										if (signIn.classList
												.contains("btn-secondary")) {
											signUp.classList.add("btn-light");
											signUp.classList
													.remove("btn-secondary");
											findId.classList.add("btn-light");
											findId.classList
													.remove("btn-secondary");
											findPw.classList.add("btn-light");
											findPw.classList
													.remove("btn-secondary");
										}

										modalBody.hide(findIdhtml);
										modalBody.hide(signUphtml);
										signInActive = signInActive + 1;
										findIdActive = 0;
										findPwActive = 0;
										signUpActive = 0;
										if (signInActive >= 1) {
											appendAndShow(signInhtml);
											modalFooter
													.append("<button class='btn btn-primary' id='login_bt'>로그인</button>");
										}

									});

					$("#signUp")
							.click(
									function() {
										signUp.classList.remove("btn-light")
										signUp.classList.add("btn-secondary")
										if (signUp.classList
												.contains("btn-secondary")) {
											signUp.classList.add("btn-light");
											signUp.classList
													.remove("btn-secondary");
											findId.classList.add("btn-light");
											findId.classList
													.remove("btn-secondary");
											findPw.classList.add("btn-light");
											findPw.classList
													.remove("btn-secondary");
										}

										modalBody.hide(findIdhtml);
										modalBody.hide(signInhtml);
										signUpActive = signUpActive + 1;
										signInActive = 0;
										findIdActive = 0;
										findPwActive = 0;
										if (signUpActive >= 1) {
											appendAndShow(signUphtml);
											modalFooter
													.append("<button class='btn btn-primary' id='signUp_bt'>회원가입</button>");
										}
										// 아이디 입력 필드에서 포커스를 잃었을 때 유효성 검사 수행
										document
												.querySelector("#signUp_id")
												.addEventListener(
														"keyup",
														function(event) {
															const inputValue = event.target.value;
															const englishOnlyValue = inputValue
																	.replace(
																			/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g,
																			'');
															event.target.value = englishOnlyValue;
														});

										document.querySelector("#signUp_pw")
												.addEventListener("blur",
														function() {
															validatePassword();

														})

										document
												.querySelector(
														"#signUp_pw_check")
												.addEventListener(
														"blur",
														function() {
															passwordSameCheck();

														})

									});

					$("#find-id")
							.click(
									function() {
										findId.classList.remove("btn-light")
										findId.classList.add("btn-secondary")
										if (findId.classList
												.contains("btn-secondary")) {
											signUp.classList.add("btn-light");
											signUp.classList
													.remove("btn-secondary");
											findId.classList.add("btn-light");
											findId.classList
													.remove("btn-secondary");
											findPw.classList.add("btn-light");
											findPw.classList
													.remove("btn-secondary");
										}

										modalBody.hide(signInhtml);
										modalBody.hide(signUphtml);
										signInActive = 0;
										signUpActive = 0;
										findPwActive = 0;
										findIdActive = findIdActive + 1;
										if (findIdActive >= 1) {
											appendAndShow(findIdhtml);
											modalFooter
													.append("<button class='btn btn-primary' id='login_bt'>ID찾기</button>");
										}
									});

					$("#find-pw")
							.click(
									function() {
										findPw.classList.remove("btn-light")
										findPw.classList.add("btn-secondary")
										if (findPw.classList
												.contains("btn-secondary")) {
											signUp.classList.add("btn-light");
											signUp.classList
													.remove("btn-secondary");
											findId.classList.add("btn-light");
											findId.classList
													.remove("btn-secondary");
											findPw.classList.add("btn-light");
											findPw.classList
													.remove("btn-secondary");
										}

										modalBody.hide(signInhtml);
										modalBody.hide(signUphtml);
										signInActive = 0;
										signUpActive = 0;
										findIdActive = 0;
										findPwActive = findPwActive + 1;
										if (findPwActive >= 1) {
											appendAndShow(findPwhtml);
											modalFooter
													.append("<button class='btn btn-primary' id='login_bt'>PW찾기</button>");
										}
									});

					// ------------------------------회원가입----------------------------
					// 아이디 중복검사
					$(document)
							.on(
									"click",
									"#sigup_idcheck",
									function() {
										let input = $('#signUp_id').val();
										let regex = /^[a-z0-9]+$/;
										if (eUtil
												.ISEmpty($("#signUp_id").val()) == true) {
											alert("아이디를 입력하세요.");
											return;
											// 아이디 조합 검사
										} else if (!regex.test(input)
												|| !/[a-z]/.test(input)
												|| !/\d/.test(input)) {
											alert("소문자와 숫자를 조합해서 id를 작성해주세요.");
											$('#signUp_id').val(""); // 입력 값을
											// 비워줍니다.
											return;

										}

										else {
											let id = $('#signUp_id').val();
											console.log("checkId 실행됨" + id); // 추가한
											// 코드
											$
													.ajax({
														url : "/ehr/user/idCheck.do",
														type : "POST",
														data : {
															"id" : id,
														},
														success : function(cnt) { // 컨트롤러
															// 에서
															// 받은
															// cnt
															// alert("success c
															// allback");
															console.log(
																	"아이디 체크",
																	cnt)
															if (cnt != 1) { // 사용가능
																// id
																alert("사용가능한 id입니다")
																idcheck = 1
																/*
																 * $(".id_ok").css("display",
																 * "inline-block");
																 * $(".id_already").css("display",
																 * "none");
																 */
															} else { // 중복된
																// 아이디
																alert("사용 불가능한 id입니다")
																/*
																 * $(".id_already").css("display",
																 * "inline-block");
																 * $(".id_ok").css("display",
																 * "none");
																 */
															}

														},
														error : function(
																request, error) {
															console
																	.log(request);
															console.log(error);
															alert("에러가 났습니다");
														}
													});
										}

									});

					$(document)
							.on(
									"click",
									"#signUp_bt",
									function() {
										console.log("signUp_bt");

										if (eUtil
												.ISEmpty($("#signUp_id").val()) == true) {
											alert("아이디를 입력하세요.");
											$("#signUp_id").focus();
											return;
										}

										if (eUtil.ISEmpty($("#signUp_name")
												.val()) == true) {
											alert("이름을 입력하세요.");
											$("#signUp_name").focus();
											return;
										}

										if (eUtil
												.ISEmpty($("#signUp_pw").val()) == true) {
											alert("비밀번호를 입력하세요.");
											$("#signUp_pw").focus();
											return; 
										}

										if (eUtil.ISEmpty($("#signUp_pw_check")
												.val()) == true) {
											alert("비밀번호 체크를 입력하세요.");
											$("#signUp_pw_check").focus();
											return;
										}

										if (eUtil.ISEmpty($("#signUp_birthday")
												.val()) == true) {
											alert("생년월일 입력하세요.");
											$("#signUp_birthday").focus();
											return;
										}

										if (eUtil.ISEmpty($("#signUp_phone")
												.val()) == true) {
											alert("핸드폰을 입력하세요.");
											$("#signUp_phone").focus();
											return;
										}

										if (eUtil.ISEmpty($("#signUp_email")
												.val()) == true) {
											alert("이메일를 입력하세요.");
											$("#signUp_email").focus();
											return;
										}

										$
												.ajax({
													type : "POST",
													url : "/ehr/user/siginUp.do",
													asyn : "true",
													dataType : "html",
													data : {

														userId : $("#signUp_id")
																.val(),
														name : $("#signUp_name")
																.val(),
														passwd : $("#signUp_pw")
																.val(),
														birthday : $(
																"#signUp_birthday")
																.val(),
														gender : $(
																"input[name='gender']:checked")
																.val(),
														phone : $(
																"#signUp_phone")
																.val(),
														email : $(
																"#signUp_email")
																.val(),
														keyword : $(
																"#signUp_keyword")
																.val()
													},
													success : function(data) {// 통신
														// 성공
														console
																.log("success data:"
																		+ data);
													},
													error : function(data) {// 실패시
														// 처리
														console.log("error:"
																+ data);
													}
												});

									});
					// ------------------------------회원가입
					// end----------------------------

					// ------------------------------로그인-----------------------------

					$(document)
							.on(
									"click",
									"#login_bt",
									function() {
										console.log("login_bt");

										if (eUtil.ISEmpty($("#login_id").val()) == true) {
											alert("아이디를 입력하세요.");
											$("#login_id").focus();
											return;
										}

										if (eUtil.ISEmpty($("#login_pw").val()) == true) {
											alert("비밀번호를 입력하세요.");
											$("#login_pw").focus();
											return;
										}
										$
												.ajax({
													type : "POST",
													url : "/ehr/user/Login.do",
													asyn : "true",
													dataType : "html",
													data : {

														userId : $("#login_id")
																.val(),
														passwd : $("#login_pw")
																.val()

													},
													success : function(data) {// 통신
														// 성공
														console.log("data:"
																+ data);
														let paredJSON = JSON
																.parse(data)
														console
																.log("paredJSON.msgId:"
																		+ paredJSON.megId);
														if (paredJSON.megId == 10
																|| paredJSON.megId == 20) {
															alert("아이디나 비밀번호가 다릅니다.")
														} else if (paredJSON.megId == 30) {
															alert("로그인 성공");
															window.location.href = window.location.href;
														}

													},
													error : function(data) {// 실패시
														// 처리
														console.log("error:"
																+ data);
													}
												});

									});
					// ------------------------------로그인
					// end-----------------------------

				});

// ID 한글 입력값 못 넣게 하는 함수

// 비밀번호 유효성 검사 함수
function validatePassword() {
	let password = $('#signUp_pw').val();
	let pattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}]).{8,}$/;

	if (!pattern.test(password)) {
		alert('8자 이상으로 영문, 숫자, 특수문자를 혼합하여 만들어주세요.');
		$("#signUp_pw").val("");
		return false;
	}// 유효성 검사 성공 시 상태 초기화
	return true;
}

// 비밀번호 와 확인비밀번호 같은지 체크
function passwordSameCheck() {
	let password = $('#signUp_pw').val();
	let confirmPw = $('#signUp_pw_check').val();
	isPasswordCheckValidationDone = 0;
	if (confirmPw != password) {
		alert("비밀번호가 다릅니다.")
		$("#signUp_pw_check").val("");
		return false;
	}
	return true;
}
