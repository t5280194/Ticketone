package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {
	private int play_pseq;
	private int reply_pseq;
	private int reply_star;
	private String user_name;
	private String reply_content;
	private Date reply_date;
	
	private String star_image;
}
