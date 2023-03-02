<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="../header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<!-- <script type="text/javascript" src="user/user.js" charset="UTF-8"></script>--><!-- utf-8추가 -->
<script type="text/javascript" src="user.js"></script><!-- 위치 -->
<body>



<!--card 시작-->
<div class="d-flex justify-content-center">
  <div class="card" style="background-color: transparent; color: white; width: 38rem; margin: 0.1rem;">
    <span class="border border-white border border-2 rounded">
      <div class="card-body">
        		
					<form method="post" name="formm" action="update" id="update" align="center">
						<h2 >회원 정보 수정</h2>
							<table align="center">
					        	<tr>
						        	<td><input type="text" class="form-control" name="user_id" id="user_id" value="${sessionScope.loginUser.user_id}" readonly="readonly"></td>
					        	</tr>
					        	<tr>
					        		<td><input type="text" class="form-control" placeholder="${sessionScope.loginUser.user_name}" name="user_name" id="user_name" readonly="readonly"></td>
					        	</tr>
					        	<tr>
					        		<td><input class="form-control" type=text placeholder="${sessionScope.loginUser.user_birth}" name="user_birth" id="user_birth" readonly="readonly"></td>
					        	</tr>
					        	<tr>
					        		<td><input class="form-control" style="width: 40%; display: inline;" placeholder="우편번호" name="user_zip_num" id="user_zip_num" type="text" readonly="readonly"/>
					        		<button type="button" class="btn btn-outline-light" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button></td>
					        	</tr>
					        	<tr>
					        		<td><input class="form-control" style="top: 5px;" placeholder="주소" name="addr1" id="addr1" type="text" readonly="readonly"/></td>
					        	</tr>
					        	<tr>
					        		<td><input class="form-control" placeholder="상세주소" name="addr2" id="addr2" type="text"/></td>
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
					        	<!-- 이메일 인증
					        	<tr>
					        		<td>
									<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
									<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
									<span id="mail-check-warn"></span>
					        		</td>
					        	</tr>
					        	-->
					        	<tr>
					        		<td><input type="button" value="수정" class="btn btn-primary" onclick="updateUser()">
					        		<input type="button" value="취소" class="btn btn-primary" onclick="location='../biz/index.html'"></td>
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
** 회원 수정 
*/
function updateUser() {
	if ($("#user_zip_num").val() == "") {
		alert("주소를 입력해 주세요.");
		$("#user_zip_num").focus();
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
		$("#update").action = "update";
		$("#update").submit();
		alert("수정완료")
	}
}
</script>



	</body>
</html>
<%@ include file="../footer.jsp" %>
  