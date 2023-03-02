<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="css/purchase.css">
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
	<!--progress 끝-->

	<!-- card 시작 -->
	<div class="d-flex justify-content-center">
		<div class="card" style="background-color: transparent; color: white; width: auto; margin: 1rem;">
			<span class="border border-white border border-2 rounded">
				<div class="card-body">
				
						<div class="container text-center">
						  <div class="row align-items-start">
						    <div class="col">	<!-------- col1 -------->
						      		<form class="bookTicket4" method="POST">
										<div>
											<label for="AAAAA" class="form-label"
							style="margin: 1rem 1rem 0.5rem 1rem;">결제 방식 선택</label>
											<hr class="border border-light border-1 opacity-100">
											<p><input type="radio" class="button" name="payment" value="1" data-pay="신용 카드" checked />신용 카드</p>
											<p><input type="radio" class="button" name="payment" value="2" data-pay="무통장 입금" />무통장 입금</p>
											<p><input type="radio" class="button" name="payment" value="3" data-pay="휴대폰 결제" />휴대폰 결제</p>
											<p><input type="radio" class="button" name="payment" value="4" data-pay="공연 예매권" />공연 예매권</p>
											<p><input type="radio" class="button" name="payment" value="5" data-pay="Point 사용" />Point 사용(사용가능: P)</p>
										</div>
										
						    </div>
						    <div class="col">		<!-------- col2 -------->
						      		<div>
											<label for="AAAAA" class="form-label"
							style="margin: 1rem 1rem 0.5rem 1rem;">결제 수단 입력</label>
											<hr class="border border-light border-1 opacity-100">
											<div id="pay"></div>
										</div>
										
										<input type="hidden" id="pseq" name="play_pseq" value="${PlayVO.play_pseq}">
									    <input type="hidden" id="sseq" name="schedule_seq" value="${ScheduleVO.schedule_seq}">
									    <input type="hidden" id="ticket_seat" name="ticket_seat" value="${Ticket_seat}">
									    
									    <input type="hidden" id="discount_vipID" name="discount_vipID" value="${Discounted_Vip_Id}">
									    <input type="hidden" id="discount_vipPrice" name="discount_vipPrice" value="${Discounted_Vip_Price}">
									    <input type="hidden" id="discount_vipAmount" name="discount_vipAmount" value="${Discounted_Vip_Amount}">    
									    
									    <input type="hidden" id="discount_sID" name="discount_sID" value="${Discounted_S_Id}">
									    <input type="hidden" id="discount_sPrice" name="discount_sPrice" value="${Discounted_S_Price}">
									    <input type="hidden" id="discount_sAmount" name="discount_sAmount" value="${Discounted_S_Amount}">
									    
									    <input type="hidden" id="discount_aID" name="discount_aID" value="${Discounted_A_Id}">
										<input type="hidden" id="discount_aPrice" name="discount_aPrice" value="${Discounted_A_Price}">
									    <input type="hidden" id="discount_aAmount" name="discount_aAmount" value="${Discounted_A_Amount}">
									    
									</form>
						    </div>
						    
						    <div class="col">	<!-------- col3 -------->
						      		<div class="container">
									  <div class="row row-cols-1">
									    <div class="col d-flex justify-content-center">
											<br>
											<%@ include file="myticket.jsp"%>
									    </div>
									    <div class="col d-flex justify-content-end">
											<div class="next d-flex justify-content-end">
												<br>
												<input type="button" class="btn_next btn btn-sm" value="결제하기"
												style="width: 5rem; margin: 0.5rem; background-color: #40B2FF;" onClick="completePay()">
											</div>
									    </div>
									  </div>
								</div>
						    </div>
						  </div>
						</div>
						
				</div>
			</span>
		</div>
	</div>
	<!-- card 끝 -->

</body>

<script type="text/javascript">
var check = $('input[name=payment]:checked').val();	// 체크된 라디오버튼 value값 조회
var select = $('input[name=payment]:checked').data('pay');
console.log("Checked value: " + check);
console.log("Checked data: " + select);

// 자동 실행 함수
window.onload = function(){
	selectPayment();
};

$(document).ready(function(){
	$('.button').click(function(){
		if($("input:radio[name=payment]").is(':checked')){
			check = $('input[name=payment]:checked').val();
			select = $('input[name=payment]:checked').data('pay');
			console.log("Checked value: " + check);
			console.log("Checked data: " + select);
			selectPayment();
		}
	})
});

function selectPayment(){
	$("#pay").find("div").remove();
	if(check == 1){
		var html =	"<div>" +
					"<select name='creditCard' class='creditCard'>" + 
						"<option value='0'>카드종류를 선택하세요</option>" +
						"<option value='1'>신한은행</option>" +
						"<option value='2'>하나은행</option>" +
						"<option value='3'>국민은행</option>" +
						"<option value='4'>우리은행</option>" +
						"<option value='5'>기업은행</option>" +
					"</select>" +
					"</div>"
		$("#pay").append(html);
		$('.ticketInsert').find('#payID').val(check);
		$('.ticketInsert').find('#payName').val(select);
	}
	else if(check == 2){
		var html = 	"<div>" +
					"<table>" +
						"<tr>" +
							"<th colspan='2' scope='col'>무통장입금</th>" +
						"</tr>" +
						"<tr>" +
							"<td>입금액</td>" +
							"<td><fmt:formatNumber value='${TotalPrice}' pattern='#,###'/>원</td>" +
						"</tr>" +
						"<tr>" +
							"<td>입금하실은행</td>" +
							"<td>" +
								"<select name='bank' class='bank'>" +
									"<option value='0'>입금하실 은행을 선택하세요.</option>" +
									"<option value='1'>신한은행</option>" +
									"<option value='2'>하나은행</option>" +
									"<option value='3'>국민은행</option>" +
									"<option value='4'>우리은행</option>" +
									"<option value='5'>기업은행</option>" +
								"</select>" +
							"</td>" +
						"</tr>" +
					"</table>" +
					"</div>"
		$("#pay").append(html);
		$('.ticketInsert').find('#payID').val(check);
		$('.ticketInsert').find('#payName').val(select);
	}
	else if(check == 3){
		var html = 	"<div>" +
					"<table>" +
						"<tr>" +
							"<th colspan='2' scope='col'>휴대폰 결제</th>" +
						"</tr>" +
						"<tr>" +
							"<td>결제금액</td>" +
							"<td><fmt:formatNumber value='${TotalPrice}' pattern='#,###'/>원</td>" +
						"</tr>" +
					"</table>" +
					"</div>"
		$("#pay").append(html);
		$('.ticketInsert').find('#payID').val(check);
		$('.ticketInsert').find('#payName').val(select);
	}
	else if(check == 4){
		var html = "<div>" +
					"<table>" +
						"<tr>" +
							"<th>예매권 번호</th>" +
							"<th>등록하기</th>" +
						"</tr>" +
						"<tr>" +
							"<td><input type='text' name='ticketNum'></td>" +
							"<td><input type='button' id='register' value='등록하기'></td>" +
						"</tr>" +
					"</table><br>" +
					"<table id='checkTicket'>" +
						"<tr>" +
							"<th colspan='3' scope='col'>공연예매권 정보</th>" +
						"</tr>" +
						"<tr>" +
							"<td>좌석등급</td>" +
							"<td>예매권번호</td>" +
							"<td>유효기간</td>" +
						"</tr>" +
					"</table>"
		$("#pay").append(html);
		$('.ticketInsert').find('#payID').val(check);
		$('.ticketInsert').find('#payName').val(select);
	}
	else if(check == 5){
		var html = 	"<div>" +
					"<table>" +
						"<tr>" +
							"<th>보유 포인트</th>" +
							"<td>0P</td>" +
						"</tr>" +
						"<tr>" +
							"<th>사용 포인트</th>" +
							"<td><input type='text' name='point' id='point' size='10' value='0'> P</td>" +
						"</tr>" +
					"</table>" +
					"</div>"
		$("#pay").append(html);
		$('.ticketInsert').find('#payID').val(check);
		$('.ticketInsert').find('#payName').val(select);
	}
};

function completePay(){
	$(".ticketInsert").attr("action", "book_ticket5");
	$(".ticketInsert").submit();
};
</script>

</html>
<%@ include file="../footer.jsp"%>