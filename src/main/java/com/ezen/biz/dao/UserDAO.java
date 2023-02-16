package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.UserVO;

@Repository
public class UserDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 회원 상세정보 조회
	public UserVO getMember(String id) {
			
		return mybatis.selectOne("userMapper.getMember", id);
	}
	
	// 회원ID 존재여부 확인
		public int confirmID(String id) {
			
			String pwd = mybatis.selectOne("userMapper.confirmID", id);
			
			if (pwd != null) {
				return 1;  // id 존재
			} else {
				return -1;	// id 존재하지 않음.
			}
		}
	
	// 회원 로그인 확인
	public int loginID(UserVO vo) {
			int result = -1;
			String pwd = mybatis.selectOne("userMapper.confirmID", vo.getUser_id());
			
			// 테이블에서 조회한 pwd와 사용자가 입력한 pwd비교
			if (pwd == null) {   // ID가 존재하지 않음
				result = -1;
			} else if (pwd.equals(vo.getUser_password())) {  // 정상 로그인
				result = 1;
			} else {
				result = 0;	// 비밀번호 불일치
			}
				
			return result;
		}
	
	//  회원 추가
	public void insertUser(UserVO vo) {
		
		mybatis.insert("userMapper.insertUser", vo);
	}
	
	// 회원 수정
	public void updateUser(UserVO vo) {
		
		mybatis.update("userMapper.updateUser", vo);
	}
	
	// 회원 탈퇴
	public void deleteUser(UserVO vo) {
		
		mybatis.delete("userMapper.deleteUser", vo);
	}
	
	// 비밀번호 변경
	public void changePassword(UserVO vo) {
				
		mybatis.update("userMapper.changePassword", vo);
	}
	
	// 이메일로 아이디 찾기
	public String selectIdByNameEmail(UserVO vo) {
		
		return mybatis.selectOne("userMapper.selectIdByNameEmail", vo);
	}
	
	// 휴대전화 아이디 찾기
	public String selectIdByNamePhone(UserVO vo) {
			
		return mybatis.selectOne("userMapper.selectIdByNamePhone", vo);
		}
	
	// 아이디, 이름, 이메일로 비밀번호 찾기
	public String selectPwdByIdNameEmail(UserVO vo) {
		
		return mybatis.selectOne("userMapper.selectPwdByIdNameEmail", vo);
	}
	
	// 아이디, 이름, 휴대전화로 비밀번호 찾기
	public String selectPwdByIdNamePhone(UserVO vo) {
			
		return mybatis.selectOne("userMapper.selectPwdByIdNamePhone", vo);
	}
}
