<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

    <style>
      body{background-image:url(/img/bg.jpg)}

    .card .card-title {
        color: #000000;
        margin-bottom: 0.625rem;
        font-size: 0.875rem;
        font-weight: 500
    }

    .table thead th,
    .jsgrid .jsgrid-table thead th {
        border-top: 0;
        border-bottom-width: 1px;
        font-weight: 500;
        font-size: .875rem;
        text-transform: uppercase
    }

    .table td,
    .jsgrid .jsgrid-table td {
        font-size: 0.875rem;
        padding: .475rem 0.4375rem;
    }

    .mt-10{
            padding: 0.875rem 0.3375rem !important;
    }  

    .badge {
        border-radius: 0;
        font-size: 12px;
        line-height: 1;
        padding: .375rem .5625rem;
        font-weight: normal;
        border: none;
    }
    
    </style>
    <!--flatpicker.css-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <!--flatpicker themes-->
    <link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
    <%@ include file="../header.jsp" %>
<body>
<!-- 공연 등록 시작-->
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
      <form id="add_play2" action="add_play2" method="post"> 
      	<!-- hidden으로 play_pseq값 넘겨준다. -->
      	<input type="hidden" name="play_pseq" value="${play_pseq}">
      	<input type="hidden" name="theater_id" value="${theater_id}">
        <label class="form-label" style="margin: 1rem 1rem 0rem 1rem;">공연일시</label>
        <div class="page-content page-container" id="page-content" style="margin-top: 0.9rem;">
          <div class="padding">
              <div class="row container">
                  <div class="col-lg-10 grid-margin stretch-card">
                      <div class="card">
                          <div class="card-body">
                              <h4 class="card-title text-center">모든 공연일시를 등록해 주세요</h4>
                              <hr>
                              
                              <div class="table-responsive">
                                  <table id="faqs" class="table table-hover">
                                      <thead>
                                          <tr>
                                              <th>공연일시</th>
                                          
                                          
                                              <th>삭제</th>
                                          </tr>
                                      </thead>
                                      <tbody>
                                          <tr>
                                              <td>
                                                <div class="mx-auto" >
                                                  
                                                      <input id="date-time-picker" name="add_play_schedule" placeholder="공연일시를 선택하세요">
                                                  
                                                </div>
                                              </td>                                              
                                              <td class="mt-10"><span class="badge bg-secondary"><i class="fa fa-trash"></i>삭제</td>
                                          </tr>
                                      </tbody>
                                  </table>
                              </div>
                              <div class="text-center"><button onclick="return addfaqs();" class="badge bg-success"><i class="fa fa-plus"></i> 추가</button></div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>

        <div class="d-flex justify-content-end">
        	<input type="submit" class="btn btn-sm" id="nextButton" style="width:4rem; margin: 0.5rem; background-color: #40B2FF;"value="다음">
        </div>
      </form>
      </div>
    </span>
  </div>
</div>
<!-- 공연 등록 끝-->
<%@ include file="../footer.jsp" %>

    <!--Jquery.js-->
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <!-- flatpicker min js -->
    <script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
    <!-- flatpicker ko -->
   	<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>
   	    <script> 
        $("input[id='date-time-picker']").flatpickr({
            enableTime: true,            // 시간 선택 여부
            altInput: true,              // 기존 입력을 숨기고 새 입력을 만듦
            altFormat: 'Y-m-d H:i',      // 날짜 선택 후 표시 형태
            dateFormat: 'Y-m-d H:i',     // date format 형식
            minDate: 'today',			 // 최소 선택 시간
            locale: 'ko',                // 한국어
            time_24hr: true,             // 24시간 형태
            disableMobile: true          // 모바일 지원 
        });
    </script>
    <!--flatpicker cdn-->
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <!--bootstrap cdn-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
      <!--추가 삭제 function-->
    <script>
      var faqs_row = 0;
      function addfaqs() {
    	  
          html  = '<tr id="faqs-row' + faqs_row + '">';
         
          html += '<td><div class="mx-auto" ><input id="date-time-picker" name="add_play_schedule" placeholder="공연일시를 선택하세요"></div></td>';
          
          html += '<td class="mt-10"><button class="badge bg-danger" onclick="$(\'#faqs-row' + faqs_row + '\').remove();"><i class="fa fa-trash"></i> 삭제</button></td>';
          
          html += '</tr>';
          
            $('#faqs tbody').append(html);
    
            faqs_row++;
            $("input[id='date-time-picker']").flatpickr({
              enableTime: true,            // 시간 선택 여부
              altInput: true,              // 기존 입력을 숨기고 새 입력을 만듦
              altFormat: 'Y-m-d H:i',      // 날짜 선택 후 표시 형태
              dateFormat: 'Y-m-d H:i',     // date format 형식
              minDate: 'today',			   // 최소 선택 시간
              locale: 'ko',                // 한국어
              time_24hr: true,             // 24시간 형태
              disableMobile: true          // 모바일 지원 
            });
            
            return false;
        }
        
        
    </script>
    <!-- flatpicker ko -->
    <script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

</body>