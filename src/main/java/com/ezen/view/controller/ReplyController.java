package com.ezen.view.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.ezen.biz.dto.ReplyVO;
import com.ezen.biz.reply.ReplyService;

@Controller
@SessionAttributes("reply")
public class ReplyController {
		
	@Autowired
	private ReplyService replyService;
	
	// 댓글 작성
	@RequestMapping(value="/insertReply")
	public String insertReply(ReplyVO rvo) throws Exception{
		
	replyService.insertReply(rvo);
	
	return "redirect:play_detail?play_pseq="+rvo.getPlay_pseq();
	}

	/*
	//댓글 수정
	@RequestMapping(value="updateReply")
	public String updateReply(@ModelAttribute("reply") ReplyVO rvo)throws IOException{
		
		replyService.updateReply(rvo);
		
		return "redirect:getBook.do?book_id="+rvo.getBook_id();
	}
	*/
	
	//댓글 삭제
	@RequestMapping(value="deleteReply")
	public String deleteReply(ReplyVO rvo) throws Exception{
		
		replyService.deleteReply(rvo);
		
		return "redirect:play_detail?play_pseq="+rvo.getPlay_pseq();
	}
	
	
}
