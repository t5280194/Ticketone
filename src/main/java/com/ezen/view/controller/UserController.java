package com.ezen.view.controller;


import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.ezen.biz.dto.UserVO;
import com.ezen.biz.user.UserService;

@Controller
@SessionAttributes("loginUser")
public class UserController {

	@Autowired
	private UserService userService;
	
	// 약정화면 표시
	@RequestMapping(value="/contract", method=RequestMethod.GET)
	public String contractView() {
		
		return "user/contract";
	}
	
	// 회원가입 화면 표시
	@RequestMapping(value="/join_form", method=RequestMethod.POST)
	public String joinView() {
		
		return "user/join";
	}
	
	// 로그인 화면 출력
	@GetMapping(value="/login_form")
	public String loginView() {
			
		return "user/login";
	}
	
	// 탈퇴 약관 표시
	@RequestMapping(value="/delete_form", method=RequestMethod.GET)
	public String deleteView() {
			
		return "user/deletecontract";
	}
	
	// 회원 탈퇴 화면 표시
	@RequestMapping(value="/deleteview", method=RequestMethod.POST)
	public String deleteUserView() {
					
		return "user/delete";
	}
	
	// 회원 탈퇴
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String deleteUser(UserVO vo, SessionStatus status ) {
		
		userService.deleteUser(vo);
		
		status.setComplete();
		
		return "user/login";
	}
	
	// 사용자 인증
	@PostMapping(value="/login")
	public String loginAction(UserVO vo, Model model) {
			
		int result = userService.loginID(vo);
			
		if (result == 1) { // 로그인 성공
			model.addAttribute("loginUser", userService.getMember(vo.getUser_id()));
				
			return "redirect:index";
		} else {
			return "user/login_fail";
		}
	}	
	
	// 로그아웃
	@GetMapping(value="/logout")
	public String logout(SessionStatus status) {
		
		status.setComplete();   // 세션 해지
		
		return "user/login";
	}
	
	// ID 중복 체크 화면 표시
	@RequestMapping(value="/id_check_form", method=RequestMethod.GET)
	public String idCheckView(UserVO vo, Model model) {
		// id 중복 확인 조회
		int result = userService.confirmID(vo.getUser_id());
		model.addAttribute("message", result);
		model.addAttribute("id", vo.getUser_id());
		
		return "user/idcheck";
	}
	
	// ID 중복 체크 수행
	@RequestMapping(value="/id_check_form", method=RequestMethod.POST)
	public String idCheckAction(UserVO vo, Model model) {
		// id 중복 확인 조회
		int result = userService.confirmID(vo.getUser_id());
		model.addAttribute("message", result);
		model.addAttribute("id", vo.getUser_id());
				
		return "user/idcheck";
	}
	
	// 회원 가입 처리
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String joinAction(@RequestParam(value="addr1", defaultValue = "") String addr1,
							 @RequestParam(value="addr2", defaultValue = "") String addr2,
							 @RequestParam(value="email1", defaultValue = "") String email1,
							 @RequestParam(value="email2", defaultValue = "") String email2,
							 UserVO vo) {
	
		if (vo.getUser_phone() == null) {
			vo.setUser_phone("");
		}
		
		vo.setUser_address(addr1 + " " + addr2);
		vo.setUser_email(email1 + "" + email2);
		
		userService.insertUser(vo);
		
		return "user/login";
	}
	
	// 회원 수정 처리
	@PostMapping(value="/update")
	public String updateUserAction(@RequestParam(value="addr1", defaultValue = "") String addr1,
								   @RequestParam(value="addr2", defaultValue = "") String addr2,
								   @RequestParam(value="email1", defaultValue = "") String email1,
								   @RequestParam(value="email2", defaultValue = "") String email2,
								   UserVO vo) throws IOException {
		
		vo.setUser_address(addr1 + " " + addr2);
		vo.setUser_email(email1 + "" + email2);
		
		userService.updateUser(vo);
		
		return "redirect:index";
	}
	
	// 비밀번호 변경
	@PostMapping(value="/change_pwd")
	public String changePwdAction(UserVO vo, SessionStatus status) {
			
		userService.changePassword(vo);
		
		status.setComplete();
			
		return "user/login";
	}

	// 아이디 찾기 화면 출력
	@GetMapping(value="/find_id_form")
	public String findIdFormView() {
		
		return "user/findId";
	}
	
	// 비밀번호 찾기 화면 출력
	@GetMapping(value="/find_pwd_form")
	public String findPasswordFormView() {
		
		return "user/findPasswod";
	}
	
	// 이메일로 아이디 찾기
	@PostMapping(value="/find_id1")
	public String findIdActionEmail(UserVO vo, Model model) {
		
		String id = userService.selectIdByNameEmail(vo);
		
		if (id != null) {  // 이름과 이메일을 조건으로 아이디 조회 성공
			model.addAttribute("message", 1);
			model.addAttribute("id", id);
		} else {
			model.addAttribute("message", -1);
		}
		
		return "user/findResult";  // 아이디 조회 결과 화면 요청
	}
	
	// 휴대전화로 아이디 찾기
	@PostMapping(value="/find_id2")
	public String findIdActionPhone(UserVO vo, Model model) {
		
		String id = userService.selectIdByNamePhone(vo);
		
		if (id != null) {  // 이름과 휴대전화를 조건으로 아이디 조회 성공
			model.addAttribute("message", 1);
			model.addAttribute("id", id);
		} else {
			model.addAttribute("message", -1);
		}
		
		return "user/findResult";  // 아이디 조회 결과 화면 요청
	}
	
	// 이메일로 비밀번호 찾기
	@PostMapping(value="/find_pwd1")
	public String findPwdActionEmail(UserVO vo, Model model) {
		
		String pwd = userService.selectPwdByIdNameEmail(vo);
		
		if (pwd != null) {
			model.addAttribute("message", 1);
			model.addAttribute("id", vo.getUser_id());
		} else {
			model.addAttribute("message", -1);
		}
		
		return "user/findPwdResult";
	}
	
	// 휴대전화로 비밀번호 찾기
	@PostMapping(value="/find_pwd2")
	public String findPwdActionPhone(UserVO vo, Model model) {
			
		String pwd = userService.selectPwdByIdNamePhone(vo);
			
		if (pwd != null) {
			model.addAttribute("message", 1);
			model.addAttribute("id", vo.getUser_id());
		} else {
			model.addAttribute("message", -1);
		}
			
		return "user/findPwdResult";
	}
	
	// 마이 페이지 비밀번호 확인 화면 표시
	@RequestMapping(value="/mypageView_form")
	public String mypageView() {
			
		return "mypage/mypageView";
	}
	
	// 마이 페이지 이동
	@RequestMapping(value="/mypageView")
	public String mypage() {
		
		return "mypage/mypage";
	}
	
	// 비밀번호 변경 화면 표시
	@RequestMapping(value="/changePwd_form", method=RequestMethod.GET)
	public String changePwd() {
				
		return "user/changePwd";
	}
	
	// 회원정보 수정 화면 표시
	@RequestMapping(value="/updateUser_form", method=RequestMethod.GET)
	public String updateUser() {
		
		return "user/updateUser";
	}
}