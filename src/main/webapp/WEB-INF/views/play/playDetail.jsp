<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%@ include file="../header.jsp" %>
<body>
<!--공연개요 시작-->
<div class="container text-center" style="width: max-content; min-width: 40rem;">
        <table class="table table-sm table-secondary border border-3 border-white container">
          <thead>
            <tr>
              <th scope="col" >공연명</th>
              <th scope="col">공연 기간</th>
              <th scope="col">공연장</th>
              <th scope="col">좋아요</th>
              <th scope="col">공연 예매</th>
            </tr>
          </thead>
          <tbody class="table-group-divider">
            <tr>
              <td style="padding-inline: 1rem;"><c:out value="${playVO.play_name}"/></td>
              <td style="padding-inline: 1rem;"><c:out value="${playVO.play_date}"/></td>
              <td style="padding-inline: 1rem;">
              	<c:choose>
					<c:when test="${playVO.theater_id == 1}">공연장1</c:when>
					<c:when test="${playVO.theater_id == 2}">공연장2</c:when>			
					<c:when test="${playVO.theater_id == 3}">공연장3</c:when>
					<c:when test="${playVO.theater_id == 4}">공연장4</c:when>
					<c:when test="${playVO.theater_id == 5}">공연장5</c:when>
			   </c:choose>
              </td>
              <td style="padding-inline: 1rem;">♡</td>
              <td style="padding-inline: 1rem;"><a href="#" type="button" class="btn btn-sm btn-outline-secondary" style= "width:5rem; color:#40B2FF">예매하기</a></td>
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
</body>
<%@ include file="../footer.jsp" %>