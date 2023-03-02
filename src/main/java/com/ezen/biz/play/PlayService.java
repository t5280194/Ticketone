package com.ezen.biz.play;

import java.util.Date;
import java.util.List;

import com.ezen.biz.dto.ScheduleVO;
import com.ezen.biz.dto.TheaterVO;
import com.ezen.biz.dto.PlayVO;

public interface PlayService {
	
	// 예매순 추천공연 3개
	List<PlayVO> getBestSoldPlayList();
	
	// 좋아요순 추천공연 5개
	List<PlayVO> getBestLikePlayList();
	
	// 카테코리별 공연 보기
	List<PlayVO> getPlayListByKind(String play_kind);
	
	// 공연 상세 정보
	PlayVO getPlay(PlayVO vo);
	
	// 공연 검색
	List<PlayVO> getPlayListBySearch(String play_name);

	
	
	
	// 공연 전체 스케쥴 정보 조회
	List<ScheduleVO> getPlayScheduleList(int pseq);
	
	// 스케쥴 번호 조회
	int getScheduleSeq(ScheduleVO vo);
	
	// 예매된 좌석수 조회
	List<ScheduleVO> getBookSeat(int seq);
	
	// 공연 일정 조회
	ScheduleVO getSchedule(ScheduleVO vo);
	
	// 공연 전제 좌석수 조회
	TheaterVO getTotalSeat(int pseq);
}