<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="side">
        <tab>
            <h4>나의 예매 정보</h4>
            <table id="ticket_info" cellpadding="10">
                <tr height="50">
                    <th>공연</th>
                    <td>${PlayVO.play_name}</td>
                </tr>
                <tr height="60">
                    <th>일정</th>
                    <td id="date">
                    	<fmt:formatDate value="${Play_date}" type="date" dateStyle="full"/><br>
                    	<fmt:formatDate value="${Play_date}" type="time"/><br>
                    </td>
                </tr>
                <tr height="120">
                    <th>선택 좌석</th>
                    <td></td>
                </tr>
                <tr>
                    <th>티켓 금액</th>
                    <td></td>
                </tr>
                <tr>
                    <th>할인</th>
                    <td></td>
                </tr>
                <tr style="border-top: 2px solid  #333; font-size: large;">
                    <th>총 결제 금액</th>
                    <td></td>
                </tr>
            </table>
            
        </tab>
    </div>
