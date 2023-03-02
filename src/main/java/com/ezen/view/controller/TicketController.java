package com.ezen.view.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.io.*;
import java.sql.Array;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.TicketVO;
import com.ezen.biz.dto.UserVO;
import com.ezen.biz.discount.DiscountService;
import com.ezen.biz.dto.DiscountVO;
import com.ezen.biz.dto.PlayVO;
import com.ezen.biz.play.PlayService;
import com.ezen.biz.ticket.TicketService;

@Controller
public class TicketController {

	@Autowired
	private PlayService playservice;
	
	@Autowired
	private DiscountService discountservice;
	
	@Autowired
	private TicketService ticketservice;
	
	/*
	 * 공연 날짜 조회 및 달력 구현
	 */
	@RequestMapping(value="/book_ticket1", method=RequestMethod.GET)
	public String ticketBookDate(PlayVO vo, Model model, HttpServletRequest request, HttpSession session) {
		
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		if(loginUser == null) {
			//JOptionPane msg = new JOptionPane();
			//msg.showMessageDialog(null, "로그인을 하세요.");
			//showMessageDialog(null, "로그인을 하세요.");
			
			return "redirect:login_form";
		}
		
		PlayVO play = playservice.getPlay(vo);
		model.addAttribute("PlayVO", play);
		System.out.println(play);
		int pseq = play.getPlay_pseq();
		
		// 해당 극장의 전체 좌석 조회
		TheaterVO theater = playservice.getTotalSeat(pseq);
		model.addAttribute("Theater", theater);
		
		// 공연 날짜 조회
		List<ScheduleVO> playScheduleList = playservice.getPlayScheduleList(pseq);
		
		// 날짜값 배열 생성
		Date date[] = new Date[playScheduleList.size()];
		String play_month[] = new String[playScheduleList.size()];
		String play_day[] = new String[playScheduleList.size()];
		String play_date[] = new String[playScheduleList.size()];
		
		// 날짜값 포맷 및 배열 넣기
		for(int i=0; i<playScheduleList.size(); i++) {
			ScheduleVO schedule = playScheduleList.get(i);
			date[i]=schedule.getPlay_schedule();
			
			// 날짜값을 각각 월/일/시간으로 포맷
			SimpleDateFormat month = new SimpleDateFormat("MM");
			play_month[i] = month.format(date[i]);
			
			SimpleDateFormat day = new SimpleDateFormat("dd");
			play_day[i] = day.format(date[i]);
			
			SimpleDateFormat trans = new SimpleDateFormat("MM-dd");
			play_date[i] = trans.format(date[i]);
			
			//System.out.println(play_month[i] + "월" + play_day[i] + "일" + play_time);
			
		};
		
		// 중복 날짜 제거
		LinkedHashSet<String> monthList = new LinkedHashSet<>(Arrays.asList(play_month));	// LinkedHashSet으로 변환하여 중복값 제거
		String[] Play_month = monthList.toArray(new String[0]);	// LinkedHashSet을 다시 배열로 변환
		LinkedHashSet<String> dayList = new LinkedHashSet<>(Arrays.asList(play_day));
		String[] Play_day = dayList.toArray(new String[0]);
		LinkedHashSet<String> dateList = new LinkedHashSet<>(Arrays.asList(play_date));
		String[] Play_date = dateList.toArray(new String[0]);
		
		model.addAttribute("Play_month", Play_month);
		//System.out.println(Arrays.toString(Play_month));
		model.addAttribute("Play_day", Play_day);
		//System.out.println(Arrays.toString(Play_day));
		model.addAttribute("Play_date", Play_date);
		System.out.println(Arrays.toString(Play_date));
		
		
		// 현재 달력 날짜 출력
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;	// 1월=0, 12월=11
		int day = cal.get(Calendar.DATE);
		//int lastDate = cal.getActualMaximum(Calendar.DATE);	// 현재 달의 마지막 날짜
		
		if(request.getParameter("month")!=null) {
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			
			if(month == 12) {
				year++;
				month=0;
			}
			if(month==-1) {
				year--;
				month=11;
			}
		}
		
		Calendar firstOfMonth = Calendar.getInstance();
		firstOfMonth.set(Calendar.YEAR, year);	
		firstOfMonth.set(Calendar.MONTH, month-1);
		firstOfMonth.set(Calendar.DATE, 1);	// 현재 달의 첫 날짜(1일)로 설정
		int firstDate = firstOfMonth.get(Calendar.DAY_OF_WEEK);		// 첫 요일값(일:1, 월:2, 화:3...)
		int lastDate = firstOfMonth.getActualMaximum(Calendar.DATE);// 마지막 날짜
		
		System.out.println("오늘 날짜: " + year + "년" + month + "월" + day + "일");
		System.out.println("이번 달 말일: " + lastDate + "일");
		System.out.println("오늘 요일: " + firstDate + " 요일");
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("firstDate", firstDate-1);
		model.addAttribute("lastDate", lastDate);
		
		return "ticketBook/ticketBook1";
	}
	
	
	/*// 이전 페이지 이동
	@GetMapping(value="/back_to_ticket1")
	public String backTicketDate(PlayVO pvo, Model model, HttpSession session) {
		PlayVO play = playservice.getPlay(pvo);
		session.setAttribute("Play", play);
		model.addAttribute("Play", play);
		
		return "redirect:book_ticket1";
	};*/
	
	/*
	 * 공연 각 날짜의 회차(시간) 정보 조회	
	 */
	@RequestMapping(value="/get_time", method=RequestMethod.GET)
	@ResponseBody
	public String[] ViewTime(Model model, PlayVO vo, HttpServletRequest request) {
		
		String day = request.getParameter("day");
		int seq = Integer.parseInt(request.getParameter("seq"));
		
		System.out.println("day=" + day);
		
		List<ScheduleVO> ScheduleList = playservice.getPlayScheduleList(seq);
		
		Date date[] = new Date[ScheduleList.size()];
		String play_time[] = new String[ScheduleList.size()];
		//String play_day[] = new String[ScheduleList.size()];
		
		for(int i=0; i<ScheduleList.size(); i++) {
			ScheduleVO schedule = ScheduleList.get(i);
			date[i]=schedule.getPlay_schedule();

			SimpleDateFormat transday = new SimpleDateFormat("MM-dd");
			String play_day = transday.format(date[i]);
			//String playDay = play_day[i].replaceFirst("^0", "");
			System.out.println("playDay=" + play_day);
			
			if(play_day.equals(day)) {
				SimpleDateFormat transtime = new SimpleDateFormat("HH:mm");
				play_time[i] = transtime.format(date[i]);
				System.out.println(play_time[i]);
			};
			
		};
		List<String> timeList = new ArrayList<>(Arrays.asList(play_time));	// 배열 -> 리스트
		timeList.removeIf(Objects::isNull);	// 리스트의 모든 null값 제거
		String[] Play_time = timeList.toArray(new String[0]);	// 리스트 -> 배열
		
		System.out.println("추출된 시간" + Arrays.toString(Play_time));
		
		return Play_time;
	}

	/*
	 * 날짜와 회차로 잔여석 조회
	 */
	@RequestMapping(value="/get_seat", method=RequestMethod.POST)
	@ResponseBody
	public List<ScheduleVO> ViewSeatInfo(Model model, PlayVO vo, ScheduleVO svo, HttpServletRequest request) {
		
		//String name = request.getParameter("name");
		int seq = Integer.parseInt(request.getParameter("seq"));
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		//System.out.println("공연제목:" + name);
		System.out.println("공연날짜" + day);
		System.out.println("공연시간" + time);
		
		// 공연 번호로 스케줄 리스트 조회
		List<ScheduleVO> ScheduleList = playservice.getPlayScheduleList(seq);
		Date date[] = new Date[ScheduleList.size()];
			
		int sseq = 0;
		// 날짜, 시간 데이터로 스케줄 번호 조회
		for(int i=0; i<ScheduleList.size(); i++) {
			ScheduleVO schedule = ScheduleList.get(i);
			date[i]=schedule.getPlay_schedule();
			
			SimpleDateFormat transday = new SimpleDateFormat("MM-dd");
			String playDay = transday.format(date[i]);
			SimpleDateFormat transtime = new SimpleDateFormat("HH:mm");
			String playTime = transtime.format(date[i]);
			
			if(playDay.equals(day) && playTime.equals(time)) {
				svo.setPlay_pseq(seq);
				svo.setPlay_schedule(date[i]);
				sseq = playservice.getScheduleSeq(svo);
				System.out.println("Schedule_seq: " + sseq);
			};
		};
		/*
		// 공연의 극장ID로 해당극장의 전체 좌석 조회
		List<TheaterVO> theater = playservice.getTotalSeat(seq);
		TheaterVO totalSeat = theater.get(0);
		System.out.println("전체 좌석:" + totalSeat);
		*/
		// 조회한 스케줄 번호로 예매 좌석 조회
		List<ScheduleVO> bookSeat = playservice.getBookSeat(sseq);
		System.out.println("예매 좌석:" + bookSeat);

		return bookSeat;
	};
	/*
	@RequestMapping(value="/save_date", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView SaveDateInfo(Model model, ScheduleVO schedulevo, HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView("jsonView");
		
		int seq = Integer.parseInt(request.getParameter("seq"));
		schedulevo.setSchedule_seq(seq);
		
		ScheduleVO schedule = playservice.getSchedule(schedulevo);
		model.addAttribute("Schdule", schedule);
		System.out.println(schedule);
		
		Date playDate = schedule.getPlay_date();
		System.out.println("공연 일정: " + playDate);
		model.addAttribute("PlayDate", playDate);
		mav.addObject("Schdule", schedule);
		mav.addObject("PlayDate", playDate);
		System.out.println("ModelAndView: " +mav);
		
		return mav;
	};
	*/
	
	
	@RequestMapping(value="/book_ticket2", method=RequestMethod.GET)
	public String ticketBookSeat(PlayVO pvo, ScheduleVO svo, TicketVO tvo, Model model) {
		PlayVO play = playservice.getPlay(pvo);
		model.addAttribute("PlayVO", play);
		
		ScheduleVO schedule = playservice.getSchedule(svo);
		model.addAttribute("ScheduleVO", schedule);
		
		int pseq = play.getPlay_pseq();
		TheaterVO theater = playservice.getTotalSeat(pseq);
		model.addAttribute("Theater", theater);
		
		tvo.setPlay_pseq(play.getPlay_pseq());
		tvo.setSchedule_seq(schedule.getSchedule_seq());
		List<String> bookSeat = ticketservice.getBookSeatID(tvo);
		model.addAttribute("BookedSeat", bookSeat);
		System.out.println("예매되어있는 좌석"+ bookSeat);
		
		return "ticketBook/ticketBook2";
	};
	
	
	@RequestMapping(value="/book_ticket3", method=RequestMethod.POST)
	public String ticketBookPrice(PlayVO pvo, ScheduleVO svo, DiscountVO dvo, Model model, HttpServletRequest request) {
		PlayVO play = playservice.getPlay(pvo);
		model.addAttribute("PlayVO", play);
		
		ScheduleVO schedule = playservice.getSchedule(svo);
		model.addAttribute("ScheduleVO", schedule);
		
		List<DiscountVO> discountList = discountservice.getDiscountList();
		model.addAttribute("DiscountList", discountList);
		
		String discount_ID = play.getDiscount_info();
		System.out.println("적용되는 할인 : " + discount_ID);
		
		model.addAttribute("Discount_ID", discount_ID);
		
		String seat = request.getParameter("ticket_seat");
		//model.addAttribute("Ticket_seat", seat);
		System.out.println("예매 좌석:" + seat);
		
		String[] seatArr = seat.split(",");
		model.addAttribute("Ticket_seat", seatArr);
		
		String[] vipArr = new String[seatArr.length];
		String[] sArr = new String[seatArr.length];
		String[] aArr = new String[seatArr.length];
		
		for(int i=0; i<seatArr.length; i++) {
			if(seatArr[i].contains("VIP_")) {
				vipArr[i] = seatArr[i];
			}
			else if(seatArr[i].contains("S_")) {
				sArr[i] = seatArr[i];
			}
			else if(seatArr[i].contains("A_")) {
				aArr[i] = seatArr[i];
			}
		};
		
		List<String> vipList = new ArrayList<>(Arrays.asList(vipArr));
		vipList.removeIf(Objects::isNull);
		String[] vipSeat = vipList.toArray(new String[0]);
		List<String> sList = new ArrayList<>(Arrays.asList(sArr));
		sList.removeIf(Objects::isNull);
		String[] sSeat = sList.toArray(new String[0]);
		List<String> aList = new ArrayList<>(Arrays.asList(aArr));
		aList.removeIf(Objects::isNull);
		String[] aSeat = aList.toArray(new String[0]);

		model.addAttribute("VIP_seat", vipSeat);
		model.addAttribute("S_seat", sSeat);
		model.addAttribute("A_seat", aSeat);
		
		return "ticketBook/ticketBook3";
	};
	
	@RequestMapping(value="/book_ticket4", method=RequestMethod.POST)
	public String ticketPayment(@RequestParam MultiValueMap<String, String> multi,
								PlayVO pvo, ScheduleVO svo, DiscountVO dvo, Model model, HttpServletRequest request){		
		PlayVO play = playservice.getPlay(pvo);
		model.addAttribute("PlayVO", play);		
		ScheduleVO schedule = playservice.getSchedule(svo);
		model.addAttribute("ScheduleVO", schedule);		
		List<DiscountVO> discountList = discountservice.getDiscountList();
		model.addAttribute("DiscountList", discountList);
		
		System.out.println(multi.get("Ticket_seats"));
		model.addAttribute("Ticket_seat", multi.get("Ticket_seats"));	
		model.addAttribute("VIP_seats", multi.get("VIP_seats"));
		model.addAttribute("S_seats", multi.get("S_seats"));
		model.addAttribute("A_seats", multi.get("A_seats"));
		
		int total_Vip_Price = 0;
		int total_S_Price = 0;
		int total_A_Price = 0;
		
		// VIP석 티켓가격 계산
		if(request.getParameter("VIP_count") != null) {
			int vipPrice = play.getPlay_price_vip();
			int vip_count = Integer.parseInt(request.getParameter("VIP_count"));

			vipPrice = vipPrice * vip_count;
			model.addAttribute("Vip_count", vip_count);
			model.addAttribute("Vip_Price", vipPrice);
			
			String vipId = request.getParameter("vipId");
			String vipName = request.getParameter("vipName");
			String vipDiscount = request.getParameter("vipPrice");
			String vipAmount = request.getParameter("vipAmount");
			
			total_Vip_Price = vipPrice;
			
			if(vipId != "") {
				String[] vipId_Arr = vipId.split(",");
				String[] vipDiscount_Arr = vipDiscount.split(",");
				String[] vipAmount_Arr = vipAmount.split(",");	
				
				Integer[] discounted_Vip_Price = new Integer[vipId_Arr.length];
				Integer[] discounted_Vip_Amount = new Integer[vipId_Arr.length];	
				for(int i=0; i < vipId_Arr.length; i++) {
					int discount = Integer.parseInt(vipDiscount_Arr[i]);
					int amount = Integer.parseInt(vipAmount_Arr[i]);
					
					discounted_Vip_Price[i] = (discount * amount);
					discounted_Vip_Amount[i] = amount;
					System.out.println(total_Vip_Price +" - "+"("+ discount +" * "+ amount +")");
					
					total_Vip_Price -= discounted_Vip_Price[i];
					System.out.println("= " + total_Vip_Price);
				}
				System.out.println("discounted_Vip_Amount="+Arrays.toString(vipAmount_Arr));
				
				model.addAttribute("Discounted_Vip_Id", vipId);
				model.addAttribute("Discounted_Vip_Name", vipName);
				model.addAttribute("Discounted_Vip_Price", discounted_Vip_Price);
				model.addAttribute("Discounted_Vip_Amount", vipAmount);
			}
			model.addAttribute("Total_Vip_Price", total_Vip_Price);
			System.out.println("vip석 총 가격:" + total_Vip_Price);
		}

		
		// S석 티켓가격 계산
		if(request.getParameter("S_count") != null) {
			int s_Price = play.getPlay_price_s();
			int s_count = Integer.parseInt(request.getParameter("S_count"));
			
			s_Price = s_Price * s_count;
			model.addAttribute("S_count", s_count);
			model.addAttribute("S_Price", s_Price);
			
			String s_Id = request.getParameter("s_Id");
			String s_Name = request.getParameter("s_Name");
			String s_Discount = request.getParameter("s_Price");
			String s_Amount = request.getParameter("s_Amount");	

			total_S_Price = s_Price;
			
			if(s_Id != "") {
				String[] s_Id_Arr = s_Id.split(",");
				String[] s_Discount_Arr = s_Discount.split(",");
				String[] s_Amount_Arr = s_Amount.split(",");
				
				Integer[] discounted_S_Price = new Integer[s_Id_Arr.length];
				Integer[] discounted_S_Amount = new Integer[s_Id_Arr.length];
				for(int i=0; i < s_Id_Arr.length; i++) {
					int discount = Integer.parseInt(s_Discount_Arr[i]);
					int amount = Integer.parseInt(s_Amount_Arr[i]);
					
					discounted_S_Price[i] = (discount * amount);
					discounted_S_Amount[i] = amount;
					System.out.println(total_S_Price +" - "+"("+ discount +" * "+ amount +")");
					total_S_Price -= discounted_S_Price[i];
					
					System.out.println("= " + total_S_Price);
				}
				model.addAttribute("Discounted_S_Id", s_Id);
				model.addAttribute("Discounted_S_Name", s_Name);
				model.addAttribute("Discounted_S_Price", discounted_S_Price);
				model.addAttribute("Discounted_S_Amount", s_Amount);
			}
			model.addAttribute("Total_S_Price", total_S_Price);
			System.out.println("s석 총 가격:" + total_S_Price);
		}

		
		// A석 티켓가격 계산
		if(request.getParameter("A_count") != null) {
			int a_Price = play.getPlay_price_a();
			int a_count = Integer.parseInt(request.getParameter("A_count"));
			
			a_Price = a_Price * a_count;
			model.addAttribute("A_count", a_count);
			model.addAttribute("A_Price", a_Price);
			
			String a_Id = request.getParameter("a_Id");
			String a_Name = request.getParameter("a_Name");
			String a_Discount = request.getParameter("a_Price");
			String a_Amount = request.getParameter("a_Amount");	

			total_A_Price = a_Price;
			
			if(a_Id != "") {
				String[] a_Id_Arr = a_Id.split(",");
				String[] a_Discount_Arr = a_Discount.split(",");
				String[] a_Amount_Arr = a_Amount.split(",");
				
				Integer[] discounted_A_Price = new Integer[a_Id_Arr.length];
				Integer[] discounted_A_Amount = new Integer[a_Id_Arr.length];
				for(int i=0; i < a_Id_Arr.length; i++) {
					int discount = Integer.parseInt(a_Discount_Arr[i]);
					int amount = Integer.parseInt(a_Amount_Arr[i]);
					
					discounted_A_Price[i] = (discount * amount);
					discounted_A_Amount[i] = amount;
					System.out.println(total_A_Price +" - "+"("+ discount +" * "+ amount +")");
					
					total_A_Price -= discounted_A_Price[i];
					System.out.println("= " + total_A_Price);
				}
				model.addAttribute("Discounted_A_Id", a_Id);
				model.addAttribute("Discounted_A_Name", a_Name);
				model.addAttribute("Discounted_A_Price", discounted_A_Price);
				model.addAttribute("Discounted_A_Amount", a_Amount);
			}
			model.addAttribute("Total_A_Price", total_A_Price);
			System.out.println("a석 총 가격:" + total_A_Price);
		}
		
		int totalPrice = total_Vip_Price + total_S_Price + total_A_Price;
		System.out.println("총 가격: " + totalPrice);
		
		model.addAttribute("TotalPrice", totalPrice);
		
		return "ticketBook/ticketBook4";
	}
	
	@RequestMapping(value="/book_ticket5", method=RequestMethod.POST)
	public String ticketCofirm(@RequestParam MultiValueMap<String, String> multi,
								@RequestParam HashMap<String, Object> hash, 
								PlayVO pvo, ScheduleVO svo, TheaterVO tvo, DiscountVO dvo, TicketVO vo,
								Model model, HttpServletRequest request, HttpSession session){
		
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		System.out.println("loginUser: " + loginUser);
		System.out.println("loginId: " + loginUser.getUser_id());
		System.out.println("loginName: " + loginUser.getUser_name());
		vo.setUser_id(loginUser.getUser_id());
		vo.setUser_name(loginUser.getUser_name());
		
		PlayVO play = playservice.getPlay(pvo);
		model.addAttribute("PlayVO", play);		
		ScheduleVO schedule = playservice.getSchedule(svo);
		model.addAttribute("ScheduleVO", schedule);	
		DiscountVO discount = discountservice.getDiscount(dvo);
		model.addAttribute("DiscountList", discount);
		
		SimpleDateFormat sch = new SimpleDateFormat("YYMMddHHmm");
		String playSchedule = sch.format(schedule.getPlay_schedule());
		
		System.out.println("공연제목 : "+ hash.get("play_name"));
		System.out.println(play.getPlay_name());
		System.out.println("공연번호: "+ hash.get("play_pseq"));
		System.out.println("공연일정: "+ playSchedule);
		System.out.println("공연일정번호: "+ schedule.getSchedule_seq());
		System.out.println("선택한 좌석: "+ multi.get("ticket_seat"));
		int payID = Integer.parseInt(request.getParameter("payID"));
		String payName = request.getParameter("payName");
		
		vo.setPlay_name(play.getPlay_name());
		vo.setPlay_pseq(play.getPlay_pseq());
		vo.setTheater_id(play.getTheater_id());
		vo.setSchedule_seq(schedule.getSchedule_seq());
		vo.setPay_id(payID);
		vo.setPay_name(payName);
		
			
		/*
		 * VIP석 예매
		 */
		if(multi.get("VIP_seats") != null) {
			System.out.println("VIP좌석: "+ multi.get("VIP_seats"));
			
			System.out.println("현재 VIP좌석수: " + schedule.getVip_count());
			int addedSeat = schedule.getVip_count() + multi.get("VIP_seats").size();
			System.out.println("추가 후 VIP좌석수: " + addedSeat);
			
			svo.setVip_count(addedSeat);
			ticketservice.updateBookSeat(svo);
			
			System.out.println("VIP 일반가격: "+ play.getPlay_price_vip());
			int price = play.getPlay_price_vip();
			
			// VIP석 할인 적용
			if(hash.get("Discounted_Vip_Id") != "") {
				String[] Discounted_Vip_Id = ((String) hash.get("Discounted_Vip_Id")).split(",");
				String[] Discounted_Vip_Name = ((String) hash.get("Discounted_Vip_Name")).split(",");
				String[] Discounted_Vip_Amount = ((String) hash.get("Discounted_Vip_Amount")).split(",");
				
				int temp = 0;
				for(int j=0; j<Discounted_Vip_Id.length; j++) {
					String ticketID = "T" + play.getTheater_id() + playSchedule;
					
					if(Integer.parseInt(Discounted_Vip_Amount[j]) == 1) {	// 티켓매수가 1장뿐일 경우
						System.out.println("좌석: " + multi.get("VIP_seats").get(temp));	
						System.out.println("할인번호: " + Discounted_Vip_Id[j]);
						System.out.println("할인적용: " + Discounted_Vip_Name[j]);
						
						vo.setTicket_seat(multi.get("VIP_seats").get(temp));
						vo.setDiscount_id(Integer.parseInt(Discounted_Vip_Id[j]));
						
						//discount.setDiscount_id(Discounted_Vip_Id[j]);
						
						int discounted = price - Integer.parseInt(multi.get("Discounted_Vip_Price").get(j));
						System.out.println("할인된 가격: "+ discounted);
						vo.setPay_amount(discounted);
						
						ticketID += multi.get("VIP_seats").get(temp).replace("_", "");
						vo.setTicket_id(ticketID);
						System.out.println(ticketID);
						
						// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
						int tseq = ticketservice.insertTicket(vo);
						vo.setTseq(tseq);
						TicketVO completeTicket = ticketservice.completeTicket(vo);
						model.addAttribute("ticket", completeTicket);
						temp++;
						
					}else {			// 티켓매수가 2장 이상인 경우
						for(int c=1; c <= Integer.parseInt(Discounted_Vip_Amount[j]); c++) {
							System.out.println("좌석: " + multi.get("VIP_seats").get(temp));
							System.out.println("할인번호: " + Discounted_Vip_Id[j]);
							System.out.println("할인적용: " + Discounted_Vip_Name[j]);
							
							String ticketID2 = ticketID;
							
							vo.setTicket_seat(multi.get("VIP_seats").get(temp));
							vo.setDiscount_id(Integer.parseInt(Discounted_Vip_Id[j]));
							
							int discounted = price - (Integer.parseInt(multi.get("Discounted_Vip_Price").get(j)) / Integer.parseInt(Discounted_Vip_Amount[j]));
							System.out.println("할인된 가격: "+ discounted);
							vo.setPay_amount(discounted);
							
							ticketID2 += multi.get("VIP_seats").get(temp).replace("_", "");
							System.out.println(ticketID2);
							vo.setTicket_id(ticketID2);
							
							// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
							int tseq = ticketservice.insertTicket(vo);
							vo.setTseq(tseq);
							TicketVO completeTicket = ticketservice.completeTicket(vo);
							model.addAttribute("ticket", completeTicket);
							temp++;
						}
					}
				}
				// VIP석 할인 적용하고 남은 좌석은 일반가격으로 처리
				if(temp < multi.get("VIP_seats").size()) {
					System.out.println("남은 좌석: " + multi.get("VIP_seats").get(temp));
					String ticketID = "T" + play.getTheater_id() + playSchedule;
					
					for(int i=temp; i<multi.get("VIP_seats").size(); i++) {
						String ticketID_temp= ticketID;
						
						vo.setTicket_seat(multi.get("VIP_seats").get(i));
						vo.setDiscount_id(0);
						
						vo.setPay_amount(price);
						System.out.println("정가: "+ vo.getPay_amount());
						
						ticketID_temp += multi.get("VIP_seats").get(i).replace("_", "");
						vo.setTicket_id(ticketID_temp);
						
						// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
						int tseq = ticketservice.insertTicket(vo);
						vo.setTseq(tseq);
						TicketVO completeTicket = ticketservice.completeTicket(vo);
						model.addAttribute("ticket", completeTicket);
					}
				}
			}
			// VIP석 할인이 적용되지 않았을 때
			else {
				String ticketID = "T" + play.getTheater_id() + playSchedule;
				
				for(int i=0; i<multi.get("VIP_seats").size(); i++) {
					String ticketID_temp = ticketID;
					
					vo.setTicket_seat(multi.get("VIP_seats").get(i));
					vo.setDiscount_id(0);
					
					vo.setPay_amount(price);
					System.out.println("정가: "+ vo.getPay_amount());
					
					ticketID_temp += multi.get("VIP_seats").get(i).replace("_", "");
					vo.setTicket_id(ticketID_temp);
					
					// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
					int tseq = ticketservice.insertTicket(vo);
					vo.setTseq(tseq);
					TicketVO completeTicket = ticketservice.completeTicket(vo);
					model.addAttribute("ticket", completeTicket);
				}
			}
		}

		
		/*
		 * S석 예매
		 */
		if(multi.get("S_seats") != null) {
			System.out.println("S좌석: "+ multi.get("S_seats"));
			
			System.out.println("현재 S좌석수: " + schedule.getS_count());
			int addedSeat = schedule.getS_count() + multi.get("S_seats").size();
			System.out.println("추가 후 S좌석수: " + addedSeat);
			
			svo.setS_count(addedSeat);
			ticketservice.updateBookSeat(svo);
			
			System.out.println("S 일반가격: "+ play.getPlay_price_s());
			int price = play.getPlay_price_s();
			
			// S석 할인 적용
			if(hash.get("Discounted_S_Id") != "") {
				String[] Discounted_S_Id = ((String) hash.get("Discounted_S_Id")).split(",");
				String[] Discounted_S_Name = ((String) hash.get("Discounted_S_Name")).split(",");
				String[] Discounted_S_Amount = ((String) hash.get("Discounted_S_Amount")).split(",");
				
				int temp = 0;
				for(int j=0; j<Discounted_S_Id.length; j++) {
					String ticketID = "T" + play.getTheater_id() + playSchedule;
					
					if(Integer.parseInt(Discounted_S_Amount[j]) == 1) {	// 티켓매수가 1장뿐일 경우
						System.out.println("좌석: " + multi.get("S_seats").get(temp));	
						System.out.println("할인번호: " + Discounted_S_Id[j]);
						System.out.println("할인적용: " + Discounted_S_Name[j]);
						
						vo.setTicket_seat(multi.get("S_seats").get(temp));
						vo.setDiscount_id(Integer.parseInt(Discounted_S_Id[j]));
						
						int discounted = price - Integer.parseInt(multi.get("Discounted_S_Price").get(j));
						System.out.println("할인된 가격: "+ discounted);
						vo.setPay_amount(discounted);
						
						ticketID += multi.get("S_seats").get(temp).replace("_", "");
						vo.setTicket_id(ticketID);
						System.out.println(ticketID);
						
						// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
						int tseq = ticketservice.insertTicket(vo);
						vo.setTseq(tseq);
						TicketVO completeTicket = ticketservice.completeTicket(vo);
						model.addAttribute("ticket", completeTicket);
						temp++;
						
					}else {									// 티켓매수가 2장 이상인 경우
						for(int c=1; c <= Integer.parseInt(Discounted_S_Amount[j]); c++) {
							System.out.println("좌석: " + multi.get("S_seats").get(temp));
							System.out.println("할인번호: " + Discounted_S_Id[j]);
							System.out.println("할인적용: " + Discounted_S_Name[j]);
							
							String ticketID2 = ticketID;
							
							vo.setTicket_seat(multi.get("S_seats").get(temp));
							vo.setDiscount_id(Integer.parseInt(Discounted_S_Id[j]));
							
							int discounted = price - (Integer.parseInt(multi.get("Discounted_S_Price").get(j)) / Integer.parseInt(Discounted_S_Amount[j]));
							System.out.println("할인된 가격: "+ discounted);
							vo.setPay_amount(discounted);
							
							ticketID2 += multi.get("S_seats").get(temp).replace("_", "");
							System.out.println(ticketID2);
							vo.setTicket_id(ticketID2);
							
							// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
							int tseq = ticketservice.insertTicket(vo);
							vo.setTseq(tseq);
							TicketVO completeTicket = ticketservice.completeTicket(vo);
							model.addAttribute("ticket", completeTicket);
							temp++;
						}
					}
				}
				// S석 할인 적용하고 남은 좌석은 일반가격으로 처리
				if(temp < multi.get("S_seats").size()) {
					System.out.println("남은 좌석: " + multi.get("S_seats").get(temp));
					String ticketID = "T" + play.getTheater_id() + playSchedule;
					
					for(int i=temp; i<multi.get("S_seats").size(); i++) {
						String ticketID_temp= ticketID;
						
						vo.setTicket_seat(multi.get("S_seats").get(i));
						vo.setDiscount_id(0);
						
						vo.setPay_amount(price);
						System.out.println("정가: "+ vo.getPay_amount());
						
						ticketID_temp += multi.get("S_seats").get(i).replace("_", "");
						vo.setTicket_id(ticketID_temp);
						
						// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
						int tseq = ticketservice.insertTicket(vo);
						vo.setTseq(tseq);
						TicketVO completeTicket = ticketservice.completeTicket(vo);
						model.addAttribute("ticket", completeTicket);
					}
				}
			}
			// S석 할인이 적용되지 않았을때
			else {
				String ticketID = "T" + play.getTheater_id() + playSchedule;
				
				for(int i=0; i<multi.get("S_seats").size(); i++) {
					String ticketID_temp = ticketID;
					
					vo.setTicket_seat(multi.get("S_seats").get(i));
					vo.setDiscount_id(0);
					
					vo.setPay_amount(price);
					System.out.println("정가: "+ vo.getPay_amount());
					
					ticketID_temp += multi.get("S_seats").get(i).replace("_", "");
					vo.setTicket_id(ticketID_temp);
					
					// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
					int tseq = ticketservice.insertTicket(vo);
					vo.setTseq(tseq);
					TicketVO completeTicket = ticketservice.completeTicket(vo);
					model.addAttribute("ticket", completeTicket);
				}
			}
		}

		
		/*
		 * A석 예매
		 */
		if(multi.get("A_seats") != null) {
			System.out.println("A�¼�: "+ multi.get("A_seats"));
			
			System.out.println("현재 A좌석수: " + schedule.getA_count());
			int addedSeat = schedule.getA_count() + multi.get("A_seats").size();
			System.out.println("추가 후 A좌석수: " + addedSeat);
			
			svo.setA_count(addedSeat);
			ticketservice.updateBookSeat(svo);
			
			System.out.println("A 일반가격: "+ play.getPlay_price_a());
			int price = play.getPlay_price_a();
			
			// A석 할인 적용
			if(hash.get("Discounted_A_Id") != "") {
				String[] Discounted_A_Id = ((String) hash.get("Discounted_A_Id")).split(",");
				String[] Discounted_A_Name = ((String) hash.get("Discounted_A_Name")).split(",");
				String[] Discounted_A_Amount = ((String) hash.get("Discounted_A_Amount")).split(",");
				
				int temp = 0;
				for(int j=0; j<Discounted_A_Id.length; j++) {
					String ticketID = "T" + play.getTheater_id() + playSchedule;
					
					if(Integer.parseInt(Discounted_A_Amount[j]) == 1) {	// Ƽ�ϸż��� 1����� ���
						System.out.println("좌석: " + multi.get("A_seats").get(temp));	
						System.out.println("할인번호: " + Discounted_A_Id[j]);
						System.out.println("할인적용: " + Discounted_A_Name[j]);
						
						vo.setTicket_seat(multi.get("A_seats").get(temp));
						vo.setDiscount_id(Integer.parseInt(Discounted_A_Id[j]));
						
						int discounted = price - Integer.parseInt(multi.get("Discounted_A_Price").get(j));
						System.out.println("할인된 가격: "+ discounted);
						vo.setPay_amount(discounted);
						
						ticketID += multi.get("A_seats").get(temp).replace("_", "");
						vo.setTicket_id(ticketID);
						System.out.println(ticketID);
						
						// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
						int tseq = ticketservice.insertTicket(vo);
						vo.setTseq(tseq);
						TicketVO completeTicket = ticketservice.completeTicket(vo);
						model.addAttribute("ticket", completeTicket);
						temp++;
						
					}else {									// 티켓매수가 2장 이상인 경우
						for(int c=1; c <= Integer.parseInt(Discounted_A_Amount[j]); c++) {
							System.out.println("좌석: " + multi.get("A_seats").get(temp));
							System.out.println("할인번호: " + Discounted_A_Id[j]);
							System.out.println("할인적용: " + Discounted_A_Name[j]);
							
							String ticketID2 = ticketID;
							
							vo.setTicket_seat(multi.get("A_seats").get(temp));
							vo.setDiscount_id(Integer.parseInt(Discounted_A_Id[j]));
							
							int discounted = price - (Integer.parseInt(multi.get("Discounted_A_Price").get(j)) / Integer.parseInt(Discounted_A_Amount[j]));
							System.out.println("할인된 가격: "+ discounted);
							vo.setPay_amount(discounted);
							
							ticketID2 += multi.get("A_seats").get(temp).replace("_", "");
							System.out.println(ticketID2);
							vo.setTicket_id(ticketID2);
							
							// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
							int tseq = ticketservice.insertTicket(vo);
							vo.setTseq(tseq);
							TicketVO completeTicket = ticketservice.completeTicket(vo);
							model.addAttribute("ticket", completeTicket);
							temp++;
						}
					}
				}
				// A석 할인 적용하고 남은 좌석은 일반가격으로 처리
				if(temp < multi.get("A_seats").size()) {
					System.out.println("남은 좌석: " + multi.get("A_seats").get(temp));
					String ticketID = "T" + play.getTheater_id() + playSchedule;
					
					for(int i=temp; i<multi.get("A_seats").size(); i++) {
						String ticketID_temp= ticketID;
						
						vo.setTicket_seat(multi.get("A_seats").get(i));
						vo.setDiscount_id(0);
						
						vo.setPay_amount(price);
						System.out.println("정가: "+ vo.getPay_amount());
						
						ticketID_temp += multi.get("A_seats").get(i).replace("_", "");
						vo.setTicket_id(ticketID_temp);
						
						// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
						int tseq = ticketservice.insertTicket(vo);
						vo.setTseq(tseq);
						TicketVO completeTicket = ticketservice.completeTicket(vo);
						model.addAttribute("ticket", completeTicket);
					}
				}
			}
			// A석 할인이 적용되지 않았을때
			else {
				String ticketID = "T" + play.getTheater_id() + playSchedule;
				
				for(int i=0; i<multi.get("A_seats").size(); i++) {
					String ticketID_temp = ticketID;
					
					vo.setTicket_seat(multi.get("A_seats").get(i));
					vo.setDiscount_id(0);
					
					vo.setPay_amount(price);
					System.out.println("정가: "+ vo.getPay_amount());
					
					ticketID_temp += multi.get("A_seats").get(i).replace("_", "");
					vo.setTicket_id(ticketID_temp);
					
					// 티켓 입력 & tseq 반환받음 (조호성 추가 4줄)
					int tseq = ticketservice.insertTicket(vo);
					vo.setTseq(tseq);
					TicketVO completeTicket = ticketservice.completeTicket(vo);
					model.addAttribute("ticket", completeTicket);
					
				}
			}
		}
		
		
		return "ticketBook/ticketBook5";
	}
};
