package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.QnaVO;

@Repository
public class QnaDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 전체 qna 목록 조회
	public List<QnaVO> listQna() {
		System.out.println("qnaDao 목록조회접근");
		
		return mybatis.selectList("qnaMapper.listQna");
	}
	
	// qna 상세보기
	public QnaVO getQna(int qseq) {
		
		return mybatis.selectOne("qnaMapper.getQna", qseq);
	}
	
	// qna 쓰기
	public void insertQna(QnaVO vo) {
		
		mybatis.insert("qnaMapper.insertQna", vo);
	}
}
