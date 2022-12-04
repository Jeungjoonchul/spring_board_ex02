package com.koreait.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.koreait.domain.Criteria;
import com.koreait.domain.ReplyDTO;

public interface ReplyMapper {
	int getTotal(Long boardnum);
	List<ReplyDTO> getList(@Param("cri") Criteria cri, @Param("boardnum") Long boardnum);
	int insert(ReplyDTO reply);
	int getNum(String userid);
}
