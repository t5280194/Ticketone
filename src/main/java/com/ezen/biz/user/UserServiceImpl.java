package com.ezen.biz.user;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.UserDAO;
import com.ezen.biz.dto.TicketVO;
import com.ezen.biz.dto.UserVO;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDao;
	
	@Override
	public UserVO getMember(UserVO vo) {
		
		return userDao.getMember(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		
		userDao.insertUser(vo);
	}
	
	@Override
	public void updateUser(UserVO vo) {
		
		userDao.updateUser(vo);
	}
	
	@Override
	public void deleteUser(UserVO vo) {
		
		userDao.deleteUser(vo);
	}
	
	@Override
	public String selectIdByNameEmail(UserVO vo) {
		
		return userDao.selectIdByNameEmail(vo);
	}
	
	@Override
	public String selectIdByNamePhone(UserVO vo) {
		
		return userDao.selectIdByNamePhone(vo);
	}

	@Override
	public String selectPwdByIdNameEmail(UserVO vo) {
		
		return userDao.selectPwdByIdNameEmail(vo);
	}
	
	@Override
	public String selectPwdByIdNamePhone(UserVO vo) {
		
		return userDao.selectPwdByIdNamePhone(vo);
	}
	
	@Override
	public void changePassword(UserVO vo) {
		
		userDao.changePassword(vo);
	}
	
	@Override
	public int loginID(UserVO vo) {
		
		return userDao.loginID(vo);
	}
	
	@Override
	public int confirmID(String id) {
		
		return userDao.confirmID(id);
	}

	// 유저 티켓 목록 확인
	@Override
	public List<TicketVO> getuserTicketList(TicketVO tvo) {
		
		return userDao.getuserTicketList(tvo);
	}

	// 유저 티켓 상세 확인
	@Override
	public TicketVO getuserTicket(TicketVO tvo) {
		
		return userDao.getuserTicket(tvo);
	}
}
