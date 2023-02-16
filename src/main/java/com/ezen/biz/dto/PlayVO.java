package com.ezen.biz.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PlayVO {
	private int play_pseq;
	private String play_name;
	private String play_date;
	private String play_kind;
	private int play_price_vip;
	private int play_price_s;
	private int play_price_a;
	private String play_poster;
	private String play_image1;
	private String play_image2;
	private String play_image3;
	private String play_content;
	private int play_like_rate;
	private Timestamp play_regdate;
	private int theater_id;
}
