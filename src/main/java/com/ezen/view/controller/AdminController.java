package com.ezen.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.biz.admin.AdminService;
import com.ezen.biz.dto.TicketVO;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	//예매현황 보기
	@RequestMapping(value="/ticketList")
	public String TicketList(HttpSession session, Model model) {
		
		// 관리자 로그인 여부 확인
		// 나중에 추가
		
		List<TicketVO> ticketList = adminService.getTicketList();
		
		model.addAttribute("ticketList", ticketList);	// JSP에 값 전달
		
		System.out.println(ticketList);
		
		return "admin/ticketList";	//ticketList.jsp 호출
	}
	
	
}













