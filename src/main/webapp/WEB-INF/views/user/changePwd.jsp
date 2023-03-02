<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>   
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<!-- <script type="text/javascript" src="user/user.js" charset="UTF-8"></script>--><!-- utf-8추가 -->
<script type="text/javascript" src="user.js"></script><!-- 위치 -->
</head>
<body>

<!--card 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 38rem; margin: 0.1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        		
				  <form method="post" name="formm" action="change_pwd" id="pwd_form" align="center" >
				  <h2>비밀번호 변경</h2>
					  <table align="center">
					  <tr>
					  <td><input class="form-control" type=text name="user_id" value="${sessionScope.loginUser.user_id}" readonly="readonly"></td>
					  </tr>
					  <tr>
					  <td><input class="form-control" type="password"  name="user_password" id="user_password" placeholder="새 비밀번호"></td>
					  </tr>
					  <tr>
					  <td><input class="form-control" type="password"  name="pwdCheck" id="pwdcheck" placeholder="새 비밀번호 확인"><br></td>
					  </tr>
					  <tr>
					  <td><input type="button" value="확인" class="btn btn-primary" onclick="changePassword()">
					  <input type="button" value="취소" class="btn btn-primary" onclick="location='../biz/index.html'"></td>
					  </tr>
					  </table>
				  </form>
        
    	</div>
    </span>
  </div>
</div>
<!--card 끝-->

<script type="text/javascript">
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


<%@ include file="../footer.jsp" %>