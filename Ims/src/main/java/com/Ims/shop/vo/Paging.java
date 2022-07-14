package com.Ims.shop.vo;

public class Paging {

	
	private int totalCount; // 게시판 전체 개수
	private int displayPageNum = 10; // 게시판 화면에 보여질 페이지 개수
	
	private int startPage; // 화면 시작할 페이지
	private int endPage; // 화면 끝
	private boolean prev; // 페이징 이전 버튼
	private boolean next; // 페이징 다음 버튼
	
	private Criteria cri;  // 크리테리아 변수로 가져옴...

	
	
	
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		
		
		this.totalCount = totalCount;
		
		
		pagingData();
		
	}
	
	private void pagingData() {
		
		
		endPage = (int)(Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		// endpage == ( 현재페이지 / 화면에 보여질 페이지번호 개수 ) * 페이지번호개수 )
		
		startPage = (endPage-displayPageNum) +1;
		if(startPage <=0) startPage = 1;
		//startpage (끝페이지 - 화면에 보여질 페이지번호 개수 ) +1
		
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double) cri.getPerPageNum()));
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		
		prev = startPage ==1?false:true;
		
		next = endPage * cri.getPerPageNum() >= totalCount ?false:true;
		}
	
	
	

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
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

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	@Override
	public String toString() {
		return "Paging [totalCount=" + totalCount + ", displayPageNum=" + displayPageNum + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + ", cri=" + cri + "]";
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
