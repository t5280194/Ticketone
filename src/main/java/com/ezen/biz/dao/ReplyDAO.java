package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ReplyVO;

//SqlSessionDaoSupport 클래스를 이용한 Mybatis 구현
@Repository("replyDAO")
public class ReplyDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
		
	//새 댓글 등록
	public void insertReply(ReplyVO reply) {
		System.out.println("===> Mybatis로 insertReply() 기능 처리");
			
		mybatis.insert("replyMapper.insertReply", reply);
	}
		
	//댓글 조회
	public List<ReplyVO> getReply(ReplyVO reply){
		System.out.println("===> Mybatis로 getReply() 기능 처리");
		return mybatis.selectList("replyMapper.getReply", reply);
	}
		
	//댓글 수정
	public void updateReply(ReplyVO reply) {
		System.out.println("===> Mybatis로 updateReply() 기능 처리");
		mybatis.update("replyMapper.updateReply", reply);
	}
		
	//댓글 삭제
	public void deleteReply(ReplyVO reply) {
		System.out.println("===> Mybatis로 deleteReply() 기능 처리");
		mybatis.delete("replyMapper.deleteReply", reply);
	}
}
