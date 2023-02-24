package com.ezen.view.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.PlayVO;
import com.ezen.biz.dto.ReplyVO;
import com.ezen.biz.play.PlayService;
import com.ezen.biz.reply.ReplyService;

@Controller
public class PlayController {

	@Autowired
	private PlayService playService;
	
	@Autowired
	private ReplyService replyService;
	
	//카테고리별 공연 보기
	@RequestMapping(value="category", method=RequestMethod.GET)
	public String PlayKindAction(PlayVO vo, Model model) {
		
		List<PlayVO> kindList = playService.getPlayListByKind(vo.getPlay_kind());
		
		System.out.println(kindList);
		
		model.addAttribute("playKindList", kindList);
		
		return "play/playKind";	// playKind.jsp 호출
	}
	
	// 공연 상세 정보
	@RequestMapping(value="play_detail")
	public String playDetailAction(PlayVO vo, Model model,ReplyVO rvo) {
		
		// 공연 상세 조회
		PlayVO play = playService.getPlay(vo);
		
		// JSP에 결과 전달
		model.addAttribute("playVO", play);
		
		// 댓글 조회
		rvo.setReply_pseq(vo.getPlay_pseq());
		List<ReplyVO> reply = replyService.getReply(rvo);
				
		List<ReplyVO> replyList = new ArrayList<ReplyVO>();
		for (ReplyVO replyVO : reply) {
			if (replyVO.getReply_star() <= 1) {
				replyVO.setStar_image("★☆☆☆☆");
			} else if (replyVO.getReply_star() > 1 && replyVO.getReply_star() <=2) {
				replyVO.setStar_image("★★☆☆☆");
			} else if (replyVO.getReply_star() > 2 && replyVO.getReply_star() <=3) {
				replyVO.setStar_image("★★★☆☆");
			} else if (replyVO.getReply_star() > 3 && replyVO.getReply_star() <=4) {
				replyVO.setStar_image("★★★★☆");
			} else {
				replyVO.setStar_image("★★★★★");
			}
			replyList.add(replyVO);
		}
		model.addAttribute("replyList", replyList);
		
		// JSP 화면 호출
		return "play/playDetail";
		
	}
	
	// 공연 검색
	@RequestMapping(value="/search")
	public String playSearchAction(PlayVO vo, Model model) {
		
		List<PlayVO> searchList = playService.getPlayListBySearch(vo.getPlay_name());
		
		
		model.addAttribute("playSearchList", searchList);
		
		return "play/playSearch";	// playSearch.jsp 호출
	}
	
	
}









