package com.Ims.shop.vo;

public class Criteria {

	
	private int page; // 현재 페이지 번호
	private int perPageNum; // 페이지당 보여줄 개수
	
	
	
	public int getPageStart() {
		return (this.page - 1)  * perPageNum;  //특정 구간 시작 하는곳
	}
	
	
	
	public Criteria() {
		this.page=1;  // 최초 게시판 진입시 필요한 값
		this.perPageNum=10; // 10개보여줌
	}
	
	
	
	public int getPage() {
		return page;
	}
	
	
	public void setPage(int page) {
		
		if(page <=0) {
			this.page =1;
		}else {
			this.page=page;
		}
		
	
	}
	
	
	public int getPerPageNum() {
		
		return perPageNum;
	}
	
	
	public void setPerPageNum(int pageCount) {
		
		int cnt = this.perPageNum;
		
		if(pageCount != cnt) {
			this.perPageNum = cnt;
		}else {
			this.perPageNum = pageCount;
		}
		
	}



	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	
	
	
}
