package com.Ims.shop.vo;

public class SearchPagingVo extends PagingVo{
	
	//검색 키워드
	private String keyword;
	private String type;
		
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return "SearchPagingVo [type=" + type + "keyword=" + keyword + "]";
	}

}
