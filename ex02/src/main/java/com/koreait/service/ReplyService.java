package com.koreait.service;

import com.koreait.domain.Criteria;
import com.koreait.domain.ReplyDTO;
import com.koreait.domain.ReplyPageDTO;

public interface ReplyService {
	public ReplyPageDTO getList(Criteria cri, Long boardnum);

	public boolean regist(ReplyDTO reply);

	public int getMaxReplyNum(String userid);
}
