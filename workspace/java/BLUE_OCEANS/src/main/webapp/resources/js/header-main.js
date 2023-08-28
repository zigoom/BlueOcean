let listdata = [];
let signInhtml = '';
let signInActive = 0;
let signUphtml = '';
let signUpActive = 0;
let findIdhtml = '';
let findIdActive = 0;
let findPwhtml = '';
let findPwActive = 0;
let agreehtml = '';
let agreeActive = 0;
let signIn = document.querySelector('#signIn');
let signUp = document.querySelector('#signUp');
let findId = document.querySelector('#find-id');
let findPw = document.querySelector('#find-pw');
let agree = document.querySelector('#agree');
let modalFooter = $('.modal-footer');
let modalBody = $('.modal-body');

signInhtml += '<form>';
signInhtml += "  <div class='modal-containor'>";
signInhtml += '    <div>';
signInhtml += '      <label>아이디</label>';
signInhtml += "      <input id='login_id' type='text' class='form-control'>";
signInhtml += '    </div>';
signInhtml += '    <div>';
signInhtml += '      <label>비밀번호</label>';
signInhtml += "      <input id='login_pw' type='password' class='form-control'>";
signInhtml += '    </div>';
signInhtml += '  </div>';
signInhtml += '</form>';


signUphtml += '<form>';
signUphtml += "  <div class='modal-containor'>";
signUphtml += '    <div>';
signUphtml += '     <label>ID</label>';
signUphtml += '      <input type="text" style="" id="signUp_id" name="signUp_id" maxlength="15" placeholder="소문자+숫자 조합" class="form-control placeholder-style">';
signUphtml += "      <button type='button' style='font-size: 13px' class='btn btn-outline-primary' id='signup_idcheck'>중복확인</button>";
signUphtml += '    </div>';
signUphtml += '    <div>';
signUphtml += '      <label>이름</label>';
signUphtml += "      <input type='text' id='signUp_name' name='signUp_name' class='form-control'>";
signUphtml += '    </div>';
signUphtml += '    <div>';
signUphtml += '      <label>PW</label>';
signUphtml += "      <input type='password' id='signUp_pw' name='signUp_pw' class='form-control placeholder-style' placeholder='8자리 소문자+숫자+특수문자 조합'>";
signUphtml += '    </div>';
signUphtml += '    <div>';
signUphtml += '      <label>PW확인</label>';
signUphtml += "      <input type='password' id='signUp_pw_check' name='signUp_pw_check' class='form-control placeholder-style' placeholder='PW와 같이 입력해주세요'>";
signUphtml += '    </div>';
signUphtml += '    <div>';
signUphtml += '      <label>생년월일</label>';
signUphtml += "      <input maxlength='6' type='text' id='signUp_birthday' name='signUp_birthday' class='form-control placeholder-style' placeholder='생년월일 6자리만 입력해주세요'>";
signUphtml += '    </div>';
signUphtml += "    <div style='display: flex; align-items: center;'>";
signUphtml += '       <label>성별</label>';
signUphtml += '    <div>';
signUphtml += "     <input type='radio' name='gender' value='M' id='signUp_M' checked>";
signUphtml += '  	 <label for="signUp_M">남</label>';
signUphtml += '    </div>';
signUphtml += '    <div>';
signUphtml += "     <input type='radio' name='gender' value='F' id='signUp_F'>";
signUphtml += '	   <label for="signUp_F">여</label>';
signUphtml += '    </div>';
signUphtml += '   </div>';
signUphtml += '     <div>';
signUphtml += '     <label>핸드폰</label>';
signUphtml += "         <input placeholder='-를 빼고 적어주세요' maxlength='11' type='text' name='phone' id='signUp_phone' class='form-control placeholder-style' oninput='validatePhoneNumber(this)'>";
signUphtml += '     </div>';
signUphtml += '     <div>';
signUphtml += '      <label>이메일</label>';
signUphtml += "      <input type='text' id='signUp_email' name='signUp_email' class='form-control'>";
signUphtml += '    </div>';
signUphtml += '    <div>';
signUphtml += '      <label>키워드</label>';
signUphtml += "      <input placeholder='선택사항' type='text' id='signUp_keyword' name='signUp_keyword' class='form-control placeholder-style'>";
signUphtml += '    </div>';
signUphtml += '  </div>';
signUphtml += '</form>';

findIdhtml += '<form>';
findIdhtml += "  <div class='modal-containor'>";
findIdhtml += '    <div>';
findIdhtml += '      <label>이름</label>';
findIdhtml += "      <input type='text' id='findid_name' class='form-control'>";
findIdhtml += '    </div>';
findIdhtml += '    <div>';
findIdhtml += '      <label>이메일</label>';
findIdhtml += "      <input type='text' id='findid_email' class='form-control'>";
findIdhtml += '    </div>';
findIdhtml += '  </div>';
findIdhtml += '</form>';

findPwhtml += '<form>';
findPwhtml += "  <div class='modal-containor'>";
findPwhtml += '    <div>';
findPwhtml += '      <label>아이디</label>';
findPwhtml += "      <input type='text' id='findpw_id' class='form-control'>";
findPwhtml += '    </div>';
findPwhtml += '    <div>';
findPwhtml += '      <label>이름</label>';
findPwhtml += "      <input type='text' id='findpw_name' class='form-control'>";
findPwhtml += '    </div>';
findPwhtml += '    <div>';
findPwhtml += '      <label>email</label>';
findPwhtml += "      <input type='text' id='findpw_email' class='form-control'>";
findPwhtml += '      <button type="button" style="font-size: 10px" class="btn btn-outline-primary" id="otp_send">OTP전송</button>';
findPwhtml += '    </div>';
findPwhtml += '    <div>';
findPwhtml += '      <label>OTP</label>';
findPwhtml += "      <input type='text' id='otp_number' minlength='6' class='form-control'>";
findPwhtml += '      <button type="button" style="font-size: 10px" class="btn btn-outline-primary" id="otp_check" disabled>OTP확인</button>';
findPwhtml += '    </div>';
findPwhtml += '    <div>';
findPwhtml += '      <label id="lable_findpw_pw" style="display: none;">PW</label>';
findPwhtml += "      <input type='password' id='findpw_pw' class='form-control' style='display: none;'>";
findPwhtml += '    </div>';
findPwhtml += '    <div>';
findPwhtml += '      <label id="lable_findpw_pwcheck" style="display: none;">PW확인</label>';
findPwhtml += "      <input type='password' id='findpw_pwcheck' class='form-control' style='display: none;'>";
findPwhtml += '    </div>';
findPwhtml += '  </div>';
findPwhtml += '</form>';


function appendAndShow(title) {
    modalBody.empty();
    modalFooter.empty();
    modalFooter.hide();
    modalBody.append(title);
    modalBody.show();
    modalFooter.show();
}


let idcheck = 0; // 아이디 체크 했으면 1 안했으면 0
let idEffectiveness = 0; // 아이디 체크 했으면 1 안했으면 0
let agree_check1 = 0;
let agree_check2 = 0;

function classListRepair(btn) {
    btn.classList.remove("btn-secondary");
    btn.classList.add("btn-light");
}

$(document).ready(function () {
	

    console.log('테스트중');
    signIn.classList.remove("btn-light");
    signIn.classList.add("btn-secondary");
    classListRepair(signUp);
    classListRepair(findId);
    classListRepair(findPw);
    ////classListRepair(agree);

    signInActive = signInActive + 1;
    findIdActive = 0;
    findPwActive = 0;
    signUpActive = 0;
    if (signInActive >= 1) {
        appendAndShow(signInhtml);
        modalFooter.append("<button class='btn btn-primary' id='login_bt'>로그인</button>");
    }


    $(document).on('click', '#otp_send', function () {
        if (eUtil.ISEmpty($('#findpw_id').val()) == true) {
            alert('아이디를 입력하세요.');
            
            // 아이디 조합 검사
        } else if (eUtil.ISEmpty($('#findpw_name').val()) == true) {
            alert('이름을 입력하세요.');
            
            // 아이디 조합 검사
        } else if (eUtil.ISEmpty($('#findpw_email').val()) == true) {
            alert('이메일을 입력하세요.');
            
            // 아이디 조합 검사
        }
        else {
            $.ajax({
                url: '/ehr/BLUEOCEAN/sendOTP.do',
                type: 'POST',
                data: {
                    userId: $('#findpw_id').val(),
                    name: $('#findpw_name').val(),
                    email: $('#findpw_email').val()
                },
                success: function (data) {
                    console.log('아이디 체크', data);
                    if (data == 1) {
                        alert("otp전송")
                        document.querySelector('#otp_check').removeAttribute('disabled');                        
                    } else {
                        alert('일치하는 회원이 없거나 otp사용중 입니다.');
                    }
                },
                error: function (request, error) {
                    console.log(request);
                    console.log(error);
                    alert('에러가 났습니다');
                },
            });
        }
    });
    
    $(document).on('click', '#otp_check', function () {
        if (eUtil.ISEmpty($('#otp_number').val()) == true) {
            alert('otp를 입력하세요.');
            
            
        }
        else {
            $.ajax({
                url: '/ehr/BLUEOCEAN/checkOtp.do',
                type: 'POST',
                data: {
                    otp: $('#otp_number').val(),
                    userId: $('#findpw_id').val()
                },
                success: function (data) {
                    console.log('아이디 체크', data);
                    if (data == 1) {
                        alert("otp가 일치합니다");
                        
                        $('#lable_findpw_pw').css('display', 'block');
                        $('#findpw_pw').css('display', 'block');
                        $('#lable_findpw_pwcheck').css('display', 'block');
                        $('#findpw_pwcheck').css('display', 'block');

                        $('#findpw_pw').on('blur', function () {
                            if (!validatePassword($(this).val())) {
                                alert('8자 이상으로 영문, 숫자, 특수문자를 혼합하여 만들어주세요.');
                                $(this).val('');
                            }
                        });

                        $('#findpw_pwcheck').on('blur', function () {
                            if (!passwordMatch($('#findpw_pw').val(), $(this).val())) {
                                alert('비밀번호가 다릅니다.');
                                $(this).val('');
                            }
                        });
                    } else {
                        alert('otp가 일치하지 않습니다.');
                    }
                },
                error: function (request, error) {
                    console.log(request);
                    console.log(error);
                    alert('에러가 났습니다');
                },
            });
        }
    });    


    // ------------------------------회원가입----------------------------


    // 아이디 중복검사

    $(document).on('click', '#signup_idcheck', function () {
        let input = $('#signUp_id').val();
        let regex = /^[a-z0-9]+$/;
        if (eUtil.ISEmpty($('#signUp_id').val()) == true) {
            alert('아이디를 입력하세요.');
            return;
            // 아이디 조합 검사
        } else if (!regex.test(input) || !/[a-z]/.test(input) || !/\d/.test(input)) {
            alert('소문자와 숫자를 조합해서 id를 작성해주세요.');
            $('#signUp_id').val(''); // 입력 값을
            // 비워줍니다.
            return;
        } else {
            let id = $('#signUp_id').val();
            // 코드
            $.ajax({
                url: '/ehr/BLUEOCEAN/idCheck.do',
                type: 'POST',
                data: {
                    id: id,
                },
                success: function (cnt) {
                    // 컨트롤러
                    // 에서
                    // 받은
                    // cnt
                    // alert("success c
                    // allback");
                    console.log('아이디 체크', cnt);
                    if (cnt != 1) {
                        // 사용가능
                        // id
                        alert('사용가능한 ID입니다');
                        idcheck = 1;
                        /*
                         * $(".id_ok").css("display",
                         * "inline-block");
                         * $(".id_already").css("display",
                         * "none");
                         */
                        document.querySelector('#signup_idcheck').setAttribute('disabled', 'disabled');
                    } else {
                        // 중복된
                        // 아이디
                        alert('중복된 ID입니다');
                        /*
                         * $(".id_already").css("display",
                         * "inline-block");
                         * $(".id_ok").css("display",
                         * "none");
                         */
                    }
                },
                error: function (request, error) {
                    console.log(request);
                    console.log(error);
                    alert('에러가 났습니다');
                },
            });
        }
    });


    $(document).on('click', '#signUp_bt', function () {

        if (eUtil.ISEmpty($('#signUp_id').val()) == true) {
            alert('아이디를 입력하세요.');
            $('#signUp_id').focus();
            return;
        }

        if (eUtil.ISEmpty($('#signUp_name').val()) == true) {
            alert('이름을 입력하세요.');
            $('#signUp_name').focus();
            return;
        }

        if (eUtil.ISEmpty($('#signUp_pw').val()) == true) {
            alert('비밀번호를 입력하세요.');
            $('#signUp_pw').focus();
            return;
        }

        if (eUtil.ISEmpty($('#signUp_pw_check').val()) == true) {
            alert('비밀번호 체크를 입력하세요.');
            $('#signUp_pw_check').focus();
            return;
        }

        if (eUtil.ISEmpty($('#signUp_birthday').val()) == true) {
            alert('생년월일 입력하세요.');
            $('#signUp_birthday').focus();
            return;
        }

        if (eUtil.ISEmpty($('#signUp_phone').val()) == true) {
            alert('핸드폰을 입력하세요.');
            $('#signUp_phone').focus();
            return;
        }

        if (eUtil.ISEmpty($('#signUp_email').val()) == true) {
            alert('이메일를 입력하세요.');
            $('#signUp_email').focus();
            return;
        }

        $.ajax({
            type: 'POST',
            url: '/ehr/BLUEOCEAN/siginUp.do',
            asyn: 'true',
            dataType: 'html',
            data: {
                userId: $('#signUp_id').val(),
                name: $('#signUp_name').val(),
                passwd: $('#signUp_pw').val(),
                birthday: $('#signUp_birthday').val(),
                gender: $("input[name='gender']:checked").val(),
                phone: $('#signUp_phone').val(),
                email: $('#signUp_email').val(),
                keyword: $('#signUp_keyword').val(),
            },
            success: function (data) {
                // 통신
                // 성공
                console.log('success data:' + data);
                if (data == 1) {
                    alert("회원가입이 완료되었습니다.")
                    window.location.href = window.location.href;
                } else {
                    alert("관리자에게 문의하십시오.")
                }
            },
            error: function (data) {
                // 실패시
                // 처리
                console.log('error:' + data);
            },
        });
    });
    // ------------------------------회원가입 end----------------------------

    // ------------------------------아이디 찾기------------------------------

    $(document).on("click", "#findid_bt", function () {
        console.log("findid_bt");

        if (eUtil.ISEmpty($("#findid_name").val()) == true) {
            alert("이름을 입력하세요.");
            $("#findid_name").focus();
            return true;
        } else if (eUtil.ISEmpty($("#findid_email").val()) == true) {
            alert("이메일을 입력하세요.");
            $("#findid_email").focus();
            return true;
        } else {
            console.log($("#findid_name").val());
            console.log($("#findid_email").val());
            $.ajax({
                type: "POST",
                url: "/ehr/BLUEOCEAN/findId.do",
                asyn: "true",
                dataType: "html",
                data: {

                    name: $("#findid_name")
                        .val(),
                    email: $("#findid_email")
                        .val()

                },
                success: function (data) {
                    console.log("data:" + data);
                    if (data == "0") {
                        alert("일치하는 회원정보가 없습니다.");
                    } else {
                        alert("회원님의 아이디는 " + data + "입니다");
                    }
                },
            });
        }

    });
    // ------------------------------아이디 찾기 end---------------------------


    // ------------------------------로그인-----------------------------
/*    function handleEnterKeyPress(event) {
    	signInActive = 1;
        if (event.key === "Enter" && signInActive >= 1) {
            $('#login_bt').trigger('click');
        }
        signInActive = 0;
    }

    document.addEventListener("keydown", handleEnterKeyPress);*/
    
    $(document).on('click', '#login_bt', function () {
    	console.log('로그인 값'+signInActive);
        if (eUtil.ISEmpty($('#login_id').val()) == true) {
            alert('아이디를 입력하세요.');
            $('#login_id').focus();
            return;
        }

        if (eUtil.ISEmpty($('#login_pw').val()) == true) {
            alert('비밀번호를 입력하세요.');
            $('#login_pw').focus();
            return;
        }
        console.log("id" + $('#login_id').val());
        console.log("pw" + $('#login_pw').val());
        $.ajax({
            type: 'POST',
            url: '/ehr/BLUEOCEAN/Login.do',
            asyn: 'true',
            dataType: 'html',
            data: {
                userId: $('#login_id').val(),
                passwd: $('#login_pw').val(),
            },
            success: function (data) {
                // 통신성공
                console.log('data:' + data);
                let paredJSON = JSON.parse(data);
                console.log('paredJSON.msgId:' + paredJSON.msgId);

                if (paredJSON.msgId == 30) {
                    alert('로그인이 완료되었습니다.');
                    window.location.href = window.location.href;
                    signInActive = 0;
                } else if (paredJSON.msgId == 40) {
                    alert('탈퇴된 회원입니다.');
                } else {
                    alert('아이디나 비밀번호가 다릅니다.');
                }

            },
            error: function (data) {
                // 실패시
                // 처리
                console.log('error:' + data);
                alert('관리자에게 문의하십시오');
            },
        });
    });
    // ------------------------------로그인 end-----------------------------

    $(document).on('click', '#findpw_bt', function () {
        console.log("findpw_bt");
        if (eUtil.ISEmpty($('#findpw_pw').val()) == true) {
            alert('비밀번호를 입력하세요.');
            $('#findpw_pw').focus();
            return;
        }      
        else{
        $.ajax({
            type: 'POST',
            url: '/ehr/BLUEOCEAN/resetpasswd.do',
            asyn: 'true',
            dataType: 'json',
            data: {
            	userId: $('#findpw_id').val(),
                passwd: $('#findpw_pw').val(),
            },
            success: function (data) {
                console.log('data:' + data);
                console.log('data:' + data.otp);
                if(data.otp == 1){
                	alert("비밀번호 변경완료");
                	window.location.href = window.location.href;
                }else{
                	alert("사용중인 비밀번호 입니다.");
                }
            },
            error: function (data) {
                console.log('error:' + data);
                alert("관리자에게 문의하세요");
            },
        });
        }
    });
    
});

// ID 한글 입력값 못 넣게 하는 함수
$(document).on('change', '#agree1', function () {
    if (this.checked) {
        agree_check1 = 1;
        console.log(agree_check1);
    } else {
        agree_check1 = 0;
        console.log(agree_check1);
    }
});

$(document).on('change', '#agree2', function () {
    if (this.checked) {
        agree_check2 = 1;
        console.log(agree_check1);
    } else {
        agree_check2gkem = 0;
        console.log(agree_check1);
    }
});

$('#signIn').click(function () {
    signIn.classList.remove("btn-light");
    signIn.classList.add("btn-secondary");
    classListRepair(signUp);
    classListRepair(findId);
    classListRepair(findPw);
    classListRepair(agree);

    signInActive = signInActive + 1;
    findIdActive = 0;
    findPwActive = 0;
    signUpActive = 0;
    agreeActive = 0;
    if (signInActive >= 1) {
        appendAndShow(signInhtml);
        modalFooter.append("<button class='btn btn-primary' id='login_bt'>로그인</button>");
    }
});

$(document).on('click', '#agree_N', function () {
	window.location.href = window.location.href;
});

$(document).on('click', '#agree_Y', function () {

    if (agree_check1 == 1 && agree_check2 == 1) {
    	signUp.classList.remove("btn-light");
    	signUp.classList.add("btn-secondary");
        classListRepair(signIn);
        classListRepair(findId);
        classListRepair(findPw);
        classListRepair(agree);        


        signUpActive = signUpActive + 1;
        signInActive = 0;
        findIdActive = 0;
        findPwActive = 0;
        agreeActive = 0;
        if (signUpActive >= 1) {
            appendAndShow(signUphtml);
            modalFooter.append("<button class='btn btn-primary' id='signUp_bt'>회원가입</button>");
        }

        document.querySelector('#signUp_id').addEventListener('input', function () {
            const signUpButton = document.querySelector('#signup_idcheck');
            const inputVal = this.value.trim(); // 입력 값을 얻어와서 공백 제거

            if (inputVal.length > 0) { // 입력 값이 있는 경우
                signUpButton.removeAttribute('disabled');
            } else { // 입력 값이 없는 경우
                signUpButton.setAttribute('disabled', 'disabled');
            }
        });

        // 아이디 입력 필드에서 포커스를 잃었을 때 유효성 검사 수행
        document.querySelector('#signUp_id').addEventListener('keyup', function (event) {
            const inputValue = event.target.value;
            const englishOnlyValue = inputValue.replace(/[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/g, '');
            event.target.value = englishOnlyValue;
        });

/*        document.querySelector('#signUp_pw').addEventListener('blur', function () {
            validatePassword();
        });

        document.querySelector('#signUp_pw_check').addEventListener('blur', function () {
            passwordSameCheck();
        });*/
        document.querySelector('#signUp_pw').addEventListener('blur', function () {
            if (!validatePassword($(this).val())) {
                alert('8자 이상으로 영문, 숫자, 특수문자를 혼합하여 만들어주세요.');
                $(this).val('');
            }
	    });
	
	    document.querySelector('#signUp_pw_check').addEventListener('blur', function () {
            if (!passwordMatch($('#signUp_pw').val(), $(this).val())) {
                alert('비밀번호가 다릅니다.');
                $(this).val('');
            }
	    });      
        
        
    } else {
        alert("동의를 눌러주세요");
    }


});

$('#find-id').click(function () {
    findId.classList.remove("btn-light");
    findId.classList.add("btn-secondary");
    classListRepair(signIn);
    classListRepair(signUp);
    classListRepair(findPw);
    classListRepair(agree);


    signInActive = 0;
    signUpActive = 0;
    findPwActive = 0;
    agreeActive = 0;
    findIdActive = findIdActive + 1;
    if (findIdActive >= 1) {
        appendAndShow(findIdhtml);
        modalFooter.append("<button class='btn btn-primary' id='findid_bt'>ID찾기</button>");
    }
});

$('#find-pw').click(function () {
    findPw.classList.remove("btn-light");
    findPw.classList.add("btn-secondary");
    classListRepair(signIn);
    classListRepair(signUp);
    classListRepair(findId);
    classListRepair(agree);

    signInActive = 0;
    signUpActive = 0;
    findIdActive = 0;
    agreeActive = 0;
    findPwActive = findPwActive + 1;
    if (findPwActive >= 1) {
        appendAndShow(findPwhtml);
        modalFooter.append("<button class='btn btn-primary' id='findpw_bt'>PW초기화</button>");
    }
    
});

$('#signUp').click(function () {

	signUp.classList.remove("btn-light");
	signUp.classList.add("btn-secondary");
    classListRepair(signIn);
    classListRepair(findId);
    classListRepair(findPw);

    signUpActive = 0;
    signInActive = 0;
    findIdActive = 0;
    findPwActive = 0;
    agreeActive = agreeActive + 1;
    agreehtml = '';
    $.ajax({
        type: 'POST',
        url: '/ehr/BLUEOCEAN/Termsofuse.do',
        asyn: 'true',
        dataType: 'json',
        success: function (data) {
            // 통신성공
            $.ajax({
                type: 'POST',
                url: '/ehr/BLUEOCEAN/Termsofuse.do',
                async: true,
                dataType: 'json',
                success: function (data) {
                    // 통신성공
                    listdata = data;

                    console.log(listdata[0].subject);
                    console.log(listdata[1].subject);


                    for (let i = 0; i < listdata.length; i++) {


                        agreehtml += '<div class="form-check">';
                        agreehtml += '<label class="form-check-label">' + listdata[i].subject + '</label>';
                        agreehtml += '<input class="form-check-input" type="checkbox" value="" id="agree' + (i + 1) + '">';
                        agreehtml += '<div class="form-floating">';

                        // 줄 바꿈 처리를 위한 코드 시작
                        let lines = listdata[i].context.split("<br>");
                        let formattedContext = lines.join("\n");
                        agreehtml += '<textarea class="form-control no-resize" readonly="readonly" id="floatingTextarea' + (i + 1) + '" style="height: 100px" rows="15" cols="40" resize="none">' + formattedContext + '</textarea>';
                        // 줄 바꿈 처리를 위한 코드 끝

                        agreehtml += '<label for="floatingTextarea' + (i + 1) + '"></label>';
                        agreehtml += '</div>';
                        agreehtml += '</div>';
                    }

                    // agreehtml을 적절한 위치에 추가하면 됩니다.


                    // 그리고 나서 화면에 동적으로 생성한 내용을 추가해야 합니다.
                    // 여기서는 약관 동의 버튼 클릭 시의 처리를 보여드린 것입니다.
                    if (agreeActive >= 1) {
                        appendAndShow(agreehtml);
                        modalFooter.append("<button class='btn btn-primary' id='agree_N'>아니요</button>");
                        modalFooter.append("<button class='btn btn-primary' id='agree_Y'>예</button>");
                    }
                },
                error: function (data) {
                    // 실패시 처리
                    console.log('error:' + data);
                    alert('관리자에게 문의하십시오');
                },
            });


        },
        error: function (data) {
            // 실패시
            // 처리
            console.log('error:' + data);
            alert('관리자에게 문의하십시오');
        },
    });


    // agreehtml 내용을 화면에 표시
    if (agreeActive >= 1) {
        appendAndShow(agreehtml);
        modalFooter.append("<button class='btn btn-primary' id='agree_N' >아니요</button>");
        modalFooter.append("<button class='btn btn-primary' id='agree_Y' >예</button>");
    }

});


// 비밀번호 유효성 검사 함수
function validatePassword() {
    let password = $('#signUp_pw').val();
    let pattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}]).{8,}$/;

    if (!pattern.test(password)) {
        alert('8자 이상으로 영문, 숫자, 특수문자를 혼합하여 만들어주세요.');
        $('#signUp_pw').val('');
        return false;
    } // 유효성 검사 성공 시 상태 초기화
    return true;
}

// 비밀번호 와 확인비밀번호 같은지 체크
function passwordSameCheck() {
    let password = $('#signUp_pw').val();
    let confirmPw = $('#signUp_pw_check').val();
    if (confirmPw != password) {
        alert('비밀번호가 다릅니다.');
        $('#signUp_pw_check').val('');
        return false;
    }
    return true;
}

function validatePassword(password) {
    let pattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*()_+|<>?:{}]).{8,}$/;
    return pattern.test(password);
}

function passwordMatch(password, confirmPassword) {
    return password === confirmPassword;
}

