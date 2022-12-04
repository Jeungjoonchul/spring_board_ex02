package com.koreait.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.koreait.domain.Criteria;
import com.koreait.domain.ReplyDTO;
import com.koreait.domain.ReplyPageDTO;
import com.koreait.service.ReplyService;

import lombok.Setter;

@RequestMapping("/reply/*")
@RestController
public class ReplyController {
	
	@Setter(onMethod_ = @Autowired)
	private ReplyService service;
	
	
	// /reply/list/123/1
	@GetMapping("list/{boardnum}/{pagenum}")
	//ResponseEntity : 서버의 상태코드, 응답 메세지, 데이터 등을 담을 수 있는 타입(데이터 자체를 돌려줄 때, 응답할 때 사용)
	public ResponseEntity<ReplyPageDTO> getList(@PathVariable("boardnum") Long boardnum, @PathVariable("pagenum") int pagenum) {
		Criteria cri = new Criteria(pagenum, 5);
		return new ResponseEntity<ReplyPageDTO>(service.getList(cri,boardnum), HttpStatus.OK);
	}
	
	//consumes : 이 메소드가 호출될 때 소비할 데이터의 타입(넘겨지는 body의 데이터 타입)
	//@RequestBody : 넘겨지는 body의 데이터 타입을 해석해서 해당 파라미터에 채워넣기
	@PostMapping(value = "regist", consumes = "application/json")
	public ResponseEntity<String> regist(@RequestBody ReplyDTO reply){
		boolean check = service.regist(reply);
		int replynum = service.getMaxReplyNum(reply.getUserid());
		
		return check ? new ResponseEntity<String>(replynum+"",HttpStatus.OK) :
						new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}










