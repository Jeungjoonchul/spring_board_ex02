package com.koreait.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koreait.domain.BoardDTO;
import com.koreait.domain.Criteria;
import com.koreait.mapper.BoardMapper;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
	public List<BoardDTO> getList(Criteria cri) {
		return mapper.getList(cri);
	}
	
	@Override
	public int count(Criteria cri) {
		return mapper.getTotal(cri);
	}
	
	@Override
	public void regist(BoardDTO board) {
		mapper.insert(board);
	}
	
	@Override
	public int getMaxBoardnum(String userid) {
		return mapper.getMaxBoardnum(userid);
	}
	
	@Override
	public BoardDTO get(Long boardnum) {
		return mapper.getDetail(boardnum);
	}
	
	@Override
	public boolean modify(BoardDTO board) {
		return mapper.update(board) == 1;
	}
	
	@Override
	public boolean remove(Long boardnum) {
		return mapper.delete(boardnum) == 1;
	}
}






