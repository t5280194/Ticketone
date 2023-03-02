package com.ezen.biz.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.QnaDAO;
import com.ezen.biz.dto.QnaVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {
	
	@Autowired
	private QnaDAO qDao;
	
	// Qna 목록
	@Override
	public List<QnaVO> getlistQna(QnaVO vo){
		
		return qDao.listQna(vo);
	}
	
	// Qna 상세보기
	@Override
	public QnaVO getQna(int qseq) {
		
		return qDao.getQna(qseq);
	}
	
	// Qna 쓰기
	@Override
	public void insertQna(QnaVO vo) {
		
		qDao.insertQna(vo);
	}

	// Qna 답변하기
	@Override
	public void qna_Answer(QnaVO vo) {
		
		qDao.qna_Answer(vo);
	}
}
