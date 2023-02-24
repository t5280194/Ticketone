<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="css/ticket.css">
<link rel="stylesheet" href="css/seat.css">
<body>
    <div class="ticket_top">
        <ul>
            <li style="border: 1px solid black; background-color: #c0c0c0;">관람일/회차 선택</li>
            <li>-></li>
            <li style="border: 1px solid black; background-color: #c0c0c0;">좌석 선택</li>
            <li>-></li>
            <li style="border: 1px solid black;">가격/할인</li>
            <li>-></li>
            <li style="border: 1px solid black;">결제하기</li>
        </ul>
    </div>
<input type="hidden" id="VIP_seat" value="${Theater.seat_vip}">
<input type="hidden" id="S_seat" value="${Theater.seat_s}">
<input type="hidden" id="A_seat" value="${Theater.seat_a}">

<form class="bookTicket2" method="POST">
	<input type="hidden" id="pseq" name="play_pseq" value="${PlayVO.play_pseq}">
	<input type="hidden" id="sseq" name="schedule_seq" value="${ScheduleVO.schedule_seq}">
    
	<ul class="showcase">
		<li>
          <div class="seat"></div>
          <small>N/A</small>
        </li>
        <li>
          <div class="seat selected"></div>
          <small>선택 가능</small>
        </li>
        <li>
          <div class="seat occupied"></div>
          <small>선택 불가</small>
        </li>
	</ul>
      
	<div class="container">
		<div class="screen"></div>
			
			<c:set var="alphabet" value="${fn:split('A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z', ',')}" />
			<c:set var="i" value="0"/>
			
	<!-- VIP석 -->
	  		<div class="row">
				<div class="alphabet"><c:out value="${alphabet[i]}"/></div>
				<c:set var="rowNum" value="1"/>
		  		<c:forEach begin="1" end="${Theater.seat_vip}" var="vipRow" varStatus="vip_id">
		  			<c:set var="Booking" value="VIP_${alphabet[i]}${rowNum}"/>
		  			<c:set var="doneLoop" value="false"/>
		  			
		  			<c:forEach items="${BookedSeat}" var="BookedSeat">
		  				<c:if test="${BookedSeat eq Booking}">
		  					<div class="seat occupied">${rowNum}</div>
		  					<c:set var="doneLoop" value="true"/>
		  				</c:if>
		  			</c:forEach>
		  			
		  			<c:if test="${doneLoop == false}">
		  				<div class="seat" data-seat="VIP_${alphabet[i]}${rowNum}">${rowNum}</div>
		  			</c:if>
		  			
		  			<c:set var="rowNum" value="${rowNum=rowNum+1}"/>
		  			<c:if test="${vipRow % 20 == 0}">
		  				</div><div class="row">
		  				<c:if test="${vip_id.index != Theater.seat_vip}">
			  				<c:set var="i" value="${i=i+1}"/>
							<div class="alphabet"><c:out value="${alphabet[i]}"/></div>
							<c:set var="rowNum" value="1"/>
		  				</c:if>	
		  			</c:if>
		  		</c:forEach>
	        </div>
	        <c:set var="i" value="${i=i+1}"/>
	        <br>
	        
	<!-- S석 -->
			<div class="row">
				<c:out value="${alphabet[i]}"/>
				<c:set var="rowNum" value="1"/>
		  		<c:forEach begin="1" end="${Theater.seat_s}" var="sRow" varStatus="s_id">
		  			<c:set var="Booking" value="S_${alphabet[i]}${rowNum}"/>
		  			<c:set var="doneLoop" value="false"/>
		  			
		  			<c:forEach items="${BookedSeat}" var="BookedSeat">
		  				<c:if test="${BookedSeat eq Booking}">
		  					<div class="seat occupied">${rowNum}</div>
		  					<c:set var="doneLoop" value="true"/>
		  				</c:if>
		  			</c:forEach>
		  			
		  			<c:if test="${doneLoop == false}">
		  				<div class="seat" data-seat="S_${alphabet[i]}${rowNum}">${rowNum}</div>
		  			</c:if>
		  			
		  			<c:set var="rowNum" value="${rowNum=rowNum+1}"/>
		  			
		  			<c:if test="${sRow % 20 == 0}">
		  				</div><div class="row">
		  				<c:if test="${sRow != Theater.seat_s}">
		  					
			  				<c:set var="i" value="${i=i+1}"/>
							<c:out value="${alphabet[i]}"/>
							<c:set var="rowNum" value="1"/>
		  				</c:if>	
		  			</c:if>
		  		</c:forEach>
	        </div>
	        <c:set var="i" value="${i=i+1}"/>
	        <br>
	        
	<!-- A석 -->
			<div class="row">
				<c:out value="${alphabet[i]}"/>
				<c:set var="rowNum" value="1"/>
		  		<c:forEach begin="1" end="${Theater.seat_a}" var="aRow" varStatus="a_id">
			  		<c:set var="Booking" value="A_${alphabet[i]}${rowNum}"/>
		  			<c:set var="doneLoop" value="false"/>
		  			
		  			<c:forEach items="${BookedSeat}" var="BookedSeat">
		  				<c:if test="${BookedSeat eq Booking}">
		  					<div class="seat occupied">${rowNum}</div>
		  					<c:set var="doneLoop" value="true"/>
		  				</c:if>
		  			</c:forEach>
		  			
		  			<c:if test="${doneLoop == false}">
		  				<div class="seat" data-seat="A_${alphabet[i]}${rowNum}">${rowNum}</div>
		  			</c:if>
		  			
		  			<c:set var="rowNum" value="${rowNum=rowNum+1}"/>
		  			<c:if test="${(aRow % 20 == 0)}">
		  				</div><div class="row">
		  				<c:if test="${aRow != Theater.seat_a}">
		  					
			  				<c:set var="i" value="${i=i+1}"/>
							<c:out value="${alphabet[i]}"/>
							<c:set var="rowNum" value="1"/>
		  				</c:if>		
		  			</c:if>
		  		</c:forEach>
	        </div>
        
	</div><br>
	
	<p class="text">
		총 <span id="count">0</span>석을 선택하셨습니다.
	</p>
	<!-- 
	<p class="info">
		좌석 위치: <span id="seatIndex"></span>
	</p> -->
	<p class="id">
		좌석 번호: <span id="seatNum"></span>
	</p>
	
	<input type="hidden" id="seatID" name="ticket_seat" value="">

</form>
</body>
<%@ include file="myticket.jsp" %>
<!-- 
<div class="prev">
	<a href="back_to_ticket1?play_pseq=${PlayVO.play_pseq}"><input type="button" class="btn_prev" value="이전 단계"></a>
</div> -->
<div class="next">
	<input type="button" class="btn_next" value="다음 단계" onClick="saveSeats()">
</div>

<script type="text/javascript">
// document.querySelector() : 선택된 선택자 또는 선택자 그룹과 일치하는 문서 내 첫 번째 Element를 반환
// document.querySelectorAll() : 선택된 선택자 그룹에 일치하는 document의 엘리먼트 리스트를 나타내는 NodeList를 반환
const container = document.querySelector('.container');
const seats = document.querySelectorAll('.row .seat:not(.occupied)');
const count = document.getElementById('count');
const seatNum = document.getElementById('seatNum');
const total = document.getElementById('total');
const movieSelect = document.getElementById('movie');

function _updateSelectedCount() {
    const selectedSeats = document.querySelectorAll('.row .seat.selected');
    // 선택한 seat의 특정 위치값 배열
    const seatsIndex = [...selectedSeats].map(selectedSeat => {
      return [...seats].indexOf(selectedSeat);
    });
  
    localStorage.setItem('selectedSeats', JSON.stringify(seatsIndex));
    console.log("seatsIndex=" + seatsIndex);
    // 선택한 seat 수
    const selectedSeatsCount = selectedSeats.length;
    
    count.innerText = selectedSeatsCount;
    //seatIndex.innerText = seatsIndex;
}

const seatArr = [];

$(document).ready(function(){
	$(".seat").click(addEventListener);	// 좌석 클릭 시 아래 함수 실행
})
function addEventListener(){
	/*
	* 좌석을 누르면 클래스 seat -> seat selected,
	* 선택한 좌석을 다시 누르면 원래 seat로 돌아옴.
	*/
	var seat;
	if($(this).hasClass('seat')==true && $(this).hasClass('occupied')==false){
		seat = $(this).data('seat');
		$(this).toggleClass('selected');
	}
	console.log("seat: "+seat);
	
	/*
	var regex = /[^0-9]/g;
	var result = seat.replace(regex, "");
	var number = parseInt(result);
	console.log("선택좌석번호: " + seat);
	console.log("번호추출: " + result);
	
	if(number < 10){
		seat = seat.replace(result, "0"+result);
	}
	console.log("변환: "+seat);
	*/
	
	// 클래스 seat selected일 경우 좌석배열에 추가
	if ($(this).hasClass('selected')==true ){	
		seatArr.push(seat);		// 배열에 추가
	}
	// 클래스 seat일 경우 좌석배열에서 제거
	else {
		//seatArr.filter((element) => element !== seat);
		var index = seatArr.indexOf(seat);
		console.log("제거index=" + index);
		if(index != -1){
			seatArr.splice(index,1);	// 배열에서 제거
		}
	};
	
	console.log("seatArr: " +seatArr);
	
	seatNum.innerText = seatArr;
	$("#seatID").val(seatArr);
	
	_updateSelectedCount();
}

_updateSelectedCount();

function saveSeats(){
	if($("#seatID").val() == ""){
		alert("좌석을 선택해 주세요!");
		return false;
	}
	
	$(".bookTicket2").attr("action", "book_ticket3");
	$(".bookTicket2").submit();
}
</script>
</html>