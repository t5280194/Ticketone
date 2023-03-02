<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<body>
<!--progress 시작
	<div class="text-center">
		<button class="btn btn-sm btn-primary" disabled
			style="width: 14rem; margin: 0.5rem; background-color: #40B2FF; opacity: 1;">관람일/회차 선택</button>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd"
				d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
  </svg>
		<button class="btn btn-sm btn-primary" disabled
			style="width: 14rem; margin: 0.5rem; background-color: #40B2FF; opacity: 1;">좌석 선택</button>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd"
				d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
  </svg>
		<button class="btn btn-sm btn-primary" disabled
			style="width: 14rem; margin: 0.5rem; background-color: #40B2FF; opacity: 1;">가격/할인</button>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd"
				d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
  </svg>
		<button class="btn btn-sm btn-primary" disabled
			style="width: 14rem; margin: 0.5rem; background-color: #40B2FF; opacity: 1;">결제하기</button>
	</div>
	progress 끝-->



<div class="container" style="max-width:35rem;">
  <div class="row">
    <div class="col-md-3 d-flex justify-content-end">
      <img src="images/site/Firecracker.png" style="width:85px">
    </div>
    <div class="col-md-auto">
    	<br>
        <figure class="text-center" style="color:white;">
			<h4>예매가 완료되었습니다.</h4>
		  <div class="text-center" style="color:white;">
		    즐거운 관람 되세요!
		  </div>
		</figure>		
    </div>

  </div>
</div>


<!--티켓확인 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; max-width: 38rem; margin: 0.1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        
        <div style="text-align: center;">
	        <a href="index"><img src="images/site/logo.png" style="width:200px; margin: 0rem 0rem 0.8rem 0rem;"></a>
    	</div>
        
        <table class="table table-light table-sm table-hover">

          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">공연정보</th>
            <td>
            <a href="play_detail?play_pseq=${ticket.play_pseq}" class="d-flex align-items-center my-2 my-lg-0 me-lg-auto text-white text-decoration-none">
            <img src="images/poster/${ticket.play_poster}" style="width:240px">
          	</a>
            <c:out value="${ticket.play_name}"/>
            </td>
          </tr>
          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">예매번호</th>
            <td><c:out value="${ticket.ticket_id}"/></td>
          </tr>
          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">예약자명</th>
            <td><c:out value="${ticket.user_name}"/></td>
          </tr>
          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">결제일시</th>
            <td><fmt:formatDate value="${ticket.buy_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
          </tr>
          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">공연장</th>
            <td><c:out value="${ticket.theater_name}"/></td>
          </tr>
          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">공연일시</th>
            <td><fmt:formatDate value="${ticket.play_schedule}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
          </tr>
          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">좌석</th>
            <td><c:out value="${ticket.ticket_seat}"/></td>
          </tr>
          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">할인내역</th>
            <td>
    		  <c:choose>
             	<c:when test="${ticket.discount_id==0}">할인없음</c:when>
             	<c:when test="${ticket.discount_id==1}">청소년 할인(중,고생/1인 1매) 30%</c:when>
             	<c:when test="${ticket.discount_id==2}">국가유공자 할인(1인 1매) 50%</c:when>
             	<c:when test="${ticket.discount_id==3}">4인 패키지 20%</c:when>
             	<c:when test="${ticket.discount_id==4}">지역 할인(1인 2매) 10%</c:when>
             	<c:when test="${ticket.discount_id==5}">장애인 (1인 1매) 50%</c:when>
             </c:choose>
            </td>
          </tr>
          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">결제방식</th>
            <td><c:out value="${ticket.pay_name}"/></td>
          </tr>
          <tr>
            <th class="center" scope="row" style="width: 7rem; vertical-align : middle;">최종결제금액</th>
            <td><fmt:formatNumber value="${ticket.pay_amount}" pattern="#,###원"/></td>
          </tr>


        </table>


      </div>
    </span>
  </div>
</div>
<!--티켓확인 끝-->

<!-- 
<h2>예매가 완료되었습니다.</h2><hr>
<form class="bookTicket5" method="POST">
	
	<c:forEach var="Discount_vipID" items="${Discount_vipID}">
		<p>${Discount_vipID}</p>
	</c:forEach>
</form>
<a href="index">메인화면으로</a>
 -->
</body>
</html>
<%@ include file="../footer.jsp"%>