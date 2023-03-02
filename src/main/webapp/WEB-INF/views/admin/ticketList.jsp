<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<body>
<!--예매현황 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 80rem; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        <label class="form-label " style="margin: 1rem">공연 예약 현황</label>

      <div class="container d-flex flex-wrap justify-content-center" style="margin-bottom: 0.5rem;">
        
        <form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto">
        
        <div class="row mb-3" style="margin:1pix;">
        <select class="form-select form-select-sm" name="ticketSearchCondition" id="ticketSearchCondition" style="width:auto;">
              <option selected value="play_name">공연명</option>
              <option value="user_name">예약자명</option>
              <option value="ticket_id">예매번호</option>
              <option value="pay_name">결제방식</option>
        </select>
        
        <div class="col-sm-7" style="margin:1pix;">
          <input type="search" name="ticketSearchKeyword" id="ticketSearchKeyword" class="form-control form-control-sm" aria-label="Search">
          </div>
        </div>
        </form>

       </div>

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
          
            <c:forEach items="${ticketList}" var="ticketVO">
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
<!--예매현황 끝-->
</body>
<%@ include file="../footer.jsp" %>