<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>
<!-- <script type="text/javascript" src="user/user.js" charset="UTF-8"></script>--><!-- utf-8추가 -->
<script type="text/javascript" src="user.js"></script><!-- 위치 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>



<!--card 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; max-width: 38rem; margin: 0.1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        		
					<form id="join" action="join" method="post" name="formm" align="center">
					<h2 >회원가입</h2>
						<table align="center">
				        	<tr>
					        	<td><input type="text" class="form-control" placeholder="아이디" name="user_id"  id="user_id"></td>
					        	<td><input type="hidden" name="reid" id="reid" value="${reid}">
					        	<input type="button" value="중복 체크"  class="btn btn-primary" onclick="idcheck()"></td>
				        	</tr>
				        	<tr>
				        		<td><input type="password" class="form-control" placeholder="비밀번호" name="user_password" id="user_password"></td>
				        	</tr>
				        	<tr>
				        		<td><input type="password" class="form-control" placeholder="비밀번호 확인" name="pwdCheck" id="pwdCheck"/></td>
				        	</tr>
				        	<tr>
				        		<td><input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="user_zip_num" id="user_zip_num" type="text" readonly="readonly"/>
				        		<button type="button" class="btn btn-sm btn-outline-light" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button></td>
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
				        		<td><input type="button" value="회원가입" class="btn btn-primary" onclick="go_save()"></td>
				        	</tr>
				        </table>
					</form>
        
    	</div>
    </span>
  </div>
</div>
<!--card 끝-->
<script type="text/javascript">
/*
** 사용자 ID 입력여부 확인
** id 중복확인 윈도우 오픈
*/
function idcheck() {
	
	// 회원가입 화면에 ID값 입력여부 확인
	if ($("#user_id").val() == "") {
		alert("아이디를 입력해 주세요!");
		$("#user_id").focus();
		
		return false;
	}
	
	// ID중복확인 화면 요청
	var url = "id_check_form?user_id="+$("#user_id").val();
	window.open(url, "_blank_", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");
}

/*
** 우편번호 찾기 화면 요청
*/
function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                document.getElementById('user_zip_num').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullRoadAddr; 
                
				/* document.getElementById('signUpUserPostNo').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('signUpUserCompanyAddress').value = fullRoadAddr;
                document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
            }
         }).open();
     }

/*
** 회원 가입시 필수입력 확인
*/
function go_save() {
	if ($("#user_id").val() == "") {
		alert("사용자 아이디를 입력해 주세요.");
		$("#user_id").focus();
		return false;
	} else if ($("#reid").val() == "") {
		alert("아이디 중복체크를 해주세요.");
		$("#reid").focus();
		return false;
	} else if ($("#user_password").val() == "") {
		alert("비밀번호를 입력해 주세요.");
		$("#user_password").focus();
		return false;
	} else if ($("#user_password").val() != $("#pwdCheck").val()) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#user_password").focus();
		return false;
	} else if ($("#user_zip_num").val() == "") {
		alert("주소를 입력해 주세요.");
		$("#user_zip_num").focus();
		return false;
	} else if ($("#user_name").val() == "") {
		alert("이름을 입력해 주세요.");
		$("#user_name").focus();
		return false;
	} else if ($("#user_birth").val() == "") {
		alert("생년월일을 입력해 주세요.");
		$("#user_birth").focus();
		return false;
	} else if ($("#user_phone").val() == "") {
		alert("휴대전화를 입력해 주세요.");
		$("#user_phone").focus();
		return false;
	} else if ($("#email1").val() == "") {
		alert("이메일을 입력해 주세요.");
		$("#email1").focus();
		return false;
	} else {
		$("#join").action = "join";
		$("#join").submit();
	}
}
</script>



<%@ include file="../footer.jsp" %>
  