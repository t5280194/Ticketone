/*
 ** 약관 동의여부 확인
 */
function go_next() {
	if (document.formm.okon1[0].checked == true) {  // 동의함 선택의 경우
		document.formm.action = "join_form";
		document.formm.submit();  // Controller로 전송
	} else if (document.formm.okon1[1].checked == true) {
		alert("약관에 동의하셔야 합니다!");
	}
}

/*
** 탈퇴 약관 동의 여부
*/
function go_deleteview() {
	if (document.formm.okon1[0].checked == true) {  // 동의함 선택의 경우
		document.formm.action = "deleteview";
		document.formm.submit();  // Controller로 전송
	} else if (document.formm.okon1[1].checked == true) {
		alert("약관에 동의하셔야 합니다!");
	}
}

/*
** 회원 탈퇴
*/
function go_delete() {
	if ($("#user_password").val() != $("#pwdCheck").val()) {
		alert("비밀번호가 맞지 않습니다.");
		$("#pwdcheck").focus();
		return false;
	} else {
		$("#delete").action = "delete";
		$("#delete").submit();
		alert("탈퇴에 성공하였습니다.");
	}
}

/*
** 사용자 ID 입력여부 확인
** id 중복확인 윈도우 오픈
*/
function idcheck() {
	
	// 회원가입 화면에 ID값 입력여부 확인
	if ($("#user_id").val() == "") {
		alert("아이디를 입력해 주세요!");
		$("#user_id").focus();
		
		return false;
	}
	
	// ID중복확인 화면 요청
	var url = "id_check_form?user_id="+$("#user_id").val();
	window.open(url, "_blank_", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");
}

/*
** 회원 가입시 필수입력 확인
*/
function go_save() {
	if ($("#user_id").val() == "") {
		alert("사용자 아이디를 입력해 주세요.");
		$("#user_id").focus();
		return false;
	} else if ($("#reid").val() == "") {
		alert("아이디 중복체크를 해주세요.");
		$("#reid").focus();
		return false;
	} else if ($("#user_password").val() == "") {
		alert("비밀번호를 입력해 주세요.");
		$("#user_password").focus();
		return false;
	} else if ($("#user_password").val() != $("#pwdCheck").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#user_password").focus();
		return false;
	} else if ($("#user_zip_num").val() == "") {
		alert("주소를 입력해 주세요.");
		$("#user_zip_num").focus();
		return false;
	} else if ($("#user_name").val() == "") {
		alert("이름을 입력해 주세요.");
		$("#user_name").focus();
		return false;
	} else if ($("#user_birth").val() == "") {
		alert("생년월일을 입력해 주세요.");
		$("#user_birth").focus();
		return false;
	} else if ($("#user_phone").val() == "") {
		alert("휴대전화를 입력해 주세요.");
		$("#user_phone").focus();
		return false;
	} else if ($("#email1").val() == "") {
		alert("이메일을 입력해 주세요.");
		$("#email1").focus();
		return false;
	} else {
		$("#join").action = "join";
		$("#join").submit();
	}
}

/*
** 회원 수정 
*/
function updateUser() {
	if ($("#user_zip_num").val() == "") {
		alert("주소를 입력해 주세요.");
		$("#user_zip_num").focus();
		return false;
	} else if ($("#user_phone").val() == "") {
		alert("휴대전화를 입력해 주세요.");
		$("#user_phone").focus();
		return false;
	} else if ($("#email1").val() == "") {
		alert("이메일을 입력해 주세요.");
		$("#email1").focus();
		return false;
	} else {
		$("#update").action = "update";
		$("#update").submit();
		alert("수정완료")
	}
}

/*
** 비밀번호 변경
*/
function changePassword() {
	if ($("#user_password").val() == "") {
		alert("새 비밀번호를 입력해 주세요.");
		$("#user_password").focus();
		return false;
	} else if ($("#user_password").val() != $("#pwdcheck").val()) {
		$("#user_password").focus();
		alert("비밀번호가 맞지 않습니다. 다시 입력해 주세요");
	} else {
		$("#pwd_form").action = "change_pwd";
		$("#pwd_form").submit();
		alert("변경된 비밀번호로 다시 로그인 하세요..");
	}
}

/*
** 마이페이지 이동
*/
function go_page() {
	if ($("#user_password").val() != $("#pwdCheck").val()) {
		$("#pwdCheck").focus();
		alert("비밀번호가 맞지 않습니다.");
		return false;	
	} else {
		$("#mypageView").action = "mypageView";
		$("#mypageView").submit();
	}
}

/*
** 우편번호 찾기 화면 요청
*/
function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                document.getElementById('user_zip_num').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullRoadAddr; 
                
				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }


/*
** 아이디 찾기 화면 요청
*/
function find_id_form() {
	var url = "find_id_form";
	window.open(url, "_self", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");	
}

/*
** 비밀번호 찾기 화면 요청
*/
function find_pwd_form() {
	var url = "find_pwd_form";
	window.open(url, "_self", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");	
}

/*
** 이메일로 아이디 찾기 요청
*/
function findMemberId1() {
	
	if ($("#user_name1").val()=="") {
		alert("이름을 입력해 주세요.");
		return false;
	} else if ($("#user_email").val()=="") {
		alert("이메일을 입력해 주세요.");
		return false;
	} else {
		var form = $("#findId1")
		form.action="find_id1";  // 컨트롤러로 요청 URL설정
		form.submit();
	}
}

/*
** 휴대전화로 아이디 찾기 요청
*/
function findMemberId2() {
	if ($("#user_name2").val()=="") {
		alert("이름22을 입력해 주세요.");
		return false;
	} else if ($("#user_phone").val()=="") {
		alert("휴대전화를 입력해 주세요.");
		return false;
	} else {
		var form = $("#findId2")
		form.action="find_id2";  // 컨트롤러로 요청 URL설정
		form.submit();
			
	}
}

/*
** 이메일로 비밀번호 찾기
*/
function findPassword1() {
	if ($("#user_id1").val() == "") {
		alert("아이디를 입력해 주세요.");
		return false;
	} else if ($("#user_name1").val() == "") {
		alert("이름을 입력해 주세요.");
		return false;
	} else if ($("#user_email").val() == "") {
		alert("이메일을 입력해 주세요.");
		return false;
	} else {
		$("#findPW1").action = "find_pwd1";  // 비밀번호 찾기 URL
		$("#findPW1").submit();
	}
}

/*
** 휴대전화로 비밀번호 찾기
*/
function findPassword2() {
	if ($("#user_id2").val() == "") {
		alert("아이디를 입력해 주세요.");
		return false;
	} else if ($("#user_name2").val() == "") {
		alert("이름을 입력해 주세요.");
		return false;
	} else if ($("#user_phone").val() == "") {
		alert("휴대전화를 입력해 주세요.");
		return false;
	} else {
		$("#findPW2").action = "find_pwd2";  // 비밀번호 찾기 URL
		$("#findPW2").submit();
	}
}
