<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
#vip {
    color: #660ff1;
  }
  #s {
    color: #188754;
  }
  #a {
    color: #0DCAF0;
  }
</style>
    <!--flatpicker.css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!--flatpicker themes-->
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<body>
<!--add_play4 시작-->
<!--progress 시작-->
<div class="text-center">
  <a type="button" class="btn btn-sm btn-primary" style="width:14rem; margin: 0.5rem; background-color: #40B2FF;">공연 기본정보 입력</a>
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
  </svg>
  <a type="button" class="btn btn-sm btn-primary" style="width:14rem; margin: 0.5rem; background-color: #40B2FF;">공연 회차정보 입력</a>
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
  </svg>
  <a type="button" class="btn btn-sm btn-primary" style="width:14rem; margin: 0.5rem; background-color: #40B2FF;">상세페이지 입력</a>
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
  </svg>
  <a type="button" class="btn btn-sm btn-primary" style="width:14rem; margin: 0.5rem; background-color: #40B2FF;">좌석별 가격 & 할인 설정</a>
</div>
<!--progress 끝-->

<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 65rem; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        <div class="container">
          <div class="row">
            <div class="col">
              <label class="form-label" for="rounded float-start" style="margin: 1rem 1rem 0rem 1rem;">${theaterVO.theater_name} 좌석도</label><br>
              <c:choose>
              	<c:when test="${theater_id == 1}"><img src="images/site/theater1.png" class="rounded float-start" style="width: 35rem; margin: 1rem;" alt="하늘대공연장 좌석도"></c:when>
              	<c:when test="${theater_id == 2}"><img src="images/site/theater2.png" class="rounded float-start" style="width: 35rem; margin: 1rem;" alt="스타콘서트홀 좌석도"></c:when>
              	<c:when test="${theater_id == 3}"><img src="images/site/theater3.png" class="rounded float-start" style="width: 35rem; margin: 1rem;" alt="서울예술극장 좌석도"></c:when>
              	<c:when test="${theater_id == 4}"><img src="images/site/theater4.png" class="rounded float-start" style="width: 35rem; margin: 1rem;" alt="상상극장 좌석도"></c:when>
              	<c:when test="${theater_id == 5}"><img src="images/site/theater5.png" class="rounded float-start" style="width: 35rem; margin: 1rem;" alt="희망소극장 좌석도"></c:when>
              </c:choose>
              
            </div>
            <div class="col">
              <form id="add_play4" action="add_play4" method="POST">
              <!-- hidden으로 play_pseq값 넘겨준다. -->
              <input type="hidden" name="play_pseq" value="${play_pseq}">
              <input type="hidden" name="theater_id" value="${theater_id}">
              <label class="form-label" style="margin: 1rem 1rem 0rem 1rem;">좌석등급별 가격 설정</label>
              <div class="input-group mb-3" style="width: 14rem; margin:1rem" >
                <span class="input-group-text fw-bold" id="vip" style="width:6rem">VIP ${theaterVO.seat_vip}석</span>
                <input type="text" name="play_price_vip" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" class="form-control text-end">
                <span class="input-group-text">원</span>
              </div>
              <div class="input-group mb-3" style="width: 14rem; margin:1rem"" >
                <span class="input-group-text fw-bold"  id="s" style=" width:6rem">S ${theaterVO.seat_s}석</span>
                <input type="text" name="play_price_s" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" class="form-control text-end" >
                <span class="input-group-text">원</span>
              </div>
              <div class="input-group mb-3" style="width: 14rem; margin:1rem"" >
                <span class="input-group-text fw-bold" id="a" style="width:6rem">A ${theaterVO.seat_a}석</span>
                <input type="text" name="play_price_a" oninput="this.value = this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" class="form-control text-end">
                <span class="input-group-text">원</span>
              </div>
              <br><br>
              
              <label class="form-label" style="margin: 1rem 1rem 0rem 1rem;">할인적용 선택</label>
              <div class="form-check form-switch" style="margin: 1rem;">
                <input class="form-check-input" name="discount_info1" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                <label class="form-check-label" for="flexSwitchCheckDefault">청소년 할인(중,고생/1인 1매) 30%</label>
              </div>
              <div class="form-check form-switch" style="margin: 1rem;">
                <input class="form-check-input" name="discount_info2" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                <label class="form-check-label" for="flexSwitchCheckDefault">국가유공자 할인(1인 1매) 50%</label>
              </div>
              <div class="form-check form-switch" style="margin: 1rem;">
                <input class="form-check-input" name="discount_info3" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                <label class="form-check-label" for="flexSwitchCheckDefault">4인 패키지 20%</label>
              </div>
              <div class="form-check form-switch" style="margin: 1rem;">
                <input class="form-check-input" name="discount_info4" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                <label class="form-check-label" for="flexSwitchCheckDefault">지역 할인(1인 2매) 10%</label>
              </div>
              <div class="form-check form-switch" style="margin: 1rem;">
                <input class="form-check-input" name="discount_info5" type="checkbox" role="switch" id="flexSwitchCheckDefault">
                <label class="form-check-label" for="flexSwitchCheckDefault">장애인 (1인 1매) 50%</label>
              </div>
              
              <br><br><br>
              <div class="d-flex justify-content-end">
                <input type="submit" class="btn btn-sm " style="width:7rem; margin: 0.5rem; background-color: #40B2FF;" value="공연 등록 완료">
                </div>
              </form>
            </div>
          </div>
        </div>

      </div>
    </span>
  </div>
</div>
<!--add_play4 끝-->
</body>
    <!--Jquery.js-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<%@ include file="../footer.jsp" %>