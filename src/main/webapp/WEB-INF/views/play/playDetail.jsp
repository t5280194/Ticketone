<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%@ include file="../header.jsp" %>
<style>
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 3rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover,
.star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}
</style>
<body>
<!--공연개요 시작-->
<div class="container text-center" style="width: max-content; min-width: 40rem;">
        <table class="table table-sm table-secondary border border-3 border-white container">
          <thead>
            <tr>
              <th scope="col" >공연명</th>
              <th scope="col">공연 기간</th>
              <th scope="col">공연장</th>
              <!-- <th scope="col">좋아요</th> -->
              <th scope="col">공연 예매</th>
            </tr>
          </thead>
          <tbody class="table-group-divider">
            <tr>
              <td style="padding-inline: 1rem;"><c:out value="${playVO.play_name}"/></td>
              <td style="padding-inline: 1rem;"><c:out value="${playVO.play_date}"/></td>
              <td style="padding-inline: 1rem;">
              	<c:choose>
					<c:when test="${playVO.theater_id == 1}">하늘대공연장</c:when>
					<c:when test="${playVO.theater_id == 2}">스타콘서트홀</c:when>			
					<c:when test="${playVO.theater_id == 3}">서울예술극장</c:when>
					<c:when test="${playVO.theater_id == 4}">상상극장</c:when>
					<c:when test="${playVO.theater_id == 5}">희망소극장</c:when>
			   </c:choose>
              </td>
              <!-- <td style="padding-inline: 1rem;">♡</td> -->
              <td style="padding-inline: 1rem;"><a href="book_ticket1?play_pseq=${playVO.play_pseq}" type="button" class="btn btn-sm btn-outline-secondary" style= "width:5rem; color:#40B2FF">예매하기</a></td>
            </tr>

          </tbody>
        </table>
      </div>
     
<!--공연개요 끝-->
<!--공연 세부정보 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: auto; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
      <c:if test="${playVO.play_image1 ne 'noImage.jpg'}">
        <img src="images/play_info/${playVO.play_image1}">
      </c:if>
        <br>
      <c:if test="${playVO.play_image2 ne 'noImage.jpg'}">
        <img src="images/play_info/${playVO.play_image2}">
      </c:if>
        <br>
      <c:if test="${playVO.play_image3 ne 'noImage.jpg'}">
        <img src="images/play_info/${playVO.play_image3}">
      </c:if>
      
      <p class="text-md-start">${fn:replace(playVO.play_content, replaceChar, "<br/>")}</p>

      </div>
    </span>
  </div>
</div>
<!--공연 세부정보 끝-->
<!-- 댓글 정보 -->
<div class="container text-center" style="width: max-content; min-width: 40rem;">
	<table class="table table-sm table-secondary border border-3 border-white container">
		<thead>
			<tr>
				<th scope="col" >작성자</th>
				<th scope="col">작성시간</th>
				<th scope="col">평점</th>
				<th scope="col">댓글 내용</th>
				<th scope="col">삭제</th>
			</tr>
		</thead>
		<tbody class="table-group-divider">
		<c:forEach items="${replyList}" var="reply">
            <tr>
              <td style="padding-inline: 1rem;"><c:out value="${reply.user_name}"/></td>
              <td style="padding-inline: 1rem;"><fmt:formatDate value="${reply.reply_date}" pattern="yyyy-MM-dd"/></td>
			  <td style="padding-inline: 1rem;"><c:out value="${reply.star_image}"/></td>
              <td style="padding-inline: 1rem;"><c:out value="${reply.reply_content}"/></td>
              <td style="padding-inline: 1rem;">
              	<a href="deleteReply?reply_pseq=${reply.reply_pseq}&play_pseq=${reply.play_pseq}"
              	type="button" class="btn btn-sm btn-outline-secondary" style= "width:5rem; color:#40B2FF">삭제하기</a>
              </td>
            </tr>
          </c:forEach>
          </tbody>
	</table>
</div>
<!-- 댓글 정보 끝 -->

<!-- 댓글 작성 -->
<c:choose>
	<c:when test="${empty sessionScope.loginUser}">
	</c:when>
	<c:otherwise>
	<div class="container text-center" style="width: max-content; min-width: 40rem;">
		<form method="post" action="insertReply" name="insertReply">
			<p>
				<input type=hidden name="play_pseq" value="${playVO.play_pseq}">
			</p>
			<p>
				<input type="hidden" name="user_name" value="${sessionScope.loginUser.user_name}" class="form-control" readonly="readonly">
			</p>
		<div class="star-rating space-x-4 mx-auto">
			<input type="radio" id="5-stars" name="reply_star" value="5"/>
			<label for="5-stars" class="star pr-4">★</label>
			<input type="radio" id="4-stars" name="reply_star" value="4"/>
			<label for="4-stars" class="star">★</label>
			<input type="radio" id="3-stars" name="reply_star" value="3"/>
			<label for="3-stars" class="star">★</label>
			<input type="radio" id="2-stars" name="reply_star" value="2"/>
			<label for="2-stars" class="star">★</label>
			<input type="radio" id="1-star" name="reply_star" value="1"/>
			<label for="1-star" class="star">★</label>
		</div>
		<div>
			<textarea class="col-auto form-control" name="reply_content" placeholder="관람평을 남겨주세요."></textarea>
		</div>
			<p>
				<button type="submit" class="btn btn-sm btn-outline-secondary">작성하기</button>
			</p>
		</form>
	</div>
	</c:otherwise>
</c:choose>
<!-- 댓글 작성 끝 -->

</body>
<%@ include file="../footer.jsp" %>