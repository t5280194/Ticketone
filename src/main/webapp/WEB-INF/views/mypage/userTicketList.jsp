<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<body>
<!--티켓확인 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 80rem; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        
        <label for="play_kind" class="form-label"
							style="margin: 1rem 1rem 0rem 1rem;">나의 예매 내역</label>
        <table class="table table-sm table-striped table-hover table-secondary">
          <thead>
            <tr>
              <th scope="col">예매일시</th>
              <th scope="col">공연명</th>
              <th scope="col">예약자명</th>
              <th scope="col">좌석번호</th>
              <th scope="col">예매번호</th>
              <th scope="col">할인적용내역</th>
              <th scope="col">결제방식</th>
              <th scope="col">최종결제금액</th>
            </tr>
          </thead>
          <tbody>
          
            <c:forEach items="${userTicketList}" var="ticketVO">
	            <tr onclick="location.href='userTicket?tseq=${ticketVO.tseq}'" style="cursor: pointer;">
	              <td><fmt:formatDate value="${ticketVO.buy_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	              <th scope="row"><c:out value="${ticketVO.play_name}"/></th>
	              <td><c:out value="${ticketVO.user_name}"/></td>
	              <td><c:out value="${ticketVO.ticket_seat}"/></td>
	              <td><c:out value="${ticketVO.ticket_id}"/></td>
	              <td>
	              <c:choose>
	              	<c:when test="${ticketVO.discount_id==0}">할인없음</c:when>
	              	<c:when test="${ticketVO.discount_id==1}">청소년 할인(중,고생/1인 1매) 30%</c:when>
	              	<c:when test="${ticketVO.discount_id==2}">국가유공자 할인(1인 1매) 50%</c:when>
	              	<c:when test="${ticketVO.discount_id==3}">4인 패키지 20%</c:when>
	              	<c:when test="${ticketVO.discount_id==4}">지역 할인(1인 2매) 10%</c:when>
	              	<c:when test="${ticketVO.discount_id==5}">장애인 (1인 1매) 50%</c:when>
	              </c:choose>
	              </td>
	              <td><c:out value="${ticketVO.pay_name}"/></td>
	              <td><c:out value="${ticketVO.pay_amount}"/></td>
	            </tr>
           	</c:forEach>

          </tbody>
        </table>


      </div>
    </span>
  </div>
</div>
<!--티켓확인 끝-->
<%@ include file="../footer.jsp" %>