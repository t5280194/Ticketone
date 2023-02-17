package com.ezen.biz.qna;

import java.util.List;

import com.ezen.biz.dto.QnaVO;

public interface QnaService {
	
	// 전체 qna 목록 조회
	List<QnaVO> getlistQna(QnaVO vo);
	
	// qna 상세보기
	QnaVO getQna(int qseq);
	
	// qna 질문쓰기
	void insertQna(QnaVO vo);
	
}