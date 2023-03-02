<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<body>
<!--예매현황 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 80rem; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        <label class="form-label " style="margin: 1rem">댓글 관리</label>

      <div class="container d-flex flex-wrap justify-content-center" style="margin-bottom: 0.5rem;">
        
        <form class="col-12 col-lg-auto mb-2 mb-lg-0 me-lg-auto">
        
        <div class="row mb-3" style="margin:1pix;">
        <select class="form-select form-select-sm" name="replySearchCondition" id="replySearchCondition" style="width:auto;">
              <option selected value="play_name">공연명</option>
              <option value="user_name">작성자명</option>
              <option value="reply_content">댓글내용</option>
        </select>
        
        <div class="col-sm-7" style="margin:1pix;">
          <input type="search" name="replySearchKeyword" id="replySearchKeyword" class="form-control form-control-sm" aria-label="Search">
          </div>
        </div>
        </form>

       </div>

        <table class="table table-sm table-striped table-hover table-secondary">
          <thead>
            <tr>
              <th scope="col">작성시간</th>
              <th scope="col">공연명</th>
              <th scope="col">작성자명</th>
              <th scope="col">별점</th>
              <th scope="col">내용</th>
              <th scope="col">삭제</th>
            </tr>
          </thead>
          <tbody>
          
            <c:forEach items="${replyList}" var="replyVO">
	            <tr>
	              <td><fmt:formatDate value="${replyVO.reply_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	              <td><c:out value="${replyVO.play_name}"/></td>
	              <td><c:out value="${replyVO.user_name}"/></td>
	              <td><c:out value="${replyVO.reply_star}"/></td>
	              <td><c:out value="${replyVO.reply_content}"/></td>	              
	              <td>
	            <a type="button" class="badge bg-danger" style="border-radius: 7;
												        font-size: 12px;
												        line-height: 1;
												        padding: .375rem .5625rem;
												        font-weight: normal;
												        border: none;"
        		href="adminReplyDelete?reply_pseq=${replyVO.reply_pseq}">삭제</a>
              	</td>	              
	            </tr>
           	</c:forEach>

          </tbody>
        </table>

      </div>
    </span>
  </div>
</div>
<!--예매현황 끝-->
</body>
<%@ include file="../footer.jsp" %>