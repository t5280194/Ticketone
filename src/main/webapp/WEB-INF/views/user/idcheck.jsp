<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="user/user.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.2.min.js" integrity="sha256-2krYZKh//PcchRtd+H+VyyQoZ/e3EcrkxhM8ycwASPA=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>아이디 중복 체크</title>

<script type="text/javascript">
function idok(){
  opener.formm.user_id.value="${id}"; 
  opener.formm.reid.value="${id}";
  self.close();
}
</script>
</head>
<body>
<div id="wrap">
  <h1>ID 중복확인</h1>
  <form method=post name=formm id="theform" style="margin-right:0 "	action="id_check_form" >
    User ID <input class="form-control" type=text name="user_id" value="${id}"> 
            <input type=submit value="검색" class="btn btn-sm btn-outline-secondary"><br>     
    <div style="margin-top: 20px">   
      <c:if test="${message == 1}">
        <script type="text/javascript">
          opener.document.formm.user_id.value="";
        </script>
        ${id}는 이미 사용중인 아이디입니다.
      </c:if>
      <c:if test="${message==-1}">
        ${id}는 사용 가능한 ID입니다.
        <input type="button" value="사용" class="btn btn-sm btn-outline-secondary" onclick="idok()">
      </c:if>
    </div>
  </form>
</div>  
</body>
</html>