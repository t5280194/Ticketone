package com.ezen.biz.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaVO {
	private int qseq;
	private String user_id;
	private String qna_subject;
	private String qna_content;
	private Timestamp qna_indate;
	private String answer_subject;
	private String answer_content;
	private Timestamp answer_indate;
	private int qna_check;	// 0 = 답변대기, 1 = 답변완료
}
