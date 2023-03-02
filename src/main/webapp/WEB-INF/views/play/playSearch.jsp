<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<body>
  <div class="album py-5 ">
    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3">
        <c:forEach items="${playSearchList}" var="playVO">
	        <div class="col">
	          <div class="card shadow-sm">
	            <a href="play_detail?play_pseq=${playVO.play_pseq}"><img src="images/poster/${playVO.play_poster}" class="card-img-top" alt="..."></a>
	            <div class="card-body">
	              <p class="card-text">${playVO.play_name}</p>
	              <div class="d-flex justify-content-between align-items-center">
	                <a type="button" style="min-width:6rem;" href="play_detail?play_pseq=${playVO.play_pseq}" class="btn btn-sm btn-outline-secondary">공연 정보</a>
	                <small class="text-muted text-end">${playVO.play_date}</small>
	              </div>
	            </div>
	          </div>
	        </div>
        </c:forEach>
        
      </div>
    </div>
  </div>


</body>
<%@ include file="../footer.jsp" %>