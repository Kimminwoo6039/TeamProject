package com.Ims.shop.vo;

public class CriteriaReply {

	
	private int page; // ���� ������ ��ȣ
	private int perPageNum; // �������� ������ ����
	private int product_code;
	
	private String keyword;
	  
	 
	  
	  
	  
	  
	  
	  
	  
	 
	  
	 


	


	public String getKeyword() {
		return keyword;
	}



	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}



	public int getProduct_code() {
		return product_code;
	}



	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}



	public int getPageStart() {
		return (this.page - 1)  * perPageNum;  //Ư�� ���� ���� �ϴ°�
	}
	
	
	
	public CriteriaReply() {

		this.page=1;  // ���� �Խ��� ���Խ� �ʿ��� ��
		this.perPageNum=3; // 3��������



		
		

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
