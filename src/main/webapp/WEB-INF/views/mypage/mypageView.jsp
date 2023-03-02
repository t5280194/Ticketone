<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<!-- <script type="text/javascript" src="mypage/mypage.js" charset="UTF-8"></script>--><!-- utf-8추가 -->
<script type="text/javascript" src="js/mypage.js"></script><!-- 위치 -->




<!--card 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; max-width: 38rem; margin: 0.1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        		
			    <form id="mypageView" action="mypageView" method="post" name="formm" align="center">
			    <h2>마이 페이지 확인</h2><hr>   
			        정보를 안전하게 보호하기 위해 <p style= color:red>비밀번호를 다시 한 번 확인합니다.<p>
					비밀번호가 타인에게 노출되지 않도록 항상 주의해주세요.
			        <br>
				<table align="center">
				<tr>
				<td><input type="hidden" class="form-control" name="user_password" id="user_password" value="${sessionScope.loginUser.user_password}"></td>
				</tr>
				<tr>
				<td><input type="password" class="form-control" name="pwdCheck" id="pwdCheck" placeholder="비밀번호 확인"></td>
				</tr>
				</table> 
					<input type="submit" value="확인" class="btn btn-primary" onclick="go_page()">
					<input type="button" value="취소" class="btn btn-primary" onclick="location='../biz/index.html'">
			    </form>
        
    	</div>
    </span>
  </div>
</div>
<!--card 끝-->
<script type="text/javascript">
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
</script>




<%@ include file="../footer.jsp" %>