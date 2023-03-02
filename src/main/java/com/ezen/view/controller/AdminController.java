package com.ezen.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.biz.admin.AdminService;
import com.ezen.biz.dto.PlayVO;
import com.ezen.biz.dto.ReplyVO;
import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.TicketVO;
import com.ezen.biz.reply.ReplyService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private ReplyService replyService;
	
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
	
	// 댓글 관리
	@RequestMapping(value="/replyList")
	public String replyList(ReplyVO rvo, HttpSession session, Model model) {
		// 관리자 로그인 여부 확인
		
		// 검색조건 있다면
		if (rvo.getReplySearchCondition()==null) rvo.setReplySearchCondition("");
		if (rvo.getReplySearchKeyword()==null) rvo.setReplySearchKeyword("");
		System.out.println(">>>>>>>reply검색조건="+rvo.getReplySearchCondition());
		System.out.println(">>>>>>>reply검색키워드="+rvo.getReplySearchKeyword());
		
		List<ReplyVO> replyList = replyService.replyList(rvo);
		model.addAttribute("replyList", replyList);
		System.out.println(">>>>>>>replyList컨트롤러 replyList : " + replyList);
		
		return "admin/replyList";	//replyList.jsp 호출
	}
	
	// 관리자 댓글 삭제
	@RequestMapping(value="adminReplyDelete")
	public String adminReplyDelete(ReplyVO rvo, HttpSession session, Model model) {
		// 관리자 로그인 여부 확인
		
		replyService.adminReplyDelete(rvo);
		
		return "redirect:replyList";	//ticketList.jsp 호출
	}
	
	// 공연 등록하기 1/4 (기본정보)
	@GetMapping(value="add_play1")
	public String addPlay1View(PlayVO vo, HttpSession session, Model model) {
		
		// 관리자 로그인 여부 확인
		// 나중에 추가
		System.out.println("add_play1 GET Controller 접근");
		return "admin/add_play1";	//add_play_1.jsp 호출
	}
	@PostMapping(value="add_play1")
	public String addPlay1Action(PlayVO vo,
								@RequestParam(value="upload_poster") MultipartFile uploadFile,
								@RequestParam(value="theater_id") int theater_id,
								HttpSession session, Model model) {
		// 관리자 로그인 여부 확인
		// 나중에 추가
		
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			vo.setPlay_poster(fileName);
			
			// 이미지 파일을 실제 경로로 이동하기
			String image_path = session.getServletContext().getRealPath("WEB-INF/resources/images/poster/");
			
			try {
				uploadFile.transferTo(new File(image_path + fileName));
			} catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		//adminService.insertPlayTemp(vo);
		
		System.out.println("add_play1 POST Controller 접근");
		System.out.println("공연분류 : " + vo.getPlay_kind());
		System.out.println("공연명 : " + vo.getPlay_name());
		System.out.println("공연기간 : " + vo.getPlay_date());
		System.out.println("공연장 : " + vo.getTheater_id());
		System.out.println("play pseq : " + vo.getPlay_pseq());
		
		System.out.println("addplay1 컨트롤러 돌려받은 play_pseq = " + vo.getPlay_pseq());
		int play_pseq = adminService.insertPlayTemp(vo);
		
		model.addAttribute("play_pseq", play_pseq);
		model.addAttribute("theater_id", theater_id);
		return "admin/add_play2";	// add_play2.jsp 호출
	}
	
	// 공연 등록하기 2/4 (공연일시)
	@PostMapping(value="add_play2")
	public String addPlay2Action(@RequestParam("play_pseq") int play_pseq,
						   		 @RequestParam("add_play_schedule") String add_play_schedule,
						   		 @RequestParam("theater_id") int theater_id,
						   		 ScheduleVO svo,
						   		 HttpSession session,
						   		 Model model) {

		System.out.println(">>>>>>>add_play2 POST Controller 접근");
		System.out.println(">>>>>>>play_pseq : " + play_pseq);
		System.out.println(">>>>>>>공연일시 목록(String) : " + add_play_schedule);
		
		svo.setAdd_play_schedule(add_play_schedule);
		adminService.insertPlay2Temp(svo);

		model.addAttribute("play_pseq", play_pseq);
		//model.addAttribute("play_schedule", add_play_schedule);
		model.addAttribute("theater_id", theater_id);
		
		return "admin/add_play3";	// add_play3.jsp 호출
	}
	
	// 공연 등록하기 3/4 (이미지, 콘텐츠)
	@PostMapping(value="add_play3")
	public String addPlay3Action(@RequestParam("play_pseq") int play_pseq,
								 @RequestParam("theater_id") int theater_id,
						   		 @RequestParam(value="upload_image1") MultipartFile uploadFile1,
						   		 @RequestParam(value="upload_image2") MultipartFile uploadFile2,
						   		 @RequestParam(value="upload_image3") MultipartFile uploadFile3,
						   		 @RequestParam(value="play_content") String play_content,
						   		 PlayVO pvo,
						   		 TheaterVO tvo,
						   		 HttpSession session,
						   		 Model model) {
		
		//play_image1 값이 있다면 pvo로 보낸다.
		if(!uploadFile1.isEmpty()) {
			String fileName = uploadFile1.getOriginalFilename();
			pvo.setPlay_image1(fileName);
			
			// 이미지 파일을 이동할 실제경로 구하기
			String image_path = session.getServletContext().getRealPath("WEB-INF/resources/images/play_info/");
			
			try {
				uploadFile1.transferTo(new File(image_path + fileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		} else {
			pvo.setPlay_image1("noImage.jpg");
		}
		//play_image2 값이 있다면 pvo로 보낸다.
		if(!uploadFile2.isEmpty()) {
			String fileName = uploadFile2.getOriginalFilename();
			pvo.setPlay_image2(fileName);
			
			// 이미지 파일을 이동할 실제경로 구하기
			String image_path = session.getServletContext().getRealPath("WEB-INF/resources/images/play_info/");
			
			try {
				uploadFile2.transferTo(new File(image_path + fileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		} else {
			pvo.setPlay_image2("noImage.jpg");
		}

		//play_image3 값이 있다면 pvo로 보낸다.
		if(!uploadFile3.isEmpty()) {
			String fileName = uploadFile3.getOriginalFilename();
			pvo.setPlay_image3(fileName);
			
			// 이미지 파일을 이동할 실제경로 구하기
			String image_path = session.getServletContext().getRealPath("WEB-INF/resources/images/play_info/");
			
			try {
				uploadFile3.transferTo(new File(image_path + fileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
		} else {
			pvo.setPlay_image3("noImage.jpg");
		}
		
		// 공연장 정보 조회
		tvo.setTheater_id(theater_id);
		TheaterVO theater = adminService.gettheater(tvo);
		
		adminService.insertPlay3Temp(pvo);
		
		//model.addAttribute("play_content", play_content);
		model.addAttribute("play_pseq", play_pseq);
		model.addAttribute("theater_id", theater_id);
		model.addAttribute("theaterVO", theater);
		return "admin/add_play4";
	}
	
	// 공연 등록하기 4/4 (좌석별 가격, 할인정보)
	@PostMapping(value="add_play4")
	public String addPlay4Action(@RequestParam(value="discount_info1", required = false) boolean discount_info1,
								 @RequestParam(value="discount_info2", required = false) boolean discount_info2,
								 @RequestParam(value="discount_info3", required = false) boolean discount_info3,
								 @RequestParam(value="discount_info4", required = false) boolean discount_info4,
								 @RequestParam(value="discount_info5", required = false) boolean discount_info5,
								 PlayVO vo,
						   		 HttpSession session,
						   		 Model model) {
		
		// 0    1    1,2     1,3    1,2,3,4,5
		String discount_info = "";
		if (discount_info1) {discount_info += "1,";}
		if (discount_info2) {discount_info += "2,";}
		if (discount_info3) {discount_info += "3,";}
		if (discount_info4) {discount_info += "4,";}
		if (discount_info5) {discount_info += "5,";}
		if (!discount_info1 && !discount_info2 && !discount_info3 && !discount_info4 && !discount_info5){
			discount_info = "0";
		} else {
			discount_info = discount_info.substring(0,discount_info.lastIndexOf(','));
		}
		vo.setDiscount_info(discount_info);
		System.out.println(">>>>>>>add_play4 POST Controller 접근");
		System.out.println(">>>>>>>1 " + discount_info1);
		System.out.println(">>>>>>>2 " + discount_info2);
		System.out.println(">>>>>>>3 " + discount_info3);
		System.out.println(">>>>>>>4 " + discount_info4);
		System.out.println(">>>>>>>5 " + discount_info5);
		System.out.println(">>>>>>>Discount_info = " + discount_info);
		System.out.println(vo.getPlay_price_vip());
		
		adminService.insertPlay4Temp(vo);	// play_temp4 서비스 호출
		adminService.insertPlay(vo);	// play 서비스 호출
		return "redirect:index";	// index.jsp 호출
	
	}
	
}













