package com.ezen.biz.dto;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserVO {
	private String user_id;
	private String user_password;
	private String user_point;
	private String user_name;
	private String user_email;
	private String user_zip_num;
	private String user_address;
	private String user_phone;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date user_birth;
	private String user_gender;
	private Timestamp regdate;
	
	private String admin_id;
    private String admin_password;
}

