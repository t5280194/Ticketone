<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>
<!-- <script type="text/javascript" src="user/user.js" charset="UTF-8"></script>--><!-- utf-8추가 -->
<script type="text/javascript" src="user.js"></script><!-- 위치 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>


<!--card 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 38rem; margin: 0.1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        		
					<form id="delete" action="delete" method="post" name="formm" align="center">
					<h2 >회원탈퇴</h2>
						<table align="center">
				        	<tr>
					        	<td><input type="hidden" class="form-control" name="user_id"  id="user_id" value="${sessionScope.loginUser.user_id}"></td>
				        	</tr>
				        	<tr>
				        		<td><input type="hidden" class="form-control" name="user_password" id="user_password" value="${sessionScope.loginUser.user_password}"></td>
				        	</tr>
				        	<tr>
				        		<td><input type="password" class="form-control" placeholder="비밀번호 확인" name="pwdCheck" id="pwdCheck"/></td>
				        	</tr>
				        	<tr>
				        		<td><input type="button" value="회원 탈퇴" class="btn btn-primary" onclick="go_delete()">
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
</script>



<%@ include file="../footer.jsp" %>
  