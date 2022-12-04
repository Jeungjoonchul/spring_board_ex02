package com.koreait.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//Criteria : 검색의 기준(DB에서 데이터를 긁어오기 위한 기준)
@Setter
@Getter
@ToString
public class Criteria {
	private int pagenum;
	private int amount;
	private String type;
	private String keyword;
	private int startrow;
	
	public Criteria() {
//		this() : 현재 클래스의 생성자
		this(1,10);
	}
	
	public Criteria(int pagenum, int amount) {
		this.pagenum = pagenum;
		this.amount = amount;
		this.startrow = (this.pagenum-1)*this.amount;
	}
	
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
		this.startrow = (this.pagenum-1)*this.amount;
	}
	
	public String[] getTypeArr() {
		//type이 null 이라면 	return {}
		//type에 "TC"가 있다면	return {"T","C"}
		return type == null ? new String[] {} : type.split("");
	}
	
	public String getListLink() {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")		// ? 앞에 오는 uri 문자열
					.queryParam("pagenum", pagenum)								// 쿼리스트링에 추가될 파라미터 설정
					.queryParam("amount", amount)
					.queryParam("keyword", keyword)
					.queryParam("type", type);
		
		//?pagenum=3&amount=10&keyword=제목1&type=T
		return builder.toUriString();											//빌더가 가지고 있는 설정대로 문자열 만들기
	}
}




















