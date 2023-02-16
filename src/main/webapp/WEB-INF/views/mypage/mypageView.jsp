<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<script type="text/javascript" src="user/user.js"></script>
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
		<input type="submit" value="확인" class="btn btn-sm btn-outline-secondary" onclick="go_page()">
		<input type="button" value="취소" class="btn btn-sm btn-outline-secondary" onclick="location='../biz/index.html'">
    </form>
<%@ include file="../footer.jsp" %>