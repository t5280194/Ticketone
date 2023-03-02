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

// 댓글 입력
function reply_insert() {
	var name = "${sessionScope.loginUser.user_name}";
	if(name == null) {
		$("#insertReply").action = "insertReply";
		$("#insertReply").submit();
	} else {
		alert("로그인 하세요");
		return false;
	}
}