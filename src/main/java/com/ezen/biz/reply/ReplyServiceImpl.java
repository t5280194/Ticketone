package com.ezen.biz.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ReplyDAO;
import com.ezen.biz.dto.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	private ReplyDAO rDao;
	
	public ReplyServiceImpl() {}
	
	// 관리자 댓글 관리
	@Override
	public List<ReplyVO> replyList(ReplyVO rvo) {
		
		return rDao.replyList(rvo);
	}
	
	// 관리자 댓글 삭제
	@Override
	public void adminReplyDelete(ReplyVO rvo) {
		
		rDao.adminReplyDelete(rvo);		
	}
	
	@Override
	public void insertReply(ReplyVO reply) {
		rDao.insertReply(reply);
	}
	
	@Override
	public List<ReplyVO> getReply(ReplyVO reply) {
		return rDao.getReply(reply);
	}
	
	@Override
	public void updateReply(ReplyVO reply){
		rDao.updateReply(reply);
	}
	
	@Override
	public void deleteReply(ReplyVO reply) {
		rDao.deleteReply(reply);
	}

	
}
