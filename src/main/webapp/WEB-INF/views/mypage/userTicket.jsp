<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<body>
<!--티켓확인 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; max-width: 38rem; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        
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
<%@ include file="../footer.jsp" %>