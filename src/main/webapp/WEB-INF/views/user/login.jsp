<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>
<script type="text/javascript" src="user/user.js"></script>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>  
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
          <td><input type="submit" value="로그인" class="btn btn-sm btn-outline-secondary"></td>
          </tr>
          </table><br>
        <div class="clear"></div>
        <div id="buttons">
            <input type="button" value="아이디 찾기" class="btn btn-sm btn-outline-secondary"
                 onclick="find_id_form()">
            <input type="button" value="비밀번호 찾기" class="btn btn-sm btn-outline-secondary"
                 onclick="find_pwd_form()">
            <input type="button" value="회원가입" class="btn btn-sm btn-outline-secondary"
                 onclick="location='contract'">     
        </div>
    </form>  
  </article>
<%@ include file="../footer.jsp" %>