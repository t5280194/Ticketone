package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TicketVO {
	private int tseq;
	private int play_pseq;
	private String play_name;
	private String ticket_id;	//티켓 예매번호(T+공연장+공연일시+좌석번호)(T12301201900H23)
    private String user_id;
    private String user_name;
    private Date buy_date;
    private int theater_id;
    private int schedule_seq;
    private String ticket_seat;
    private int discount_id;
    private int pay_id;
    private String pay_name;
    private int pay_amount;
    private String ticketSearchCondition;
    private String ticketSearchKeyword;
    // 예매현황 확인 위한 객체
    
    
    
}
