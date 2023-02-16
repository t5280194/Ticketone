<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

    <div id="ticket_top">
        <ul>
            <li style="border: 1px solid black; background-color: #c0c0c0;">관람일/회차 선택</li>
            <li>-></li>
            <li style="border: 1px solid black;">좌석 선택</li>
            <li>-></li>
            <li style="border: 1px solid black;">가격/할인</li>
            <li>-></li>
            <li style="border: 1px solid black;">결제하기</li>
        </ul>
    </div>
 
<input type="hidden" id="pseq" value="${PlayVO.play_pseq}">
<input type="hidden" id="name" value="${PlayVO.play_name}">
<div class="bookTicket1">
    <div id="select_day">
    	<h3>관람일 선택</h3>
		<table id="calender">
			<caption> ${year}년 ${month}월</caption>
			<tr class="title">
				<th>일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th>토</th>
			</tr>
			<tr>		
				<c:forEach var="i" varStatus="gap" begin="1" end="${firstDate}">
					<td>&nbsp;</td>
				</c:forEach>	
				
				<c:set var="i" value="0" />
				<c:forEach var="j" varStatus="date" begin="1" end="${lastDate}">
						<c:choose>
							<c:when test="${(month == Play_month[0]) && (j == Play_day[i])}">
								<td>
									<button type="button" class="getTime" data-day="${j}">${j}</button>
									<c:set var="i" value="${i=i+1}"/>
								</td>
							</c:when>
								
							<c:otherwise>
								<td>${j}</td>
							</c:otherwise>
						</c:choose>
					
					<c:if test="${(j + firstDate) % 7 == 0}">
						<tr></tr>
					</c:if>
				</c:forEach>
			</tr>
		</table>
    </div>
    
    <div id="select_time">
    	<h3>회차 (관람시간)</h3>
    	<ul id="time_list">

    	</ul>
    </div>
    
    <div id="seats_info">
    	<h3>좌석등급/잔여석</h3>
    	<div>
    	<ul id="seats">
    	
    	</ul>
    	</div>
    </div>
</div>
<%@ include file="myticket.jsp" %>
<div class="next">
	<a href="book_ticket2?play_pseq=${PlayVO.play_pseq}">
	<button type="submit" class="btn_next">다음 단계</button></a>
</div>
</body>

<script type="text/javascript">
$(document).ready(function(){
	$(".getTime").click(getTimeList);	// 날짜 버튼 클릭 시 아래 함수 실행
	$(".getSeat").click(getSeatInfo);
});
function getTimeList(){
	var day = $(this).data('day');
	$(this).closest('td').find('.getDay').val(day);
	console.log(day);
	
	$.ajax({
		type: "GET",
		url: "get_time",
		data: {
			pseq : $("#pseq").val(),
			name : $("#name").val(),
			day : day
		},
		success: function(data){
			// 실행전에 모든 리스트 제거
			$("#time_list").find("li").remove();
			// 회차 리스트 생성
			for(i=0; i<data.length; i++) {
				var html = "<li>" + "<button type='button' class='getSeat' data-time='"+ data[i] +"''>"
							+ data[i] + "</button>" + "</li>"
				
				$("#time_list").append(html);
			}
		}
	})
}
function getSeatInfo(){
	var time = $(this).data('time');
	console.log(time);
	
	$.ajax({
		type: "GET",
		url: "get_seat",
		date:{
			pseq : $("#pseq").val(),
			name : $("#name").val(),
			//day : day,
			time : time
		},
		success: function(result){
			$("#seats").find("li").remove();
			
			var html = "<li>" + VIP | result[0] + "</li>"
						+ "<li>" + S | result[1] + "</li>"
						+ "<li>" + A | result[2] + "</li>"
			
			$("#seats").append(html);
		}
	})
}

</script>
</html>

