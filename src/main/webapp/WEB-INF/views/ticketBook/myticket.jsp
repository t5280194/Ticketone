<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <div class="side">
        <tab>
        <form class="ticketInsert" method="post">
            <h4>나의 예매 정보</h4>
            <table id="ticket_info" cellpadding="10">
                <tr height="50">
                    <th>공연</th>
                    <td>${PlayVO.play_name}
                    	<input type="hidden" id="pseq" name="play_pseq" value="${PlayVO.play_pseq}">
                    	<input type="hidden" id="play_name" name="play_name" value="${PlayVO.play_name}">
                    </td>
                </tr>
                <tr height="60">
                    <th>일정</th>
                    <td id="myticketDate">
                    	<fmt:formatDate value="${ScheduleVO.play_schedule}" type="date" dateStyle="long" /><br>
                    	<fmt:formatDate value="${ScheduleVO.play_schedule}" type="time" timeStyle="short"/>
                    	<input type="hidden" id="sseq" name="schedule_seq" value="${ScheduleVO.schedule_seq}">
                    </td>
                </tr>
                <tr height="120">
                    <th>선택 좌석</th>
                    <td>
                    	<c:forEach var="Ticket_seat" items="${Ticket_seat}">
                    		<span>${Ticket_seat}</span><br>
                    		<input type="hidden" id="ticket_seat" name="ticket_seat" value="${Ticket_seat}">
                    	</c:forEach>
                    </td>
                </tr>
                
                <tr>
                    <th>티켓 금액</th>
                    <td>
                    	<c:choose>
                    		<c:when test="${empty TotalPrice}">
                    			<span></span>
                    		</c:when>
                    		<c:otherwise>
                    			<c:if test="${not empty Total_Vip_Price}">
		                    		<span><fmt:formatNumber value="${Vip_Price}" pattern="#,###"/>원 (VIP석 ${Vip_count}매)</span>
		                    		<br>
		                    		<c:forEach var="VIP_seat" items="${VIP_seats}">
		                    			<input type="hidden" name="VIP_seats" value="${VIP_seat}">
		                    		</c:forEach>
		                   		</c:if>
		                   		<c:if test="${not empty Total_S_Price}">
		                   			<span><fmt:formatNumber value="${S_Price}" pattern="#,###"/>원 (S석 ${S_count}매)</span>
		                   			<br>
		                   			
		                   			<c:forEach var="S_seat" items="${S_seats}">
		                    			<input type="hidden" name="S_seats" value="${S_seat}">
		                    		</c:forEach>
		                   		</c:if>
		                   		<c:if test="${not empty Total_A_Price}">
		                   			<span><fmt:formatNumber value="${A_Price}" pattern="#,###"/>원 (A석 ${A_count}매)</span>
		                   			<br>
		                   			<c:forEach var="A_seat" items="${A_seats}">
		                    			<input type="hidden" name="A_seats" value="${A_seat}">
		                    		</c:forEach>
		                   		</c:if>
                    		</c:otherwise>
                    	</c:choose>
                    </td>
                </tr>
                <tr>
                    <th>할인</th>
                    <td>	
                    	<c:if test="${Total_Vip_Price != 0}">
                    		<input type="hidden" name="Discounted_Vip_Id" value="${Discounted_Vip_Id}">
                    		<input type="hidden" name="Discounted_Vip_Name" value="${Discounted_Vip_Name}">
                    		<input type="hidden" name="Discounted_Vip_Amount" value="${Discounted_Vip_Amount}">
                    		
                    		<c:set var="Vip_name" value="${fn:split(Discounted_Vip_Name,',')}"/>
                    		<c:set var="Vip_amount" value="${fn:split(Discounted_Vip_Amount,',')}"/>
                    		<c:forEach items="${Discounted_Vip_Price}" var="Discount_Vip_Price" varStatus="vip">
                    			<span>-<fmt:formatNumber value="${Discount_Vip_Price}" pattern="#,###"/>
                    			(VIP석 ${Vip_name[vip.index]} ${Vip_amount[vip.index]}매)</span><br>
                    			<input type="hidden" name="Discounted_Vip_Price" value="${Discount_Vip_Price}">
                    		</c:forEach>
                    	</c:if>
                    	
                    	<c:if test="${Total_S_Price != 0}">
                    		<input type="hidden" name="Discounted_S_Id" value="${Discounted_S_Id}">
                    		<input type="hidden" name="Discounted_S_Name" value="${Discounted_S_Name}">
                    		<input type="hidden" name="Discounted_S_Amount" value="${Discounted_S_Amount}">
                    		
                    		<c:set var="S_name" value="${fn:split(Discounted_S_Name,',')}"/>
                    		<c:set var="S_amount" value="${fn:split(Discounted_S_Amount,',')}"/>
                    		<c:forEach items="${Discounted_S_Price}" var="Discount_S_Price" varStatus="s">
                    			<span>-<fmt:formatNumber value="${Discount_S_Price}" pattern="#,###"/>
                    			(S석 ${S_name[s.index]} ${S_amount[s.index]}매)</span><br>
                    			<input type="hidden" name="Discounted_S_Price" value="${Discount_S_Price}">
                    		</c:forEach>
                    	</c:if>
                    	
                    	<c:if test="${Total_A_Price != 0}">
                    		<input type="hidden" name="Discounted_A_Id" value="${Discounted_A_Id}">
                    		<input type="hidden" name="Discounted_A_Name" value="${Discounted_A_Name}">
                    		<input type="hidden" name="Discounted_A_Amount" value="${Discounted_A_Amount}">
                    		
                    		<c:set var="A_name" value="${fn:split(Discounted_A_Name,',')}"/>
                    		<c:set var="A_amount" value="${fn:split(Discounted_A_Amount,',')}"/>
                    		<c:forEach items="${Discounted_A_Price}" var="Discount_A_Price" varStatus="a">
                    			<span>-<fmt:formatNumber value="${Discount_A_Price}" pattern="#,###"/>
                    			(A석 ${A_name[a.index]} ${A_amount[a.index]}매)</span><br>
                    			<input type="hidden" name="Discounted_A_Price" value="${Discount_A_Price}">
                    		</c:forEach>
                    	</c:if>
                    </td>
                </tr>
                
                <tr style="border-top: 2px solid  #333; font-size: large;">
                    <th>총 결제 금액</th>
                    <td><fmt:formatNumber value="${TotalPrice}" pattern="#,###"/>원</td>
                </tr>
            </table>
            <input type="hidden" id="payID" name="payID" value="0">
            <input type="hidden" id="payName" name="payName" value="0">
        </form>
        </tab>
    </div>
