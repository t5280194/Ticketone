package com.ezen.biz.dao;

import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.PlayVO;

@Repository
public class PlayDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// �삁留ㅼ닚 異붿쿇怨듭뿰 3媛�
	public List<PlayVO> getBestSoldPlayList() {
		
		return mybatis.selectList("playMapper.getBestSoldPlayList");
	}
	
	// 醫뗭븘�슂�닚 異붿쿇怨듭뿰 5媛�
	public List<PlayVO> getBestLikePlayList() {
		
		return mybatis.selectList("playMapper.getBestLikePlayList");
	}
	
	// 移댄뀒怨좊━蹂� 怨듭뿰 議고쉶
	public List<PlayVO> getPlayListByKind(String play_kind) {
		System.out.println("playDAO移댄뀒怨좊━蹂� 蹂닿린");
		return mybatis.selectList("playMapper.getPlayListByKind", play_kind);
	}
	
	// 怨듭뿰 �긽�꽭 �젙蹂�
	public PlayVO getPlay(PlayVO vo) {
		
		return mybatis.selectOne("playMapper.getPlay", vo);
	}
	
	// 怨듭뿰 寃��깋
	public List<PlayVO> getPlayListBySearch(String play_name){
		
		return mybatis.selectList("playMapper.getPlayListBySearch", play_name);
	}
	
	
	
	
	// 怨듭뿰 �쟾泥� �쉶李� �젙蹂� 議고쉶
	public List<ScheduleVO> getPlayScheduleList(int pseq) {
		
		return mybatis.selectList("ticketMapper.getPlayScheduleList", pseq);
	}
	
	// 怨듭뿰 �씪�젙 踰덊샇 議고쉶
	public int getScheduleSeq(ScheduleVO vo) {
		
		return mybatis.selectOne("ticketMapper.getScheduleSeq", vo);
	}
	
	
	// �삁留ㅻ맂 怨듭뿰 醫뚯꽍�닔 議고쉶
	public List<ScheduleVO> getBookSeat(int seq) {
		
		return mybatis.selectList("ticketMapper.getBookSeat", seq);
	}
	
	// 怨듭뿰 �씪�젙 議고쉶 
	public ScheduleVO getSchedule(ScheduleVO vo) {
		
		return mybatis.selectOne("ticketMapper.getSchedule", vo);
	}
	
	// 怨듭뿰 �쟾泥� 醫뚯꽍�닔 議고쉶
	public TheaterVO getTotalSeat(int pseq) {
		
		return mybatis.selectOne("ticketMapper.getTotalSeat", pseq);
	}
}
