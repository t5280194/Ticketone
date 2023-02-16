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
	<script type="text/javascript" src="user/user.js"></script>
	</head>
	<body>
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
		<td align="center" colspan="2"><input type="button" value="확인" onclick="findMemberId1()" class="btn btn-sm btn-outline-secondary"></td>
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
		<td align="center" colspan="2"><input type="button" value="확인" onclick="findMemberId2()" class="btn btn-sm btn-outline-secondary"></td>
	</tr>
	</table>
	</form>
</body>
<%@ include file="../footer.jsp" %>
</html>