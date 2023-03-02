<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" href="css/price.css">

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
		<button class="btn btn-sm btn-outline-secondary" disabled
			style="width: 14rem; margin: 0.5rem; color: #40B2FF; opacity: 1;">결제하기</button>
	</div>
	<!--progress 끝-->


	<!-- card 시작 -->
	<div class="d-flex justify-content-center">
		<div class="card" style="background-color: transparent; color: white; width: auto; margin: 1rem;">
			<span class="border border-white border border-2 rounded">
				<div class="card-body">
				
				
					<form class="bookTicket3" method="POST">
						
						
						<div class="container text-center">
						  <div class="row align-items-start">
						    <div class="col">	<!-------- col1 -------->
						<label for="AAAAA" class="form-label"
							style="margin: 1rem 1rem 0.5rem 1rem;">가격</label>
						
						<c:forEach var="Ticket_seat" items="${Ticket_seat}">
							<input type="hidden" id="ticket_seat" name="Ticket_seats" value="${Ticket_seat}">
						</c:forEach>
						
						<c:forEach var="VIP_seat" items="${VIP_seat}">
							<input name="VIP_seats" class="VIP_seats" type="hidden" value="${VIP_seat}">
						</c:forEach>
						<c:forEach var="S_seat" items="${S_seat}">
							<input name="S_seats" class="S_seats" type="hidden" value="${S_seat}">
						</c:forEach>
						<c:forEach var="A_seat" items="${A_seat}">
							<input name="A_seats" class="A_seats" type="hidden" value="${A_seat}">
						</c:forEach>
						
						<c:set var="Discount_ID" value="${fn:split(Discount_ID,',')}"/>
						
						<!-- VIP석 선택 시 -->
						<c:if test="${fn:length(VIP_seat) != 0}">
							<div>
							<input type="hidden" name="VIP_count" id="VIP_count" value="${fn:length(VIP_seat)}">
								<table class="priceDiscount">
									<tr> VIP석 | <span>${fn:length(VIP_seat)}</span>석을 선택하셨습니다.</tr>
									<tr>
										<th>기본가</th>
										<td>일반</td>
										<td>
											<fmt:formatNumber value="${PlayVO.play_price_vip}" pattern="#,###"/>
										</td>
										<td>
											<select name="normalVIP" class="VIP_amount" >
												<c:forEach var="buycount" begin="0" end="${fn:length(VIP_seat)}">
													<option value="${buycount}">${buycount}매</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th rowspan="5" scope="row">기본할인</th>
										<c:set var="i" value="0"/>
										<c:forEach var="DiscountList" items="${DiscountList}">
											<c:if test="${Discount_ID[i] == DiscountList.discount_id}">
												<td class="discount">
													<span>${DiscountList.discount_name}</span><br>
													<span>${DiscountList.discount_rate}%</span>
													<input class="discountId" type="hidden" value="${DiscountList.discount_id}">
													<input class="discountName" type="hidden" value="${DiscountList.discount_name}">
												</td>
												<td class="Price">
													<c:set var="discounted" value="${PlayVO.play_price_vip
																			 * (DiscountList.discount_rate/100)}" />		
													<fmt:formatNumber value="${PlayVO.play_price_vip - discounted}"
																	 pattern="#,###"/>
													<input class="discountPrice" type="hidden" value="${discounted}">
												</td>
												<td class="amount">
													<select name="discountVIP" class="VIP_amount" >
														<c:forEach var="buycount" begin="0" end="${fn:length(VIP_seat)}">
															<option id="${buycount}" value="${buycount}">${buycount}매</option>
														</c:forEach>
													</select>
												</td>
												</tr>
												<c:if test="${i < fn:length(Discount_ID)-1}">
													<c:set var="i" value="${i=i+1}"/>
												</c:if>
												<tr>
											</c:if>
										</c:forEach>
									</tr>
								</table><br>
									<input name="vipId" class="vipId" type="hidden" value="">
									<input name="vipName" class="vipName" type="hidden" value="">
									<input name="vipPrice" class="vipPrice" type="hidden" value="0">
									<input name="vipAmount" class="vipAmount" type="hidden" value="">
								</div>
						</c:if>
						
						<!-- S석 선택 시 -->
						<c:if test="${fn:length(S_seat) != 0}">
							<div>
							<input type="hidden" name="S_count" id="S_count" value="${fn:length(S_seat)}">
								<table class="priceDiscount">
									<tr> S석 | <span>${fn:length(S_seat)}</span>석을 선택하셨습니다.</tr>
									<tr>
										<th>기본가</th>
										<td>일반</td>
										<td>
											<fmt:formatNumber value="${PlayVO.play_price_s}" pattern="#,###"/>
										</td>
										<td>
											<select name="normal_S" class="S_amount" >
												<c:forEach var="buycount" begin="0" end="${fn:length(S_seat)}">
													<option value="${buycount}">${buycount}매</option>
												</c:forEach>
											</select>
										</td>
									</tr>
									<tr>
										<th rowspan="5" scope="row">기본할인</th>
										<c:set var="i" value="0"/>
										<c:forEach var="DiscountList" items="${DiscountList}">
											<c:if test="${Discount_ID[i] == DiscountList.discount_id}">
												<td class="discount">
													<span>${DiscountList.discount_name}</span><br>
													<span>${DiscountList.discount_rate}%</span>
													<input class="discountId" type="hidden" value="${DiscountList.discount_id}">
													<input class="discountName" type="hidden" value="${DiscountList.discount_name}">
												</td>
												<td class="Price">
													<c:set var="discounted" value="${PlayVO.play_price_s
																			 * (DiscountList.discount_rate/100)}" />		
													<fmt:formatNumber value="${PlayVO.play_price_s - discounted}"
																	 pattern="#,###"/>
													<input class="discountPrice" type="hidden" value="${discounted}">
												</td>
												<td class="amount">
													<select name="discount_S" class="S_amount" >
														<c:forEach var="buycount" begin="0" end="${fn:length(S_seat)}">
															<option id="${buycount}" value="${buycount}">${buycount}매</option>
														</c:forEach>
													</select>
												</td>
												</tr>
												<c:if test="${i < fn:length(Discount_ID)-1}">
													<c:set var="i" value="${i=i+1}"/>
												</c:if>
												<tr>
											</c:if>
										</c:forEach>
									</tr>
								</table><br>
									<input name="s_Id" class="s_Id" type="hidden" value="">
									<input name="s_Name" class="s_Name" type="hidden" value="">
									<input name="s_Price" class="s_Price" type="hidden" value="0">
									<input name="s_Amount" class="s_Amount" type="hidden" value="">
							</div>
						</c:if>
						
						<!-- A석 선택 시 -->
						<c:if test="${fn:length(A_seat) != 0}">
							<div>
							<input type="hidden" name="A_count" id="A_count" value="${fn:length(A_seat)}">
								<table class="priceDiscount">
									<tr> A석 | <span>${fn:length(A_seat)}</span>석을 선택하셨습니다.</tr>
									<tr>
										<th>기본가</th>
										<td>일반</td>
										<td>
											<fmt:formatNumber value="${PlayVO.play_price_a}" pattern="#,###"/>
										</td>
										<td>
											<select name="normal_A" class="A_amount" >
												<c:forEach var="buycount" begin="0" end="${fn:length(A_seat)}">
													<option value="${buycount}">${buycount}매</option>
												</c:forEach>
											</select>
										</td>
									</tr>		
									<tr>
										<th rowspan="5" scope="row">기본할인</th>
										<c:set var="i" value="0"/>
										<c:forEach var="DiscountList" items="${DiscountList}">
											<c:if test="${Discount_ID[i] == DiscountList.discount_id}">
												<td class="discount">
													<span>${DiscountList.discount_name}</span><br>
													<span>${DiscountList.discount_rate}%</span>
													<input class="discountId" type="hidden" value="${DiscountList.discount_id}">
													<input class="discountName" type="hidden" value="${DiscountList.discount_name}">
												</td>
												<td class="Price">
													<c:set var="discounted" value="${PlayVO.play_price_a
																			 * (DiscountList.discount_rate/100)}" />		
													<fmt:formatNumber value="${PlayVO.play_price_a - discounted}"
																	 pattern="#,###"/>
													<input class="discountPrice" type="hidden" value="${discounted}">
												</td>
												<td class="amount">
													<select name="discount_A" class="A_amount" >
														<c:forEach var="buycount" begin="0" end="${fn:length(A_seat)}">
															<option id="${buycount}" value="${buycount}">${buycount}매</option>
														</c:forEach>
													</select>
												</td>
												</tr>
												<c:if test="${i < fn:length(Discount_ID)-1}">
													<c:set var="i" value="${i=i+1}"/>
												</c:if>
												<tr>
											</c:if>
										</c:forEach>
									</tr>
								</table><br>
									<input name="a_Id" class="a_Id" type="hidden" value="">
									<input name="a_Name" class="a_Name" type="hidden" value="">
									<input name="a_Price" class="a_Price" type="hidden" value="0">
									<input name="a_Amount" class="a_Amount" type="hidden" value="">
							</div>
						</c:if>
						
						    <input type="hidden" id="pseq" name="play_pseq" value="${PlayVO.play_pseq}">
						    <input type="hidden" id="sseq" name="schedule_seq" value="${ScheduleVO.schedule_seq}">
						    </div>
						    <div class="col">	<!-------- col2 -------->
						      <div class="container">
									  <div class="row row-cols-1">
									    <div class="col d-flex justify-content-center">
											<br>
											<%@ include file="myticket.jsp"%>
									    </div>
									    <div class="col d-flex justify-content-end">
											<div class="next d-flex justify-content-end">
												<br>
												<input type="button" class="btn_next btn btn-sm" id="nextButton"
												style="width: 4rem; margin: 0.5rem; background-color: #40B2FF;"
												value="다음" onClick="savePrice()">
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
var vip_sum=0;
var s_sum=0;
var a_sum=0;

/*
 * VIP석 선택 시 
 */
const vip_ID_Arr = [];
const vip_Name_Arr = [];
const vip_Price_Arr = [];
const vip_Amount_Arr = [];
$("select[class=VIP_amount]").change(function(){
	var selected = $(this).val();
	console.log(selected);
	
	var selects = document.getElementsByClassName("VIP_amount");
	var sum = 0;
	for(var i=0; i<selects.length; i++){
		var selectIndex = selects[i].selectedIndex;	
		sum += selectIndex;

		if(sum > $("#VIP_count").val()){
			alert("선택한 좌석 수를 초과하였습니다!");
			$(this).val(0);
			console.log("selected:" + $(this).val());
			sum = sum - selectIndex;
		}
	}
	vip_sum = sum;
});
$("select[name=discountVIP]").change(function(){
	var id = $(this).closest('tr').find('.discountId').val();	// 선택항목의 할인ID 가져오기
	var name = $(this).closest('tr').find('.discountName').val();
	var price = $(this).closest('tr').find('.discountPrice').val();
	var amount = $(this).closest('tr').find('.VIP_amount').val();
	console.log("선택한 ID: " + id);
	console.log("적용된 할인: " + name);
	console.log("할인 가격: -" + Math.floor(price));
	
	if($(this).val() != 0){
		if(vip_ID_Arr.includes(id)==false){
			vip_ID_Arr.push(id);
			vip_Name_Arr.push(name);
			vip_Price_Arr.push(Math.floor(price));
			vip_Amount_Arr.push(amount);
		}
		var index = vip_ID_Arr.indexOf(id);
		vip_Amount_Arr.splice(index, 1, amount);
	}else{
		if(vip_ID_Arr.includes(id)==true){
			var index = vip_ID_Arr.indexOf(id);
			console.log("삭제 ID=" + id);
			
			vip_ID_Arr.splice(index, 1);
			vip_Name_Arr.splice(index, 1);
			vip_Price_Arr.splice(index, 1);
			vip_Amount_Arr.splice(index, 1);
		}	
	}
	console.log("vip_ID_Arr: " + vip_ID_Arr);
	console.log("vip_Price_Arr: " + vip_Price_Arr);
	console.log("vip_Amount_Arr: " + vip_Amount_Arr);
	$(this).closest('div').find('.vipId').val(vip_ID_Arr);
	$(this).closest('div').find('.vipName').val(vip_Name_Arr);
	$(this).closest('div').find('.vipPrice').val(vip_Price_Arr);
	$(this).closest('div').find('.vipAmount').val(vip_Amount_Arr);
});

/*
 * S석 선택 시 
 */
const s_ID_Arr = [];
const s_Name_Arr = [];
const s_Price_Arr = [];
const s_Amount_Arr = [];
$("select[class=S_amount]").change(function(){
	var selected = $(this).val();
	console.log(selected);
	
	var selects = document.getElementsByClassName("S_amount");
	var sum = 0;
	for(var i=0; i<selects.length; i++){
		var selectIndex = selects[i].selectedIndex;	
		sum += selectIndex;

		if(sum > $("#S_count").val()){
			alert("선택한 좌석 수를 초과하였습니다!");
			$(this).val(0);
			console.log("selected:" + $(this).val());
			sum = sum - selectIndex;
		}
	}
	s_sum = sum;
});
$("select[name=discount_S]").change(function(){
	var id = $(this).closest('tr').find('.discountId').val();
	var name = $(this).closest('tr').find('.discountName').val();
	var price = $(this).closest('tr').find('.discountPrice').val();
	var amount = $(this).closest('tr').find('.S_amount').val();
	console.log("선택한 ID: " + id);
	console.log("적용된 할인: " + name);
	console.log("할인 가격: -" + Math.floor(price));
	
	if($(this).val() != 0){
		if(s_ID_Arr.includes(id)==false){
			s_ID_Arr.push(id);
			s_Name_Arr.push(name);
			s_Price_Arr.push(Math.floor(price));
			s_Amount_Arr.push(amount);
		}
		var index = s_ID_Arr.indexOf(id);
		s_Amount_Arr.splice(index, 1, amount);
	}else{
		if(s_ID_Arr.includes(id)==true){
			var index = s_ID_Arr.indexOf(id);
			console.log("삭제 ID=" + id);
			
			s_ID_Arr.splice(index, 1);
			s_Name_Arr.splice(index, 1);
			s_Price_Arr.splice(index, 1);
			s_Amount_Arr.splice(index, 1);
		}	
	}
	console.log("s_ID_Arr: " + s_ID_Arr);
	console.log("s_Price_Arr: " + s_Price_Arr);
	console.log("s_Amount_Arr: " + s_Amount_Arr);
	$(this).closest('div').find('.s_Id').val(s_ID_Arr);
	$(this).closest('div').find('.s_Name').val(s_Name_Arr);
	$(this).closest('div').find('.s_Price').val(s_Price_Arr);
	$(this).closest('div').find('.s_Amount').val(s_Amount_Arr);
});

/*
 * A석 선택 시 
 */
const a_ID_Arr = [];
const a_Name_Arr = [];
const a_Price_Arr = [];
const a_Amount_Arr = [];
$("select[class=A_amount]").change(function(){
	var selected = $(this).val();
	console.log(selected);
	
	var selects = document.getElementsByClassName("A_amount");
	var sum = 0;
	for(var i=0; i<selects.length; i++){
		var selectIndex = selects[i].selectedIndex;	
		sum += selectIndex;

		if(sum > $("#A_count").val()){
			alert("선택한 좌석 수를 초과하였습니다!");
			$(this).val(0);
			console.log("selected:" + $(this).val());
			sum = sum - selectIndex;
		}
	}
	a_sum = sum;
});
$("select[name=discount_A]").change(function(){
	var id = $(this).closest('tr').find('.discountId').val();
	var name = $(this).closest('tr').find('.discountName').val();
	var price = $(this).closest('tr').find('.discountPrice').val();
	var amount = $(this).closest('tr').find('.A_amount').val();
	console.log("선택한 ID: " + id);
	console.log("적용된 할인: " + name);
	console.log("할인 가격: -" + Math.floor(price));
	
	if($(this).val() != 0){
		if(a_ID_Arr.includes(id)==false){
			a_ID_Arr.push(id);
			a_Name_Arr.push(name);
			a_Price_Arr.push(Math.floor(price));
			a_Amount_Arr.push(amount);
		}
		var index = a_ID_Arr.indexOf(id);
		a_Amount_Arr.splice(index, 1, amount);
	}else{
		if(a_ID_Arr.includes(id)==true){
			var index = a_ID_Arr.indexOf(id);
			console.log("삭제 ID=" + id);
			
			a_ID_Arr.splice(index, 1);
			a_Name_Arr.splice(index, 1);
			a_Price_Arr.splice(index, 1);
			a_Amount_Arr.splice(index, 1);
		}	
	}
	console.log("a_ID_Arr: " + a_ID_Arr);
	console.log("a_Price_Arr: " + a_Price_Arr);
	console.log("a_Amount_Arr: " + a_Amount_Arr);
	$(this).closest('div').find('.a_Id').val(a_ID_Arr);
	$(this).closest('div').find('.a_Name').val(a_Name_Arr);
	$(this).closest('div').find('.a_Price').val(a_Price_Arr);
	$(this).closest('div').find('.a_Amount').val(a_Amount_Arr);
});

function savePrice(){
	if(vip_sum < $("#VIP_count").val()){
		alert("선택하신 VIP석 매수만큼 고르세요.");
		return false;
	}
	else if(s_sum < $("#S_count").val()){
		alert("선택하신 S석 매수만큼 고르세요.");
		return false;
	}
	else if(a_sum < $("#A_count").val()){
		alert("선택하신 A석 매수만큼 고르세요.");
		return false;
	}
	
	$(".bookTicket3").attr("action", "book_ticket4");
	$(".bookTicket3").submit();
}
</script>
</html>
<%@ include file="../footer.jsp"%>