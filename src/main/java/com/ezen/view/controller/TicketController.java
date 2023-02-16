package com.ezen.view.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.io.*;
import java.sql.Array;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.PlayVO;
import com.ezen.biz.play.PlayService;

@Controller
public class TicketController {

	@Autowired
	private PlayService playservice;

	@RequestMapping(value="/book_ticket1", method=RequestMethod.GET)
	public String ticketBookView(PlayVO vo, Model model) {
		
		PlayVO play = playservice.getPlay(vo);
		model.addAttribute("PlayVO", play);

		// 공연 날짜 조회
		List<ScheduleVO> playScheduleList = playservice.getPlayScheduleList(play.getPlay_name());
		
		// 날짜값 배열 생성
		Date date[] = new Date[playScheduleList.size()];
		String play_month[] = new String[playScheduleList.size()];
		String play_day[] = new String[playScheduleList.size()];
		
		// 날짜값 포맷 및 배열 넣기
		for(int i=0; i<playScheduleList.size(); i++) {
			ScheduleVO schedule = playScheduleList.get(i);
			date[i]=schedule.getPlay_date();
			
			// 날짜값을 각각 월/일/시간으로 포맷
			SimpleDateFormat month = new SimpleDateFormat("MM");
			play_month[i] = month.format(date[i]);
			
			SimpleDateFormat day = new SimpleDateFormat("dd");
			play_day[i] = day.format(date[i]);
			
			SimpleDateFormat time = new SimpleDateFormat("HH:mm");
			String play_time = time.format(date[i]);
			
			System.out.println(play_month[i] + "월" + play_day[i] + "일" + play_time);
		};
		// 중복 날짜 제거
		LinkedHashSet<String> monthList = new LinkedHashSet<>(Arrays.asList(play_month));	// LinkedHashSet으로 변환하여 중복값 제거
		String[] Play_month = monthList.toArray(new String[0]);	// LinkedHashSet을 다시 배열로 변환
		LinkedHashSet<String> dayList = new LinkedHashSet<>(Arrays.asList(play_day));
		String[] Play_day = dayList.toArray(new String[0]);
		
		model.addAttribute("Play_month", Play_month);
		System.out.println(Arrays.toString(Play_month));
		model.addAttribute("Play_day", Play_day);
		System.out.println(Arrays.toString(Play_day));
		
		// 현재 달력 날짜 출력
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;	// 1월=0, 12월=11
		int day = cal.get(Calendar.DATE);
		int lastDate = cal.getActualMaximum(Calendar.DATE);	// 현재 달의 마지막 날짜
		
		System.out.println(year + "년" + month + "월" + day + "일");
		System.out.println(lastDate + "일");
		
		Calendar firstOfMonth = Calendar.getInstance();
		firstOfMonth.set(Calendar.DATE, 1);	// 현재 달의 첫 날짜(1일)로 설정
		int firstDate = firstOfMonth.get(Calendar.DAY_OF_WEEK);	// 첫 요일값(일:1, 월:2, 화:3...)
		System.out.println(firstDate + " 요일");
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("firstDate", firstDate-1);
		model.addAttribute("lastDate", lastDate);
		
		return "ticketBook/ticketBook1";
	}
	

	@RequestMapping(value="/get_time", method=RequestMethod.GET)
	@ResponseBody
	public String[] ViewTime(Model model, PlayVO vo, HttpServletRequest request) {
		
		String day = request.getParameter("day");
		String name = request.getParameter("name");
		
		System.out.println("day=" + day);
		
		//PlayVO play = playservice.getPlay(vo);
		List<ScheduleVO> ScheduleList = playservice.getPlayScheduleList(name);
		
		Date date[] = new Date[ScheduleList.size()];
		String play_time[] = new String[ScheduleList.size()];
		String play_day[] = new String[ScheduleList.size()];
		
		for(int i=0; i<ScheduleList.size(); i++) {
			ScheduleVO schedule = ScheduleList.get(i);
			date[i]=schedule.getPlay_date();

			SimpleDateFormat transday = new SimpleDateFormat("dd");
			play_day[i] = transday.format(date[i]);
			String playDay = play_day[i].replaceFirst("^0", "");
			System.out.println("playDay=" + playDay);
			
			
			if(playDay.equals(day)) {
				SimpleDateFormat transtime = new SimpleDateFormat("HH:mm");
				play_time[i] = transtime.format(date[i]);
				System.out.println(play_time[i]);
			};
			
		};
		List<String> timeList = new ArrayList<>(Arrays.asList(play_time));	// 배열 -> 리스트
		timeList.removeIf(Objects::isNull);	// 리스트의 모든 null값 제거
		String[] Play_time = timeList.toArray(new String[0]);	// 리스트 -> 배열
		
		System.out.println(Arrays.toString(Play_time));
		
		return Play_time;
	}
	
	@RequestMapping(value="/get_seat", method=RequestMethod.GET)
	@ResponseBody
	public TheaterVO ViewSeatInfo(Model model, HttpServletRequest request) {
		
		String name = request.getParameter("name");
		String day = request.getParameter("day");
		String time = request.getParameter("time");
		
		List<ScheduleVO> ScheduleList = playservice.getPlayScheduleList(name);
		Date date[] = new Date[ScheduleList.size()];
		
		int seq = 0;		
		for(int i=0; i<ScheduleList.size(); i++) {
			ScheduleVO schedule = ScheduleList.get(i);
			date[i]=schedule.getPlay_date();
			
			SimpleDateFormat transday = new SimpleDateFormat("dd");
			String playDay = transday.format(date[i]).replaceFirst("^0", "");
			SimpleDateFormat transtime = new SimpleDateFormat("HH:mm");
			String playTime = transtime.format(date[i]);
			
			if(playDay.equals(day) && playTime.equals(time)) {
				seq = schedule.getSchedule_seq();
			};
		};
		
		TheaterVO seat = playservice.getRemainedSeat(seq);
		System.out.println(seat);
		
		return seat;
	};
};
