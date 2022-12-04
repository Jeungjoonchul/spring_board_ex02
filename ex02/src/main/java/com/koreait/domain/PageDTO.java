package com.koreait.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//페이지를 구현하기 위한 여러 정보들이 담겨있는 클래스
public class PageDTO {
	private int startPage;
	private int endPage;
	private int realEnd;
	private int total;
	private boolean prev, next;
	private Criteria cri;
	
	public PageDTO(int total, Criteria cri) {
		this.total = total;
		this.cri = cri;
		
		int pagenum = cri.getPagenum();
		
		this.endPage = (int)Math.ceil(pagenum/10.0)*10;
		this.startPage = this.endPage - (10-1);
		
		this.realEnd = (int)Math.ceil(total/10.0);
		this.realEnd = total == 0 ? 1 : realEnd;
		
		endPage = endPage>realEnd ? realEnd : endPage;
		
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < this.realEnd;		
	}
	

}











