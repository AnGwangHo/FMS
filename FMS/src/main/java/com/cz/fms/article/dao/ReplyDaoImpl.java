package com.cz.fms.article.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cz.fms.article.domain.Reply;
import com.cz.fms.common.web.Criteria;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.cz.fms.article";
	
	//댓글리스트
	@Override
	public List<Reply> list(int bulletin_num) throws Exception {
		return session.selectList(namespace + ".replylist", bulletin_num);
	}

	//댓글 등록
	@Override
	public void create(Reply reply) throws Exception {
		session.insert(namespace + ".replycreate", reply);
	}
	
	//댓글 수정
	@Override
	public void update(Reply reply) throws Exception {
		session.update(namespace + ".replyupdate", reply);
	}
	
	//댓글 삭제
	@Override
	public void delete(int reply_num) throws Exception {
		session.delete(namespace + ".replydelete", reply_num);
	}	
	
	//댓글 리스트 페이지 처리
	@Override
	  public List<Reply> listPage(int bulletin_num, Criteria cri)
	      throws Exception {

	    Map<String, Object> paramMap = new HashMap<>();

	    paramMap.put("bulletin_num", bulletin_num);
	    paramMap.put("cri", cri);

	    return session.selectList(namespace + ".replylistPage", paramMap);
	  }
	
	  //게시글 댓글수 
	  @Override
	  public int count(int bulletin_num) throws Exception {

	    return session.selectOne(namespace + ".replycount", bulletin_num);
	  }

	 //게시글 번호 알아내기
	@Override
	public int getBulletin_num(int reply_num) throws Exception {
		
		return session.selectOne(namespace + ".getBulletin_num", reply_num);
	}
	
}
