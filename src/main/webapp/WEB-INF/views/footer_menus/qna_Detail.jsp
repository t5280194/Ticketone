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
        <!-- 답변 테이블 시작 -->
        <form id="qna_Answer" action="qna_Answer" method="post">
        <input type="hidden" name="qseq" value="${qnaVO.qseq}">        
        <c:choose>
         <c:when test="${qnaVO.qna_check == 0}"> <!-- 답변 대기 상태면 -->
         						<c:choose>
						          	<c:when test="${loginUser.admin_id != null}"> <!-- 관리자면 입력폼 -->
						          		
							           		<table class="table table-sm table-secondary">
									          <tr>
									            <th scope="row" style="width: 5rem;">답변제목</th>
									            <td><input type="text" class="form-control" id="answer_subject" name="answer_subject"></td>
									          </tr>
									          <tr>
									            <th scope="row" style="height:10rem;">답변내용</th>
									            <td>
												  <div class="mb-3">
									                <textarea class="form-control" id="answer_content" name="answer_content" rows="7"></textarea>
									              </div>
									            </td>
									          </tr>
									        </table>
								        
						          	</c:when>
						          	<c:otherwise>	<!-- 관리자 아니면 내용 -->
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
							            <th scope="row" style="height:10rem;">답변내용</th>
							            <td>
											${fn:replace(qnaVO.answer_content, replaceChar,"<br/>")}
							            </td>
							          </tr>
							        </table>
						          	</c:otherwise>
						          </c:choose>
         
         </c:when>
         <c:when test="${qnaVO.qna_check == 1}">	<!-- 답변 완료 상태면 -->
	         		<c:choose>
	  					<c:when test="${loginUser.admin_id != null}">	<!-- 관리자면 내용&수정 -->
	  						<table class="table table-sm table-secondary">	<!-- 답변내용 표시 -->
					          <tr>
					            <th scope="row" style="width: 5rem;">답변제목</th>
					            <td><input type="text" class="form-control" id="answer_subject" name="answer_subject" value="${qnaVO.answer_subject}"></td>
					          </tr>
					          <tr>
					            <th scope="row">작성일시</th>
					            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qnaVO.answer_indate}"/></td>
					          </tr>
					          <tr>
					            <th scope="row" style="height:10rem;">답변내용</th>
					            <td>
									<div class="mb-3">
						              <textarea class="form-control" id="answer_content" name="answer_content" rows="7">${qnaVO.answer_content}</textarea>
						            </div>
					            </td>
					          </tr>
					        </table>
		            	</c:when>
		            	<c:otherwise>	<!-- 유저면 답변내용 보이기 -->
		            		<table class="table table-sm table-secondary">	<!-- 답변내용 표시 -->
					          <tr>
					            <th scope="row" style="width: 5rem;">답변제목</th>
					            <td><c:out value="${qnaVO.answer_subject}"/></td>
					          </tr>
					          <tr>
					            <th scope="row">작성일시</th>
					            <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${qnaVO.answer_indate}"/></td>
					          </tr>
					          <tr>
					            <th scope="row" style="height:10rem;">답변내용</th>
					            <td>
									${fn:replace(qnaVO.answer_content, replaceChar,"<br/>")}
					            </td>
					          </tr>
					        </table>
		            	</c:otherwise>
	   				</c:choose>
         		
         </c:when>
        </c:choose>
        
        <!-- 답변 테이블 끝 -->
         
        <!-- 버튼 모음 -->
        <div class="d-flex justify-content-end">
        
        	<c:choose>
        		<c:when test="${qnaVO.qna_check == 0}">	<!-- 답변 대기 상태면 -->
		    				<c:choose>
		    					<c:when test="${loginUser.admin_id != null}">	<!-- 관리자면 등록버튼 -->
		    						<button type="submit" class="btn btn-sm " style="width:5rem; margin:5px; background-color: #40B2FF;">답변등록</button>
		    						<a type="button" class="btn btn-sm " href="qna_List" style="width:5rem; margin:5px; background-color: #40B2FF;">목록</a>
				            	</c:when>
				            	<c:otherwise>	<!-- 유저면 목록버튼 -->
				            		<a type="button" class="btn btn-sm " href="qna_List" style="width:5rem;  background-color: #40B2FF;">목록</a>
				            	</c:otherwise>
            				</c:choose>
        		</c:when>
        		<c:when test="${qnaVO.qna_check == 1}">	<!-- 답변 완료 상태면 -->
		        			<c:choose>
				            	
				            	<c:when test="${loginUser.admin_id != null}">	<!-- 관리자면 수정버튼 & 목록버튼-->
				            		<button type="submit" class="btn btn-sm " style="width:5rem; margin:5px; background-color: #40B2FF;">수정완료</button>
				            		<a type="button" class="btn btn-sm " href="qna_List" style="width:5rem; margin:5px; background-color: #40B2FF;">목록</a>
				            		
				            	</c:when>
				            	<c:otherwise>	<!-- 사용자면 목록버튼 -->
				            		<a type="button" class="btn btn-sm " href="qna_List" style="width:5rem;  background-color: #40B2FF;">목록</a>
				            	</c:otherwise>
				            </c:choose>
        		</c:when>
        	</c:choose>
        	
        	
        </div>
        <!-- 버튼 모음 끝-->
        </form>
      </div>
    </span>
  </div>
</div>
<!--qna내용 끝-->
</body>
<%@ include file="../footer.jsp" %>