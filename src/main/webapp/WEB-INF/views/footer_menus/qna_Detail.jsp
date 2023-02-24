<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<%@ include file="../header.jsp" %>
<body>
<!--qna내용 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 50rem; margin: 1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        <label class="form-label " style="margin: 1rem">Q&A</label>

         <table class="table table-sm table-secondary" style="max-width:50rem">
          <tr>
            <th scope="row" style="width: 5rem;">질문제목</th>
            <td><c:out value="${qnaVO.qna_subject}"/></td>
          </tr>
          <tr>
            <th scope="row">작성자</th>
            <td><c:out value="${qnaVO.user_id}"/></td>
          </tr>
          <tr>
            <th scope="row">작성일시</th>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qnaVO.qna_indate}"/></td>
          </tr>
          <tr>
            <th scope="row" style="height:10rem;">내용</th>
            <td>
            	${fn:replace(qnaVO.qna_content, replaceChar,"<br/>")}
            </td>
          </tr>
        </table>

        <table class="table table-sm table-secondary">
          <tr>
            <th scope="row" style="width: 5rem;">답변제목</th>
            <td><c:out value="${qnaVO.answer_subject}"/></td>
          </tr>
          <tr>
            <th scope="row">작성일시</th>
            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qnaVO.answer_indate}"/></td>
          </tr>
          <tr>
            <th scope="row" style="height:10rem;">내용</th>
            <td>
				${fn:replace(qnaVO.answer_content, replaceChar,"<br/>")}
            </td>
          </tr>
        </table>
        <div class="d-flex justify-content-end">
        	<a type="button" class="btn btn-sm " href="qna_List" style="width:5rem;  background-color: #40B2FF;">목록</a>
        </div>
      </div>
    </span>
  </div>
</div>
<!--qna내용 끝-->
</body>
<%@ include file="../footer.jsp" %>