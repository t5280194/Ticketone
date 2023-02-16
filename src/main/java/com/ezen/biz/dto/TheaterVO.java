package com.ezen.biz.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TheaterVO {
	private int theater_id;
	private String theater_name;
	private String theater_seatmap;
	private int seat_vip;
	private int seat_s;
	private int seat_a;
}
