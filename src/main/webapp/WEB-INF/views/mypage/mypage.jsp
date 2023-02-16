<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="user/user.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<form method="post" name="formm" action="mypage" id="mypage" align="center">
	<h2 >마이 페이지</h2>
	<nav id="sub_menu">
	    <ul>
	      <li><a href="#">예매 확인</a></li>
	      <li><a href="updateUser_form" class="nav-link text-white">회원 정보 수정</a></li>
	      <li><a href="changePwd_form" class="nav-link text-white">비밀번호 변경</a></li>
	      <li><a href="delete_form">회원 탈퇴</a></li>
	    </ul>
	</nav>
</form>
<%@ include file="../footer.jsp" %>

