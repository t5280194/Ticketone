package utils;
/*
 * 현재 페이지와 관련된 정보 저장
 * - 현재 페이지 번호
 * - 페이지당 출력 항목 수
 * - 각 페이지의 시작 게시글 번호
 */
public class Criteria {
	private int pageNum;		// 현재 페이지 번호
	private int rowsPerPage;	// 페이지 당 게시글의 수
	
	// 기본 생성자
	// 페이지 번호: 1, 페이지 항목 수: 10
	public Criteria() {
		this(1, 10);
	}
	
	public Criteria(int pageNum, int rowsPerPage) {
		super();
		this.pageNum = pageNum;
		this.rowsPerPage = rowsPerPage;
	}

	public int getPageNum() {
		return pageNum;
	}
	
	public void setPageNum(int pageNum) {
		if(pageNum <= 0) {
			this.pageNum = 1;
		}else {
			this.pageNum = pageNum;
		}
		this.pageNum = pageNum;
	}
	
	public int getRowsPerPage() {
		return rowsPerPage;
	}
	
	public void setRowsPerPage(int rowsPerPage) {
		if(rowsPerPage <= 0 || rowsPerPage > 20) {
			this.rowsPerPage = 20;
		}else {
			this.rowsPerPage = rowsPerPage;
		}
	}
	
	/*
	 * 각 페이지의 시작 게시글 번호 반환
	 * (현재 페이지 번호 - 1)* 페이지 글 게시글의 수 + 1
	 */
	public int getPageStart() {
		
		return (pageNum-1) * rowsPerPage + 1;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", rowsPerPage=" + rowsPerPage + "]";
	}
	
}















