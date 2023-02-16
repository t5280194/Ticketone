package utils;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

/*
 * 화면에 표시할 페이지 버튼 정보
 */
public class PageMaker {
	private Criteria criteria;	// 현재 페이지 정보
	private int totalCount;		// 테이블에 저장한 후 게시글의 수
	private int startPage;		// 화면에 표시할 시작 페이지 번호
	private int endPage;		// 화면에 표시할 끝 페이지 번호
	private boolean prev;		// 이전 페이지 버튼 유뮤
	private boolean next;		// 다음 페이지 버튼 유무
	private int cntPageNum = 10;// 큰 화면에 표시될 페이지 버튼의 수
	private int realEndPage;	// 실제 끝 페이지 번호
	
	// 
	
	public Criteria getCriteria() {
		return criteria;
	}
	public void setCriteria(Criteria criteria) {
		this.criteria = criteria;
	}
	public int getTotalCount() {
		return totalCount;
	}
	// 현재 게시글의 수 저장 및 멤버 변수 초기화
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		// 멤버 변수 초기화
		fieldInit();
	}
	
	public void fieldInit() {
		// (1) 표시할 끝 페이지 번호 계산
		// 끝 페이지 번호 계산
		// 올림(현재 페이지 번호 / 끝 화면에 표시할 페이지 버튼의 수) * 끝 화면애 표시할 페이지 버튼의 수
		endPage = (int)(Math.ceil(criteria.getPageNum() / (double)cntPageNum) * cntPageNum);
		
		// (2) 시작 페이지 계산
		// 끝 페이지 번호 - 페이지 버튼의 수 + 1
		startPage = endPage - cntPageNum + 1;
		
		// (3) 실제 끝 페이지 번호 계산
		// 올림(실제 게시글의 수 / 페이지당 게시글의 수)
		realEndPage = (int)(Math.ceil(totalCount / (double)criteria.getRowsPerPage()));
		
		// (4) 실제 끝 페이지번호로 endPage 값 수정
		// 계산한 endPage 값이 realEndPage 보다 큰 경우 endPage 값 변경
		if(endPage > realEndPage) {
			endPage = realEndPage;
		}
		
		// (5) 이전, 다음 버튼 표시 여부 결정
		prev = startPage == 1 ? false : true;	// 시작 페이지가 1일 경우, '이전' 버튼 필요 없음
		next = endPage * criteria.getRowsPerPage() < totalCount ? true : false;
	}
	
	/*
	 * 화면에서 페이지번호를 클릭하면, URI의 QueryString에
	 * 페이지 번호와 페이지 당 항목 수를 조립해 주는 메소드
	 * 화면 페이지: 1
	 * 변환 예: ? pageNum=3 & rowsPerPage=10
	 */
	public String makeQuery(int page) {
		UriComponents uriComp = UriComponentsBuilder.newInstance()
				.queryParam("pageNum", page)
				.queryParam("rowsPerPage", criteria.getRowsPerPage())
				.build();
		
		return uriComp.toString();
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getCntPageNum() {
		return cntPageNum;
	}
	public void setCntPageNum(int cntPageNum) {
		this.cntPageNum = cntPageNum;
	}
	public int getRealEndPage() {
		return realEndPage;
	}
	public void setRealEndPage(int realEndPage) {
		this.realEndPage = realEndPage;
	}
	
	@Override
	public String toString() {
		return "PageMaker [criteria=" + criteria + ", totalCount=" + totalCount + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", cntPageNum=" + cntPageNum
				+ ", realEndPage=" + realEndPage + "]";
	}
	
}
