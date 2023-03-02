package com.ezen.biz.dto;

import java.util.Date;

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
	private Date qna_indate;
	private String answer_subject;
	private String answer_content;
	private Date answer_indate;
	private int qna_check;	// 0 = 답변대기, 1 = 답변완료
	// qna 검색조건, 검색키워드
	private String qnaSearchCondition;
	private String qnaSearchKeyword;
}
