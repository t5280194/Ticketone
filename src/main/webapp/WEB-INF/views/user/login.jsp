<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<meta charset="UTF-8">
<%@ include file="../header.jsp" %>
<!-- <script type="text/javascript" src="user/user.js" charset="UTF-8"></script>--><!-- utf-8추가 -->
<script type="text/javascript" src="/js/user1.js"></script><!-- 위치 -->
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>


<!--card 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; max-width: 38rem; margin: 0.1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        		
        		  <article align="center">
				    <h1>로그인</h1>
				    <hr>
				    <form method="post" action="login">
				          <table align="center">
				          <tr>
							<td><input class="form-control" name="user_id" type="text" value="${user_id}" placeholder="아이디"></td>
				          </tr>   
				          <tr>
							<td><input class="form-control" name="user_password" type="password" placeholder="비밀번호"></td>
				          <td><input type="submit" value="로그인" class="btn btn-light"></td>
				          </tr>
				          </table><br>
				        <div class="clear"></div>
				        <div id="buttons">
				            <input type="button" value="아이디 찾기" class="btn btn-sm btn-primary"
				                 onclick="find_id_form()">
				            <input type="button" value="비밀번호 찾기" class="btn btn-sm btn-primary"
				                 onclick="find_pwd_form()">
				            <input type="button" value="회원가입" class="btn btn-sm btn-primary"
				                 onclick="location='contract'">     
				        </div>
				    </form>  
				  </article>
        
        
    	</div>
    </span>
  </div>
</div>
<!--card 끝-->
<script type="text/javascript">
/*
** 아이디 찾기 화면 요청
*/
function find_id_form() {
	var url = "find_id_form";
	window.open(url, "_self", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");	
}

/*
** 비밀번호 찾기 화면 요청
*/
function find_pwd_form() {
	var url = "find_pwd_form";
	window.open(url, "_self", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");	
}


</script>

  

<%@ include file="../footer.jsp" %>