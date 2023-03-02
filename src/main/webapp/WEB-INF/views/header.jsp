<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
  <meta charset="UTF-8">
  <title>Ticketone</title>
  
  <link rel="stylesheet" href="css/ticket.css">
  <!-- 
  <link rel="stylesheet" href="css/date.css">
  <link rel="stylesheet" href="css/seat.css">
  <link rel="stylesheet" href="css/price.css">
  <link rel="stylesheet" href="css/purchase.css">
   -->
   <!-- TOP/Bottom 버튼 시작 (폰트어썸 CDN 링크) -->	
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">

  <script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
  <style>
    body{background-image:url(images/site/bg.jpg)}
    
/* TOP/BOTTOM 버튼 시작 (CSS, 버튼 스타일) */
#topBtn {
    display: none;
    position: fixed;				/* 위치 옵션 - fixed(고정) */
    right: 50px;				/* 오른쪽 여백 */
    bottom: 65px;				/* 아래 여백 */
    transform: scale(0.7);
    -webkit-transform: scale(0.7);
    transform-origin: right bottom;		/* 정렬 옵션 - 오른쪽/아래 정렬 */
    -webkit-transform-origin: right bottom;
}

#topBtn ul li {
    width: 50px;				/* 버튼 넓이 (가로) */
    height: 50px;				/* 버튼 높이 (세로) */
    margin: 5px;				/* 버튼 사이 간격 */
    font-size: 25px;				/* 버튼 내 TEXT 크기 */
    line-height: 50px;				/* 버튼 높이 (세로) */
    text-align: center;				/* 버튼 내 TEXT 정렬 */
    list-style: none;
}

#topBtn ul li a {
    display: block;							
    border: 1px solid #fff;
    border-radius: 5px;
    color: #fff;
    background-color: #555;
    transition: all 0.2s;
    opacity: 0.5;
}

#topBtn ul li a:hover {	/* 버튼에 위치했을 때 색상설정  */
    background-color: #40B2FF;
    cursor: pointer;
    opacity: 1;
}
/* TOP/BOTTOM 버튼 끝 (CSS, 버튼 스타일) */
  </style>
  <!-- 부트스트랩 css -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        
</head>

 <!-- nav바 -->
  <header>
    <div class="px-3 py-2 bg-dark text-white">
      <div class="container">
        <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
          <a href="index" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
            <img src="images/site/logo.png" style="width:180px">
          </a>

          <ul class="nav col-12 col-lg-auto my-2 justify-content-center my-md-0 text-small">
            
            <c:choose>
            	<c:when test="${empty sessionScope.loginUser}">
         		    <li><a href="login_form" class="nav-link text-white">로그인</a></li>
		            <li><a href="contract" class="nav-link text-white">회원가입</a></li>
					<li><a href="login_form" class="nav-link text-white">마이페이지</a></li>
	      		 	<!-- <li><a href="login_form" class="nav-link text-white">좋아요</a></li>-->
            	</c:when>
            	<c:when test="${loginUser.admin_id != null}">
            		<li><div class="nav-link" style="color:#40B2FF"><b>${sessionScope.loginUser.admin_id}님</b></div></li>
		      		<li><a href="add_play1" class="nav-link text-white">공연 등록</a></li>
		      		<li><a href="replyList" class="nav-link text-white">댓글 관리</a></li>
		      		<li><a href="ticketList" class="nav-link text-white">공연 예약 현황</a></li>
		      		<!-- <li><a href="#" class="nav-link text-white">공연 관리 로그 미완</a></li> -->
		            <li><a href="logout" class="nav-link text-white">로그아웃</a></li>
            	</c:when>
            	<c:otherwise>
            	<li><div class="nav-link" style="color:#40B2FF"><b>${sessionScope.loginUser.user_name}(${sessionScope.loginUser.user_id})님</b></div></li>
					<li><a href="userTicketList?user_id=${sessionScope.loginUser.user_id}" class="nav-link text-white">나의 예매 내역</a></li>
					<li><a href="mypageView_form" class="nav-link text-white">마이페이지</a></li>
					<!-- <li><a href="#" class="nav-link text-white">좋아요</a></li>-->
					<li><a href="logout" class="nav-link text-white">로그아웃</a></li>
            	</c:otherwise>
            </c:choose>



          </ul>
        </div>
      </div>
    </div>
    <div class="px-3 py-2 border-bottom mb-3">
      <div class="container d-flex flex-wrap justify-content-center">
        <form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto" style="width : 11.2rem; margin: 1px;" action="search">
          <input type="search" name="play_name" class="form-control form-control-sm" placeholder="제목 검색..." aria-label="Search">
        </form>

        <div class="text-end">
          <a href="category?play_kind=뮤지컬" type="button" class="btn btn-sm btn-outline-secondary" style="width:7rem; color:#40B2FF">뮤지컬</a>
          <a href="category?play_kind=콘서트" type="button" class="btn btn-sm btn-outline-secondary" style="width:7rem; color:#40B2FF">콘서트</a>
          <a href="category?play_kind=연극" type="button" class="btn btn-sm btn-outline-secondary" style="width:7rem; color:#40B2FF">연극</a>
          <a href="category?play_kind=클래식/무용" type="button" class="btn btn-sm btn-outline-secondary" style="width:7rem; color:#40B2FF">클래식/무용</a>

        </div>
      </div>
    </div>
  </header>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- nav 끝 -->
<body style="height: 100%; display: flex; flex-direction: column;">
<main style="flex: 1;">