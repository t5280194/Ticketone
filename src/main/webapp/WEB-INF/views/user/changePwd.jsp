<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>   
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<script type="text/javascript" src="user/user.js"></script>
</head>
<body>
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
	  <td><input type="button" value="확인" class="btn btn-sm btn-outline-secondary" onclick="changePassword()">
	  <input type="button" value="취소" class="btn btn-sm btn-outline-secondary" onclick="location='../biz/index.html'"></td>
	  </tr>
	  </table>
  </form>
<%@ include file="../footer.jsp" %>