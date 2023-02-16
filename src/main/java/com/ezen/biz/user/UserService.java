package com.ezen.biz.user;

import com.ezen.biz.dto.UserVO;

public interface UserService {

	// 회원 상세정보 조회
	UserVO getMember(String id);
	
	//  회원 추가
	void insertUser(UserVO vo);
	
	// 회원 수정
	void updateUser(UserVO vo);
	
	// 회원 탈퇴
	void deleteUser(UserVO vo);
	
	// 사용자 인증
	int loginID(UserVO vo);
	
	// 이름과 이메일로 아이디 찾기
	String selectIdByNameEmail(UserVO vo);
	
	// 이름과 휴대전화로 아이디 찾기
	String selectIdByNamePhone(UserVO vo);
		
	// 아이디, 이름, 이메일로 비밀번호 찾기
	String selectPwdByIdNameEmail(UserVO vo);
	
	// 아이디, 이름, 이메일로 비밀번호 찾기
	String selectPwdByIdNamePhone(UserVO vo);
	
	// 비밀번호 변경
	void changePassword(UserVO vo);
	
	// 회원ID 존재여부 확인
	int confirmID(String id);
}