package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReplyVO {
	private String play_name;
	private int play_pseq;
	private int reply_pseq;
	private int reply_star;
	private String user_name;
	private String reply_content;
	private Date reply_date;
	
	private String star_image;
	// reply 검색조건, 검색키워드
	private String replySearchCondition;
	private String replySearchKeyword;
	
}
