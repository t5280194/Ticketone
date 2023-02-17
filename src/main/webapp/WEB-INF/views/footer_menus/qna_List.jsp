<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<body>
<!--qna list 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 50rem; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        <label class="form-label " style="margin: 1rem">Q&A</label>

      <div class="container d-flex flex-wrap justify-content-center" style="margin-bottom: 1rem;">
        
          <form class="col-9 col-lg-auto mb-2 mb-lg-0 me-lg-auto" style="margin: 1px;">
        	
        	<div class="row mb-3" style="margin:0;">
	        	
	        	<select class="form-select form-select-sm " style="width:6.4rem;" name="qnaSearchCondition" id="qnaSearchCondition">
	              <option selected value="0">제목</option>
	              <option value="1">작성자</option>
	              <option value="2">답변여부</option>
	          	</select>
	            
	            <div class="col-sm-7" style="margin:0;">
	            	<input type="search" class="form-control form-control-sm" name="qnaSearchKeyword" id="qnaSearchKeyword" aria-label="Search">
	            </div>
	            
            </div>
          </form>
          <c:out value="${qnaSearchCondition}"/>
          <c:out value="${qnaSearchKeyword}"/>
          <div>
          <c:choose>
          	<c:when test="${empty sessionScope.loginUser}">
          	<a type="button" class="btn btn-sm " href="login_form" style="width:5rem;  background-color: #40B2FF;">질문하기</a>
          	</c:when>
          	<c:when test="${loginUser.user_id ne ''}">
          	<a type="button" class="btn btn-sm " href="qna_Write" style="width:5rem;  background-color: #40B2FF;">질문하기</a>
          	</c:when>
          </c:choose>
          </div>
      </div>
        

        <table class="table table-sm table-striped table-hover table-secondary">
          <thead>
            <tr>
              <th scope="col">답변여부</th>
              <th scope="col">작성자</th>
              <th scope="col">작성일시</th>
              <th scope="col">제목</th>
            </tr>
          </thead>
          <tbody>
	          <c:forEach items="${qnaList}" var="qnaVO">
	            <tr>
	              <th scope="row">
	              <c:choose>
	              	<c:when test="${qnaVO.qna_check == '0'}">답변대기</c:when>
	              	<c:when test="${qnaVO.qna_check == '1'}">답변완료</c:when>
	              </c:choose>
	              </th>
	              <td><c:out value="${qnaVO.user_id}"/></td>
	              <td><c:out value="${qnaVO.qna_indate}"/></td>
	              <td><a href="qna_Detail?qseq=${qnaVO.qseq}"><c:out value="${qnaVO.qna_subject}"/></a></td>
	            </tr>
	          </c:forEach>
            
          </tbody>
        </table>

      </div>
    </span>
  </div>
</div>
<!--qna list 끝-->

</body>
<%@ include file="../footer.jsp" %>