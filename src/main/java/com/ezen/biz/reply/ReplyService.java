package com.ezen.biz.reply;

import java.util.List;

import com.ezen.biz.dto.ReplyVO;

public interface ReplyService {
	
	// 새 댓글 등록
	void insertReply(ReplyVO reply);
		
	// 댓글 조회	
	List<ReplyVO> getReply(ReplyVO reply);
			
	//댓글 수정
	void updateReply(ReplyVO reply);
			
	//댓글 삭제
	void deleteReply(ReplyVO reply);
}