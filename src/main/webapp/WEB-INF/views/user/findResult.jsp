<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.io.*, java.util.Date, java.util.Calendar, java.util.Enumeration" %>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<style type="text/css">
body{   
  background-color:#B96DB5;
  font-family: Verdana;
}
#wrap{     
  margin: 0 20px;
}
h1 {
  font-family: "Times New Roman", Times, serif;
  font-size: 45px;
  color: #CCC;
  font-weight: normal;
}
label {
	display: inline-block;
    width: 150px;
}
</style>
<script type="text/javascript">
function idok() {
	var url = "login_form";
	window.open(url, "_self", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=350");
}
</script>
</head>
<body>
<div id="wrap" align="center">
<h1>ID 찾기 결과</h1>
<form method=post name=formm style="margin-right:0 " action="id_check_form">
    User ID <input type=text name="id" class="form-control" value="${id}">   
    <div style="margin-top: 20px">   
      <c:if test="${message == 1}">
        <script type="text/javascript">
          opener.document.formm.id.value="";
        </script>
             요청하신 ID는 ${id}입니다.
      </c:if>
      <c:if test="${message == -1}">
             가입하지 않은 ID입니다.
      </c:if>
    </div>
    <input type="button" value="확인" class="btn btn-sm btn-outline-secondary" onclick="idok()">
  </form>
</div>  
</body>
</html>
<%@ include file="../footer.jsp" %>
