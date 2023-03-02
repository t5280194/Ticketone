<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>
<!-- <script type="text/javascript" src="mypage/mypage.js" charset="UTF-8"></script>--><!-- utf-8추가 -->
<script type="text/javascript" src="js/mypage.js"></script><!-- 위치 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>

<!--card 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 38rem; margin: 0.1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        		
				<form method="post" name="formm" action="mypage" id="mypage" align="center">
					<h2 >마이 페이지</h2>
					<nav id="sub_menu">
					    <ul>
					      <li style="list-style:none;"><a class="nav-link text-white" href="userTicketList?user_id=${sessionScope.loginUser.user_id}">나의 예매 내역</a></li>
					      <li style="list-style:none;"><a href="updateUser_form" class="nav-link text-white">회원 정보 수정</a></li>
					      <li style="list-style:none;"><a href="changePwd_form" class="nav-link text-white">비밀번호 변경</a></li>
					      <li style="list-style:none;"><a class="nav-link text-white" href="delete_form">회원 탈퇴</a></li>
					    </ul>
					</nav>
				</form>
        
    	</div>
    </span>
  </div>
</div>
<!--card 끝-->




<%@ include file="../footer.jsp" %>

