<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!-- 예매순 공연 추천 시작 케러셀-->
<div class="d-flex justify-content-center">
  <div id="carouselExampleIndicators" style="width:18.5rem; margin:40px" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      
      <div class="carousel-item active" data-bs-interval="3000">
        <a href="play_detail?play_pseq=${bestSoldPlayList[0].play_pseq}"><img src="images/poster/<c:out value="${bestSoldPlayList[0].play_poster}"/>" alt="..."></a>
      </div>
      
      <div class="carousel-item" data-bs-interval="3000">
        <a href="play_detail?play_pseq=${bestSoldPlayList[1].play_pseq}"><img src="images/poster/<c:out value="${bestSoldPlayList[1].play_poster}"/>" alt="..."></a>
      </div>
      
      <div class="carousel-item" data-bs-interval="3000">
        <a href="play_detail?play_pseq=${bestSoldPlayList[2].play_pseq}"><img src="images/poster/<c:out value="${bestSoldPlayList[2].play_poster}"/>" alt="..."></a>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</div>
<!-- 예매순 공연 추천 끝 케러셀 -->

<!-- 좋아요순 공연 시작 -->
<div class="album py-5 ">
  <div class="container">

    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-5 g-3">
      
      <c:forEach items="${bestLikePlayList}" var="playVO">
      <div class="col">
        <div class="card shadow-sm">
          <a href="play_detail?play_pseq=${playVO.play_pseq}"><img src="images/poster/${playVO.play_poster}" class="card-img-top" alt="..."></a>
          <div class="card-body">
            <p class="card-text">${playVO.play_name}</p>
            <div class="d-flex justify-content-between align-items-center">
              
                <a type="button" style="min-width:6rem;" href="play_detail?play_pseq=${playVO.play_pseq}" class="btn btn-sm btn-outline-secondary">공연 정보</a>
              
              <small class="text-muted text-end" >${playVO.play_date}</small>
            </div>
          </div>
        </div>
      </div>
      </c:forEach>
      
    </div>
  </div>
</div>
<!-- 좋아요순 추천 끝 -->
    
<%@ include file="footer.jsp" %>