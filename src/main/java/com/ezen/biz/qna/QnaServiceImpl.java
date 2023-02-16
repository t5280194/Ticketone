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
	public List<QnaVO> getlistQna(){
		
		System.out.println("QnaServiceImpl 리스트 조회 접근");
		return qDao.listQna();
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
}