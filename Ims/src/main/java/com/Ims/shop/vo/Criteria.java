package com.Ims.shop.vo;

public class Criteria {

	
	private int page; // ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½È£
	private int perPageNum; // ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½
	
	private String keyword;
	private String type;
	
	

	
	


	
	
	
	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}




	public String getKeyword() {
		return keyword;
	}



	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	public int getPageStart() {
		return (this.page - 1)  * perPageNum;  //Æ¯ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½ï¿½ ï¿½Ï´Â°ï¿½
	}
	
	
	
	public Criteria() {

		this.page=1;  // ÃÖÃÊ °Ô½ÃÆÇ ÁøÀÔ½Ã ÇÊ¿äÇÑ °ª
		this.perPageNum=16; // 10°³º¸¿©ÁÜ

		this.page=1;  // ï¿½ï¿½ï¿½ï¿½ ï¿½Ô½ï¿½ï¿½ï¿½ ï¿½ï¿½ï¿½Ô½ï¿½ ï¿½Ê¿ï¿½ï¿½ï¿½ ï¿½ï¿½
		this.perPageNum=10; // 10ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½ï¿½
		

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
