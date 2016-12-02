/**
 *  게시글 daoImpl 
 */
package com.cz.fms.article.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cz.fms.article.domain.Bulletin;
import com.cz.fms.common.web.Criteria;
import com.cz.fms.common.web.SearchCriteria;

@Repository
public class BulletinDaoImpl implements BulletinDao {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.cz.fms.article";
	
	//게시글 생성
	@Override
	public void create(Bulletin bulletin) throws Exception {
		session.insert(namespace + ".create", bulletin);
	}
	
	//게시글 조회
	@Override
	public Bulletin read(int bulletin_num) throws Exception {
		return session.selectOne(namespace + ".read", bulletin_num);
	}

	//게시글 수정
	@Override
	public void update(Bulletin bulletin) throws Exception {
		session.update(namespace + ".update", bulletin);
	}

	//게시글 삭제
	@Override
	public void delete(int bulletin_num) throws Exception {
		session.delete(namespace + ".delete",  bulletin_num);
	}
	
	//게시글 전체출력
	@Override
	public List<Bulletin> listAll() throws Exception {
		return session.selectList(namespace + ".listAll")  ;
	}

	//게시글 페이지 리스트 출력
	@Override
	public List<Bulletin> listPage(int page) throws Exception {
		if(page <=0){
			page=1;
		}
		page = (page -1) *10;
		
		return session.selectList(namespace + ".listPage", page);
	}
	
	//게시글 페이지 처리( Criteria )
	@Override
	public List<Bulletin> listCriteria(Criteria cri) throws Exception {
		return session.selectList(namespace + ".listPage", cri);    
	}
	
	//페이징 수
	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace  + ".countPaging", cri);
	}

	//검색 게시글 페이지 처리 ( SearchCriteria )
	@Override
	public List<Bulletin> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch" , cri);
	}

	//검색 게시글 수
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount" , cri);
	}
	
	//댓글 등록 수
	@Override
	public void updateReplycount(int bulletin_num, int amount) throws Exception {
		
		Map<String,Object> paramMap = new HashMap<String,Object>();
		
		paramMap.put("bulletin_num", bulletin_num);
		paramMap.put("amount", amount);
		
		session.update(namespace + ".updateReplyCount", paramMap);
		
	}
	//게시글 View Count 증가
	@Override
	public void updateViewCount(int bulletin_num) throws Exception {
		session.update(namespace + ".updateViewCount", bulletin_num);
		
	}

}
