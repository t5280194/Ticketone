<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<h2>예매가 완료되었습니다.</h2><hr>
<form class="bookTicket5" method="POST">
	
	<c:forEach var="Discount_vipID" items="${Discount_vipID}">
		<p>${Discount_vipID}</p>
	</c:forEach>
</form>
<a href="index">메인화면으로</a>
</body>
</html>