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