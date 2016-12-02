package com.cz.fms.article.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cz.fms.article.dao.BulletinDao;
import com.cz.fms.article.dao.ReplyDao;
import com.cz.fms.article.domain.Reply;
import com.cz.fms.common.web.Criteria;
@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDao replyDao;
	
	@Inject
	private BulletinDao bulletinDao;
	
	//댓글 등록
	@Transactional
	@Override
	public void addReply(Reply reply) throws Exception {
		replyDao.create(reply);
		bulletinDao.updateReplycount(reply.getBulletin_num(), 1);  
	}
	
	//댓글 리스트 전체 출력
	@Override
	public List<Reply> listReply(int bulletin_num) throws Exception {
		return replyDao.list(bulletin_num);
	}
	//댓글 수정
	@Override
	  public void modifyReply(Reply reply) throws Exception {

	    replyDao.update(reply);
	  }
	//댓글 삭제
	@Transactional
	@Override
	public void removeReply(int reply_num) throws Exception {
	   int bulletin_num = replyDao.getBulletin_num(reply_num);
	   replyDao.delete(reply_num);
	   bulletinDao.updateReplycount(bulletin_num, -1);
	}
	//댓글 페이지 처리
	@Override
	public List<Reply> listReplyPage(int bulletin_num, Criteria cri) throws Exception {
	
	    return replyDao.listPage(bulletin_num, cri);
	}
	  
	//댓글 수
	@Override
	public int count(int bulletin_num) throws Exception {
	
	   return replyDao.count(bulletin_num);
	}
	  
	  
	  
}
