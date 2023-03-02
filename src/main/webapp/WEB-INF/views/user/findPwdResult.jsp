<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<!-- <script type="text/javascript" src="user/user.js" charset="UTF-8"></script>--><!-- utf-8추가 -->
<script type="text/javascript" src="user.js"></script><!-- 위치 -->
<style type="text/css">
body{   
  background-color:#B96DB5;
  font-family: Verdana;
}
#wrap{     
  margin: 0 20px;
}
h1 {
  font-family: "Times New Roman", Times, serif;
  font-size: 45px;
  color: #CCC;
  font-weight: normal;
}
label {
	display: inline-block;
    width: 150px;
}
</style>
<script type="text/javascript">
function idok(){
	var url = "find_pwd_form";
	window.open(url, "_self", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");
}
</script>
</head>
<body>
<div id="wrap" align="center">
  <h1>비밀번호 찾기 결과</h1>
  <form method="post" name="formm" action="change_pwd" id="pwd_form" style="margin-right:0" >
    <input class="form-control" type=text name="user_id" value="${id}" readonly="readonly">   
    <div style="margin-top: 20px">   
      <c:if test="${message == 1}">
        <input class="form-control" type="password"  name="user_password" id="user_password" placeholder="새 비밀번호">
        <input class="form-control" type="password"  name="pwdCheck" id="pwdcheck" placeholder="새 비밀번호 확인"><br> 
        <input type="button" value="확인" class="btn btn-sm btn-outline-secondary" onclick="changePassword()">
      </c:if>
         <input type="button" value="확인" class="btn btn-sm btn-outline-secondary" onclick="idok()">
    </div>
  </form>
</div>  
</body>
<script type="text/javascript">
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
</script>
</html>




<%@ include file="../footer.jsp" %>