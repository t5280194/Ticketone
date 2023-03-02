<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!--flatpicker.css-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<!--flatpicker themes-->
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">

<link rel="stylesheet" href="css/date.css">
<body>
	<!--progress 시작-->
	<div class="text-center">
		<button class="btn btn-sm btn-primary" disabled
			style="width: 14rem; margin: 0.5rem; background-color: #40B2FF; opacity: 1;">관람일/회차 선택</button>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd"
				d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
  </svg>
		<button class="btn btn-sm btn-outline-secondary" disabled
			style="width: 14rem; margin: 0.5rem; color: #40B2FF; opacity: 1;">좌석 선택</button>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd"
				d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
  </svg>
		<button class="btn btn-sm btn-outline-secondary" disabled
			style="width: 14rem; margin: 0.5rem; color: #40B2FF; opacity: 1;">가격/할인</button>
		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
			fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd"
				d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
  </svg>
		<button class="btn btn-sm btn-outline-secondary" disabled
			style="width: 14rem; margin: 0.5rem; color: #40B2FF; opacity: 1;">결제하기</button>
	</div>
	<!--progress 끝-->

	<!-- card 시작 -->
	<div class="d-flex justify-content-center">
		<div class="card" style="background-color: transparent; color: white; width: 70rem; margin: 1rem;">
			<span class="border border-white border border-2 rounded">
				<div class="card-body">

					<input type="hidden" id="VIP_seat" value="${Theater.seat_vip}">
					<input type="hidden" id="S_seat" value="${Theater.seat_s}">
					<input type="hidden" id="A_seat" value="${Theater.seat_a}">
					<input type="hidden" id="pseq" value="${PlayVO.play_pseq}">
					<input type="hidden" id="name" value="${PlayVO.play_name}">
					
					<form class="bookTicket1" method="GET">
					
<div class="container text-center">
  <div class="row align-items-start">
    <div class="col d-flex justify-content-center">	<!-- col1 -->
    	<div id="select_day">
											
											<label for="AAAAA" class="form-label"
												style="margin: 1rem 1rem 0.5rem 1rem;">관람일 선택</label>

												
												<c:if test="${month < 10}">
													<c:set var="months">0${month}</c:set>
												</c:if>
											<!--<a href="book_ticket1?play_pseq=${PlayVO.play_pseq}&year=${year}&month=${month+1}">다음 달</a>-->
											<table id="calender">
												<!-- <caption>${year}년 ${month}월</caption> -->
												<tr style="height:2.7rem; background-color:#40B2FF; padding:4px; margin:10px; border-bottom: 0.15rem solid white;">
													<td>
														<a href="book_ticket1?play_pseq=${PlayVO.play_pseq}&year=${year}&month=${month-1}">
													
													<svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor" class="bi bi-arrow-left-circle" style="color:white;" viewBox="0 0 16 16">
													  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-4.5-.5a.5.5 0 0 1 0 1H5.707l2.147 2.146a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 1 1 .708.708L5.707 7.5H11.5z"/>
													</svg>
													
														</a>
													</td>
													<td colspan="5" scope="col">${year}년 ${month}월</td>
													<td>
													<a href="book_ticket1?play_pseq=${PlayVO.play_pseq}&year=${year}&month=${month+1}">
													
											<svg xmlns="http://www.w3.org/2000/svg" width="21" height="21" fill="currentColor" class="bi bi-arrow-right-circle" style="color:white;" viewBox="0 0 16 16">
											  <path fill-rule="evenodd" d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z"/>
											</svg>
													
													</a>
													</td>
												</tr>
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
													<c:forEach var="day" varStatus="date" begin="1" end="${lastDate}">
														<c:choose>
															<c:when test="${day < 10}">
																<c:set var="month_day">${months}-0${day}</c:set>
																<input class="dd" type="hidden" value="${month_day}">
															</c:when>
															<c:otherwise>
																<c:set var="month_day">${months}-${day}</c:set>
																<input class="dd" type="hidden" value="${month_day}">
															</c:otherwise>
														</c:choose>
													
														<c:set var="loop" value="false"/>
															<c:forEach items="${Play_date}" var="Play_date">
																<c:if test="${Play_date == month_day}">
																	<td>
																		<input class="dd" type="hidden" value="${month_day}">
																		<input class="getDay" type="hidden" value="0">
																		<span class="selectDay" data-day="${Play_date}">${day}</span>
																		<c:set var="loop" value="true"/>
																	</td>
																</c:if>
															</c:forEach>
															<c:if test="${loop == false}">
																<td><input class="dd" type="hidden" value="${month_day}">
																${day}</td>
															</c:if>
														
														<c:if test="${(day + firstDate) % 7 == 0}">
															<tr></tr>
														</c:if>
													</c:forEach>
												</tr>
											</table>
										</div>
    </div>
    <div class="col d-flex justify-content-center"><!-- col2 -->
      <br>
				      
				<div class="container">
				  <div class="row row-cols-1">
				    <div class="col d-flex justify-content-center">
						      <div id="select_time">
								
									<label for="AAAAA" class="form-label"
										style="margin: 1rem 1rem 0.5rem 1rem;">공연 시간</label>
									<ul id="time_list">
									
									</ul>
								</div>
				    </div>
				    <div class="col d-flex justify-content-center">
								<div id="seats_info">
									<label for="AAAAA" class="form-label"
										style="margin: 1rem 1rem 0.5rem 1rem;">좌석등급|잔여석</label>
									<ul id="seats">
						
									</ul>
								</div>
				    </div>
				
				  </div>
				</div>
		     
			
			

    </div>
    <div class="col">	<!-- col3 -->
    
		<div class="container">
		  <div class="row row-cols-1">
		    <div class="col d-flex justify-content-center">
		    					<br>
						      <input type="hidden" id="pseq" name="play_pseq"
									value="${PlayVO.play_pseq}">
								<input type="hidden"
									id="sseq" name="schedule_seq" value="0">
								<%@ include file="myticket.jsp"%>
		    </div>
		    <div class="col d-flex justify-content-end">
						<div class="d-flex justify-content-end">
							<br>
							<a type="button" class="btn btn-sm" id="nextButton"
								style="width: 4rem; margin: 0.5rem; background-color: #40B2FF;"
								onClick="saveDate()">다음</a>
						</div>
		    </div>
		  </div>
		</div>

							     
    </div>
  </div>
</div>
</form>

					

				</div>
			</span>
		</div>
	</div>
	<!-- card 끝 -->


</body>

<script type="text/javascript">
	$(document).ready(function() {
		$(".selectDay").click(getTimeList); // 날짜 버튼 클릭 시 아래 함수 실행
	});
	function getTimeList() {
		var a_day = $(this).data('day');
		if (a_day != day) {
			$('.selectDay').removeClass('selected');
		}
		var day = $(this).data('day');
		console.log("선택날짜: "+ day);
		
		//$(this).closest('td').find('.getDay').val(day);
		$(this).toggleClass('selected');

		
				$.ajax({
					type : "GET",
					url : "get_time",
					data : {
						seq : $("#pseq").val(),
						name : $("#name").val(),
						day : day
					},
					success : function(data) {
						// 실행전에 모든 리스트 제거
						$("#time_list").find("li").remove();
						// 회차 리스트 생성
						for (i = 0; i < data.length; i++) {
							/*var html = "<li>" + "<button type='button' class='getSeat' data-time='"+ data[i] +"'>"
										+ data[i] + "</button>" + "</li>"
							 */
							var html = "<li>"
									+ "<p class='selectTime' data-time='"+ data[i] +"'>"
									+ data[i] + "</p>" + "</li>"

							$("#time_list").append(html);
						}
					}
				})

		$(document).off().on(
				'click',
				'.selectTime',
				function() {
					var a_time = $(this).data('time');
					if (a_time != time) {
						$('.selectTime').removeClass('selected');
					}
					var time = $(this).data('time');
					$(this).toggleClass('selected');
					
					console.log("날짜: "+ day);
					console.log("시간: "+ time);

					var pseq = $("#pseq").val();
					var name = $("#name").val();
					var vip = $("#VIP_seat").val();
					var s = $("#S_seat").val();
					var a = $("#A_seat").val();

					$.ajax({
						type : "POST",
						url : "get_seat",
						//async: false,
						data : {
							seq : $("#pseq").val(),
							name : name,
							day : day,
							time : time
						},
						success : function(result) {

							// vo리턴값 객체 리스트 처리
							var values = result;
							var seq = 0;
							$.each(values, function(index, value) {
								$("#seats").find("li").remove();

								console
										.log("value.seat_vip="
												+ value.vip_count);
								console.log("value.seat_s=" + value.s_count);
								console.log("value.seat_a=" + value.a_count);

								seq = value.schedule_seq;
								console.log("seq=" + seq);

								var html = "<li>" + "VIP석 | "
										+ (vip - value.vip_count) + "석"
										+ "</li>" + "<li>" + "S석 | "
										+ (s - value.s_count) + "석" + "</li>"
										+ "<li>" + "A석 | "
										+ (a - value.a_count) + "석" + "</li>"

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

	function saveDate() {
		if ($('#sseq').val() == 0) {
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
<!-- 
<script>
	// 플랫핏커
	$("#date-time-picker").flatpickr({

		enableTime : false, // 시간 선택 여부
		altInput : true, // 기존 입력을 숨기고 새 입력을 만듦
		altFormat : 'Y-m-d', // 날짜 선택 후 표시 형태
		dateFormat : 'Y-m-d', // date format 형식
		minDate : 'today', // 최소 선택 시간
		locale : 'ko', // 한국어
		time_24hr : true, // 24시간 형태
		inline : true, // 클릭 안해도 항상 달력 보임
		disableMobile : true, // 모바일 지원
		enable : [ '2023-03-01', '2023-03-02' ]

	});
</script>
 -->
<!--flatpicker cdn-->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<%@ include file="../footer.jsp"%>