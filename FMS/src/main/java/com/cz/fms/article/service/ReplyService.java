package com.cz.fms.article.service;

import java.util.List;

import com.cz.fms.article.domain.Reply;
import com.cz.fms.common.web.Criteria;

public interface ReplyService {
	
	public void addReply(Reply reply) throws Exception;                              // 댓글 등록
	
	public List<Reply> listReply(int bulletin_num) throws Exception;                // 댓글 리스트 전체 출력
	
	public void modifyReply(Reply reply) throws Exception;                          // 댓글 수정

	public void removeReply(int reply_num) throws Exception;						// 댓글 삭제

	public List<Reply> listReplyPage(int bulletin_num, Criteria cri) throws Exception;   //댓글 페이지 처리

	public int count(int bulletin_num) throws Exception;                                // 댓글 수 
	
}
