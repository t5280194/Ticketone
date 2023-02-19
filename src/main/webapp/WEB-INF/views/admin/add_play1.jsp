<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    <!--flatpicker.css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!--flatpicker themes-->
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<body>
<!-- 공연 등록 시작-->
<!--progress 시작-->
<div class="text-center">
  <button class="btn btn-sm btn-primary" disabled style="width:14rem; margin: 0.5rem; background-color:#40B2FF; opacity: 1;">공연 기본정보 입력</button>
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
  </svg>
  <button class="btn btn-sm btn-outline-secondary" disabled style="width:14rem; margin: 0.5rem; color:#40B2FF; opacity: 1;">공연 회차정보 입력</button>
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
  </svg>
  <button class="btn btn-sm btn-outline-secondary" disabled style="width:14rem; margin: 0.5rem; color:#40B2FF; opacity: 1;">상세페이지 입력</button>
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
  </svg>
  <button class="btn btn-sm btn-outline-secondary" disabled style="width:14rem; margin: 0.5rem; color:#40B2FF; opacity: 1;">좌석별 가격 & 할인 설정</button>
</div>
<!--progress 끝-->

<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 35rem; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
          <form class= "add_play1" method="post">
        <label for="play_kind" class="form-label" style="margin: 1rem 1rem 0rem 1rem;">공연분류</label>
        <select class="form-select" id="play_kind" style="width: 18rem; margin: 1rem;" aria-label="Default select example">
          
          <option value="뮤지컬">뮤지컬</option>
          <option value="콘서트">콘서트</option>
          <option value="연극">연극</option>
          <option value="클래식/무용">클래식/무용</option>
        </select>

        <label for="play_name" class="form-label" style="margin: 1rem 1rem 0rem 1rem;">공연명</label>
        <input type="text" class="form-control" id="play_name" style="width: 18rem; margin: 1rem;" id="exampleFormControlInput1" placeholder="공연명을 입력하세요">
        
        <label for="date-time-picker" class="form-label" style="margin: 1rem 1rem 0rem 1rem;">공연기간</label>
        <div style="width:18rem; margin: 1rem;" >
              <input id="date-time-picker" placeholder="공연기간을 선택하세요">
        </div>
        
        <label for="theater_id" class="form-label" style="margin: 1rem 1rem 0rem 1rem;">공연장</label>
        <select class="form-select" id="theater_id" style="width: 18rem; margin: 1rem;" aria-label="Default select example">
          
          <option value="1">공연장1</option>
          <option value="2">공연장2</option>
          <option value="3">공연장3</option>
          <option value="4">공연장4</option>
          <option value="5">공연장5</option>
        </select>
        
        <div class="mb-3" style="width: 18rem; margin: 1rem;">
          <label for="formFile" class="form-label" style="margin: 1rem 1rem 1rem 0rem">메인 포스터를 업로드 하세요. size=300x400</label>
          <input class="form-control" type="file" id="formFile">
        </div>

        <div class="d-flex justify-content-end">
        	<a type="button" class="btn btn-sm" id="nextButton" style="width:4rem;
        	margin: 0.5rem; background-color: #40B2FF;" onClick="go2()">다음</a>
        </div>

          </form>
      </div>
    </span>
  </div>
</div>
<!-- 공연 등록 끝-->
</body>
<!--Jquery.js-->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<!-- flatpicker min js -->
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<!-- flatpicker ko -->
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
<script type="text/javascript"> 
function go2(){
   	// 데이터 담기
    var data = {
   	play_kind:"카인드",
    play_name:"플레이네임",
	play_date:"플레이데이트",
    theater_id:"티어터아이디"
   }
  	
   // ajax
       $.ajax({
           type : 'post',           // 타입 (get, post, put 등등)
           url : 'add_play2',           // 요청할 서버url
           async : true,            // 비동기화 여부 (default : true)

           dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
           data : JSON.stringify(data),  // 보낼 데이터 (Object , String, Array)
           success : function(result) { // 결과 성공 콜백함수
               
           	alert("add2로!");
           	console.log(result);
           	$(".add_play1").submit();
           },
           error : function(request, status, error) { // 결과 에러 콜백함수
               alert("error 발생!");
           	console.log(error)
           }
       })
      	
<!--$(".add_play1").submit();-->

}

</script>
    
<script>
// 플랫핏커
   $("#date-time-picker").flatpickr({
       mode: 'range',
       enableTime: false,           // 시간 선택 여부
       altInput: true,              // 기존 입력을 숨기고 새 입력을 만듦
       altFormat: 'Y-m-d',          // 날짜 선택 후 표시 형태
       dateFormat: 'Y-m-d H:i',     // date format 형식
       minDate: 'today',            // 최소 선택 시간
       locale: 'ko',                // 한국어
       time_24hr: true,             // 24시간 형태
       disableMobile: true          // 모바일 지원 
   });
</script>
<!--flatpicker cdn-->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<%@ include file="../footer.jsp" %>