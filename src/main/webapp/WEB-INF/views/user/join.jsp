<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>
<script type="text/javascript"><%@include file="user.js"%></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
	<form id="join" action="join" method="post" name="formm" align="center">
	<h2 >회원가입</h2>
		<table align="center">
        	<tr>
	        	<td><input type="text" class="form-control" placeholder="아이디" name="user_id"  id="user_id"></td>
	        	<td><input type="hidden" name="reid" id="reid" value="${reid}">
	        	<input type="button" value="중복 체크"  class="btn btn-sm btn-outline-secondary" onclick="idcheck()"></td>
        	</tr>
        	<tr>
        		<td><input type="password" class="form-control" placeholder="비밀번호" name="user_password" id="user_password"></td>
        	</tr>
        	<tr>
        		<td><input type="password" class="form-control" placeholder="비밀번호 확인" name="pwdCheck" id="pwdCheck"/></td>
        	</tr>
        	<tr>
        		<td><input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="user_zip_num" id="user_zip_num" type="text" readonly="readonly"/>
        		<button type="button" class="btn btn-sm btn-outline-secondary" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button></td>
        	</tr>
        	<tr>
        		<td><input class="form-control" style="top: 5px;" placeholder="주소" name="addr1" id="addr1" type="text" readonly="readonly"/></td>
        	</tr>
        	<tr>
        		<td><input class="form-control" placeholder="상세주소" name="addr2" id="addr2" type="text"/></td>
        	</tr>
        	<tr>
        		<td><input class="form-control" placeholder="이름" type="text" name="user_name" id="user_name"></td>
        	</tr>
			<tr>
        		<td><input class="form-control" type="date" placeholder="생년월일" name="user_birth" id="user_birth"></td>
        	</tr>
        	<tr>
        		<td><input class="form-control" type="text" placeholder="휴대전화" name="user_phone" id="user_phone"></td>
        	</tr>
        	<tr>
        		<td><input type="text" class="form-control" name="email1" id="email1" placeholder="이메일"></td>
        		<td><select class="form-control" name="email2" id="email2" >
					<option>@naver.com</option>
					<option>@daum.net</option>
					<option>@gmail.com</option>
					<option>@hanmail.com</option>
					<option>@yahoo.co.kr</option>
					</select>
				</td>
        	</tr>
        	<tr>
        		<td>
        		<!-- 이메일 인증
				<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
				<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
				<span id="mail-check-warn"></span> -->
        		</td>
        	</tr>
        	<tr>
        		<td><input type="button" value="회원가입" class="btn btn-sm btn-outline-secondary" onclick="go_save()"></td>
        	</tr>
        </table>
	</form>
<%@ include file="../footer.jsp" %>
  