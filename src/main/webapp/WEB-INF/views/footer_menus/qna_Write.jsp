<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%@ include file="../header.jsp" %>
<body>
<!--qna write내용 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 50rem; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        <label class="form-label " style="margin: 1rem">Q&A 질문하기</label>

		<form action="qna_Write_Action" method="post" name="qna">
	        <table class="table table-sm table-secondary" style="max-width: 50rem;">
	          <tr>
	            <th scope="row" style="width: 5rem;">제목</th>
	            <td><input type="text" class="form-control" id="qna_subject" name="qna_subject"></td>
	          </tr>
	          <tr>
	            <th scope="row">작성자</th>
	            <td>
	            <input class="form-control" id="user_id" name="user_id"type="text"
	            placeholder="${sessionScope.loginUser.user_id}"
	            aria-label="Disabled input example" disabled></td>
	          
	          </tr>
	          <tr>
	            <th scope="row" style="height:8rem;">내용</th>
	            <td>
	              <div class="mb-3">
	                <textarea class="form-control" id="qna_content" name="qna_content" rows="7"></textarea>
	              </div>
	            </td>
	          </tr>
	        </table>
	        <div class="d-flex justify-content-end">
	          <button class="btn btn-sm" type="submit" style="width:5rem; background-color: #40B2FF;">작성완료</button>
	        </div>
		</form>

      </div>
    </span>
  </div>
</div>
<!--qna write내용 끝-->
</body>
<%@ include file="../footer.jsp" %>