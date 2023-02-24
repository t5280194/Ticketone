<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!--flatpicker.css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!--flatpicker themes-->
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
	
<link rel="stylesheet" href="css/date.css">
<body>
    <div class="ticket_top">
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
<input type="hidden" id="VIP_seat" value="${Theater.seat_vip}">
<input type="hidden" id="S_seat" value="${Theater.seat_s}">
<input type="hidden" id="A_seat" value="${Theater.seat_a}">
<input type="hidden" id="pseq" value="${PlayVO.play_pseq}">
<input type="hidden" id="name" value="${PlayVO.play_name}">
<form class="bookTicket1" method="GET">
    <div id="select_day">
    	<h3>관람일 선택<input type="text" value="${PlayVO}"></h3>
    	
    	<div style="width: 18rem; margin: 1rem;">
			<input id="date-time-picker" name="########"
			placeholder="공연날짜를 선택하세요.">
		</div>
    	
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
							<c:when test="${(month == Play_month[1]) && (j == Play_day[i])}">
								<td>
									<input class="getDay" type="hidden" value="0">
									<span class="selectDay" data-day="${j}">${j}</span>
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
		<ul id="seats">
			
		</ul>
    </div>
    
    <input type="hidden" id="pseq" name="play_pseq" value="${PlayVO.play_pseq}">
    <input type="hidden" id="sseq" name="schedule_seq" value="0">
</form>
<%@ include file="myticket.jsp" %>
<div class="next">
	<input type="button" class="btn_next" value="다음 단계" onClick="saveDate()">
</div>
</body>

<script type="text/javascript">
$(document).ready(function(){
	$(".selectDay").click(getTimeList);	// 날짜 버튼 클릭 시 아래 함수 실행
});
function getTimeList(){
	var a_day = $(this).data('day');
	if(a_day != day){
		$('.selectDay').removeClass('selected');
	}
	var day = $(this).data('day');
	//$(this).closest('td').find('.getDay').val(day);
	$(this).toggleClass('selected');
	
	$.ajax({
		type: "GET",
		url: "get_time",
		data: {
			seq : $("#pseq").val(),
			name : $("#name").val(),
			day : day,
		},
		success: function(data){
			// 실행전에 모든 리스트 제거
			$("#time_list").find("li").remove();
			// 회차 리스트 생성
			for(i=0; i<data.length; i++) {
				/*var html = "<li>" + "<button type='button' class='getSeat' data-time='"+ data[i] +"'>"
							+ data[i] + "</button>" + "</li>"
							*/
				var html = "<li>" + "<p class='selectTime' data-time='"+ data[i] +"'>"+ data[i]
							+ "</p>" + "</li>"
				
				$("#time_list").append(html);
			}
		}
	})
	
	$(document).on('click', '.selectTime', function(){
		var a_time = $(this).data('time');
		if(a_time != time){
			$('.selectTime').removeClass('selected');
		}
		var time = $(this).data('time');
		$(this).toggleClass('selected');
		
		var pseq = $("#pseq").val();
		var name = $("#name").val();
		var vip = $("#VIP_seat").val();
		var s = $("#S_seat").val();
		var a = $("#A_seat").val();
		
		$.ajax({
			type: "POST",
			url: "get_seat",
			//async: false,
			data: {
				seq : $("#pseq").val(),
				name : name,
				day : day,
				time : time
			},
			success: function(result){
				
				// vo리턴값 객체 리스트 처리
				var values = result;
				var seq = 0;
				$.each(values, function(index, value){
					$("#seats").find("li").remove();
					
					console.log("value.seat_vip=" + value.vip_count);
					console.log("value.seat_s=" + value.s_count);
					console.log("value.seat_a=" + value.a_count);
					
					seq = value.schedule_seq;
					console.log("seq=" + seq);
					
					var html = "<li>"+ "VIP석 | " + (vip - value.vip_count) + "석" + "</li>"
							+ "<li>"+ "S석 | " + (s - value.s_count) + "석" + "</li>"
							+ "<li>"+ "A석 | " + (a - value.a_count) + "석" + "</li>"
					
					$("#seats").append(html);
					$('#sseq').val(seq);
					//saveDate();
				})
				/*
				function saveDate(){
					console.log("seq: "+seq);
					$.ajax({
						type: "POST",
						url: "save_date",
						data: {seq : seq},
						dataType: "json",
						success: function(response){
							//var date = response;
							console.log(response.Schdule);
							console.log(response.PlayDate);
							
							var date = response.Schdule;
							$('#ddd').val(date.schedule_seq);
							//$('#myticketDate').html(date);
						}
					})
				}
				*/
			}
		})
	})
}

function saveDate(){
	if($('#sseq').val() == 0){
		alert("회차를 선택해 주세요!");
		return false;
	}
	
	$(".bookTicket1").attr("action", "book_ticket2");
	$(".bookTicket1").submit();
}
</script>

<!--Jquery.js-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- flatpicker min js -->
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<!-- flatpicker ko -->
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script>
var date = ['2023-02-25', '2023-02-28'];


function day() {
    
	for(int i=0; i<date.length; i++){
		return date[i];
	}
}
	// 플랫핏커
	$("#date-time-picker").flatpickr({
		
		enableTime : false, // 시간 선택 여부
		altInput : true, // 기존 입력을 숨기고 새 입력을 만듦
		altFormat : 'Y-m-d', // 날짜 선택 후 표시 형태
		dateFormat : 'Y-m-d', // date format 형식
		minDate : 'today', // 최소 선택 시간
		locale : 'ko', // 한국어
		time_24hr : true, // 24시간 형태
		inline: true,	//항상 달력 보임
		disableMobile : true,	// 모바일 지원
		enable: [day()]
	 
	});
</script>

<!--flatpicker cdn-->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<%@ include file="../footer.jsp"%>