/**
 *  댓글 dao Interface
 */
package com.cz.fms.article.dao;

import java.util.List;

import com.cz.fms.article.domain.Reply;
import com.cz.fms.common.web.Criteria;

public interface ReplyDao {
	
	public List<Reply> list(int bulletin_num) throws Exception;  						  //댓글 리스트
	
	public void create(Reply reply) throws Exception;             						  //댓글 등록
	
	public void update(Reply reply) throws Exception;            						  //댓글 수정
	
	public void delete(int reply_num) throws Exception;          					      //댓글 삭제
	
	public List<Reply> listPage( int bulletin_num, Criteria cri) throws Exception;  //댓글 리스트 페이지처리

	public int count(int bulletin_num) throws Exception;          						  //게시글 댓글 수
	
	public int getBulletin_num(int reply_num) throws Exception;   					  //게시글 번호 알아내기
}
