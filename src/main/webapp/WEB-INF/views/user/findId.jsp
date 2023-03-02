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
	<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<!-- <script type="text/javascript" src="user/user.js" charset="UTF-8"></script>--><!-- utf-8추가 -->
<script type="text/javascript" src="user.js"></script><!-- 위치 -->
	</head>
	<body>
	
<!--card 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; max-width: 38rem; margin: 0.1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        		
			      	<h1 align="center">아이디 찾기</h1>
				  	<hr>
					<form name="findId1" id="findId1" action="find_id1" method="post" align="center">
					<h2>등록된 이메일로 찾기</h2>
					<table align="center">
					<tr>	
						<td><input class="form-control" type="text" name="user_name" id="user_name1" value="" placeholder="이름"></td>
					</tr>	
					<tr>
						<td><input class="form-control" type="text" name="user_email" id="user_email" value="" placeholder="이메일"></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><input type="button" value="확인" onclick="findMemberId1()" class="btn btn-sm btn-primary"></td>
					</tr>
					</table>
					</form><br><br>
					
					<form name="findId2" id="findId2" action="find_id2" method="post" align="center">
					<h2>등록된 휴대전화로 찾기</h2>
					<table align="center">
					<tr>	
						<td><input class="form-control" type="text" name="user_name" id="user_name2" value="" placeholder="이름"></td>
					</tr>	
					<tr>
						<td><input class="form-control" type="text" name="user_phone" id="user_phone" value="" placeholder="휴대전화"></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><input type="button" value="확인" onclick="findMemberId2()" class="btn btn-sm btn-primary"></td>
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
</script>
<%@ include file="../footer.jsp" %>
</html>