package com.ezen.view.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.biz.dto.PlayVO;
import com.ezen.biz.play.PlayService;

@Controller
public class HomeController {

	@Autowired
	private PlayService playservice;
	
	@RequestMapping(value="/index")
	public String home(Model model) {
		
		// 예매순 추천공연 3개
		List<PlayVO> bestSoldPlayList = playservice.getBestSoldPlayList();
		
		// 좋아요순 추천공연 5개
		List<PlayVO> bestLikePlayList = playservice.getBestLikePlayList();

		
		model.addAttribute("bestSoldPlayList", bestSoldPlayList);
		model.addAttribute("bestLikePlayList", bestLikePlayList);
		
		return "index";	//index.jsp 호출
	}
}
