package com.ezen.biz.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ScheduleVO {
	private int play_pseq;
	private int schedule_seq;
	private Date play_schedule;
	private String add_play_schedule;
	private int vip_count;
	private int s_count;
	private int a_count;
	
}
