<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
    <!--flatpicker.css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!--flatpicker themes-->
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<body>
<!--add_play3 시작-->
<!--progress 시작-->
<div class="text-center">
  <button class="btn btn-sm btn-primary" disabled style="width:14rem; margin: 0.5rem; background-color: #40B2FF; opacity: 1;">공연 기본정보 입력</button>
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
  </svg>
  <button class="btn btn-sm btn-primary" disabled style="width:14rem; margin: 0.5rem; background-color: #40B2FF; opacity: 1;">공연 회차정보 입력</button>
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="white" class="bi bi-arrow-right" viewBox="0 0 16 16">
    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
  </svg>
  <button class="btn btn-sm btn-primary" disabled style="width:14rem; margin: 0.5rem; background-color: #40B2FF; opacity: 1;">상세페이지 입력</button>
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
      <form id="add_play3" action="add_play3" method="POST" enctype="multipart/form-data">
      <!-- hidden으로 play_pseq값 넘겨준다. -->
      <input type="text" name="play_pseq" value="${play_pseq}">
      <input type="text" name="theater_id" value="${theater_id}">
        <div class="mb-3" style="width: 18rem; margin: 1rem;">
          <label for="formFile" class="form-label" style="margin: 0rem 1rem 1rem 0rem">공연 상세이미지 1</label>
          <input class="form-control" type="file" id="formFile" name="upload_image1">
        </div>
        <div class="mb-3" style="width: 18rem; margin: 1rem;">
          <label for="formFile" class="form-label" style="margin: 1rem 1rem 1rem 0rem">공연 상세이미지 2</label>
          <input class="form-control" type="file" id="formFile" name="upload_image2">
        </div>
        <div class="mb-3" style="width: 18rem; margin: 1rem;">
          <label for="formFile" class="form-label" style="margin: 1rem 1rem 1rem 0rem">공연 상세이미지 3</label>
          <input class="form-control" type="file" id="formFile" name="upload_image3">
        </div>


        <div class="mb-3" style="margin:1rem;">
          <label for="exampleFormControlTextarea1" class="form-label" style="margin:1rem 1rem 1rem 0rem">공연 상세텍스트</label>
          <textarea class="form-control" id="exampleFormControlTextarea1" name="play_content"rows="5"></textarea>
        </div>


        <div class="d-flex justify-content-end">
        <input type="submit" class="btn btn-sm " style="width:4rem; margin: 0.5rem; background-color: #40B2FF;" value="다음">
        </div>
        </form>

      </div>
    </span>
  </div>
</div>
<!--add_play3 끝-->
</body>
    <!--Jquery.js-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- flatpicker min js -->
    <script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
    <!-- flatpicker ko -->
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
    <script type="text/javascript"> 
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
           /* 
	// 데이터 담기
	    var data = {
    	play_kind: $("#play-kind").val();
	    play_name: $("#play_name").val();
		play_date: $("#date-time-picker").val();
	    theater_id: $("#theater_id").val();
    }
	
    // ajax
        $.ajax({
            type : 'post',           // 타입 (get, post, put 등등)
            url : 'add_play2',           // 요청할 서버url
            async : true,            // 비동기화 여부 (default : true)
            headers : {              // Http header
              "Content-Type" : "application/json",
              "X-HTTP-Method-Override" : "POST"
            },
            dataType : 'json',       // 데이터 타입 (html, xml, json, text 등등)
            data : JSON.stringify(data),  // 보낼 데이터 (Object , String, Array)
            success : function(result) { // 결과 성공 콜백함수
                alert("add2로!");
            	console.log(result);
            },
            error : function(request, status, error) { // 결과 에러 콜백함수
                alert("error 발생!");
            	console.log(error)
            }
        })
        
        function go2(){
		
	}
           */
    </script>
    <!--flatpicker cdn-->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<%@ include file="../footer.jsp" %>