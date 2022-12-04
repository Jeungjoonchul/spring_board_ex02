package com.koreait.domain;

import lombok.Data;

@Data
public class BoardDTO {
	private Long boardnum;
	private String boardtitle;
	private String boardcontents;
	private String userid;
	private String regdate;
	private String updatedate;
}
