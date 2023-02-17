package com.ezen.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.admin.AdminService;
import com.ezen.biz.dto.PlayVO;
import com.ezen.biz.dto.TicketVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	// 예매현황 보기
	@RequestMapping(value="/ticketList")
	public String TicketList(TicketVO vo, HttpSession session, Model model) {
		
		// 관리자 로그인 여부 확인
		// 나중에 추가
		
		List<TicketVO> ticketList = adminService.getTicketList(vo);
		
		model.addAttribute("ticketList", ticketList);	// JSP에 값 전달
		
		System.out.println(ticketList);
		
		return "admin/ticketList";	//ticketList.jsp 호출
	}
	
	// 공연 등록하기
	@RequestMapping(value="add_play1")
	public String addPlay1(PlayVO vo, HttpSession session, Model model) {
		
		// 관리자 로그인 여부 확인
		// 나중에 추가
		System.out.println("add1");
		return "admin/add_play1";	//add_play_1.jsp 호출
	}
	@RequestMapping(value="add_play2", method=RequestMethod.POST)
	public String addPlay2(PlayVO vo, HttpSession session, Model model) {
		
		// 관리자 로그인 여부 확인
		// 나중에 추가
		System.out.println("add2");
		return "admin/add_play2";	//add_play_2.jsp 호출
	}
	
}













