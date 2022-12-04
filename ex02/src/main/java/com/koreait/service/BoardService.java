package com.koreait.service;

import java.util.List;

import com.koreait.domain.BoardDTO;
import com.koreait.domain.Criteria;

public interface BoardService {

	List<BoardDTO> getList(Criteria cri);

	int count(Criteria cri);

	void regist(BoardDTO board);

	int getMaxBoardnum(String userid);

	BoardDTO get(Long boardnum);
	
	boolean modify(BoardDTO board);

	boolean remove(Long boardnum);

}
