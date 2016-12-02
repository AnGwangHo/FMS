package com.cz.fms.article.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cz.fms.article.dao.BulletinDao;
import com.cz.fms.article.domain.Bulletin;
import com.cz.fms.common.web.Criteria;
import com.cz.fms.common.web.SearchCriteria;

@Service
public class BulletinServiceImpl implements BulletinService {

	@Inject
	private BulletinDao dao;
	
	//게시글 등록
	@Override
	public void regist(Bulletin bulletin) throws Exception {
		dao.create(bulletin);
	}
	//게시글 상세
	@Transactional(isolation=Isolation.READ_COMMITTED)
	@Override
	public Bulletin read(int bulletin_num) throws Exception {
		dao.updateViewCount(bulletin_num);
		return dao.read(bulletin_num);
	}
	//게시글 수정
	@Override
	public void modify(Bulletin bulletin) throws Exception {
		dao.update(bulletin);
	}
	//게시글 삭제
	@Override
	public void remove(int bulletin_num) throws Exception {
		dao.delete(bulletin_num);
	}
	//게시글 전체출력
	@Override
	public List<Bulletin> listAll() throws Exception {
		return dao.listAll();
	}
	//게시글 페이지 전체출력
	@Override
	public List<Bulletin> listCriteria(Criteria cri) throws Exception {
		return dao.listCriteria(cri);
	}
	//페이지 수
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return dao.countPaging(cri);
	}
	// 검색페이지 전체 출력
	@Override
	public List<Bulletin> listSearchCriteria(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}
	//검색 페이지 수
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}

}
