package com.cz.fms;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.cz.fms.article.controller.BulletinController;
import com.cz.fms.article.dao.BulletinDao;
import com.cz.fms.article.domain.Bulletin;
import com.cz.fms.common.web.Criteria;
import com.cz.fms.common.web.SearchCriteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration( locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BulletinDaoTest {
	
	private static final Logger logger = LoggerFactory.getLogger(BulletinController.class);
	
	@Inject
	private BulletinDao dao;
	
	//@Test
	public void testCreate() throws Exception{
		
		Bulletin bulletin = new Bulletin();
		bulletin.setMember_num(1);
		bulletin.setBulletin_title("새로운 제목");
		bulletin.setBulletin_content("새로운 글");
		bulletin.setBulletin_attachment("첨부파일");
		bulletin.setBulletin_commentcount(0);
		dao.create(bulletin);
		
	}
	
	//@Test
	public void testUpdate() throws Exception{
		
		Bulletin bulletin = new Bulletin();
		bulletin.setBulletin_num(1);
		bulletin.setBulletin_title("수정된 제목");
		bulletin.setBulletin_content("수정된 글");
		dao.update(bulletin);
	}
	
	//@Test
	public void testDelete() throws Exception{
		dao.delete(1);
	}
	
	//@Test
	public void testListPage() throws Exception{
		int page=3;
		
		List<Bulletin> list= dao.listPage(page);
		
		for (Bulletin bulletin : list) {
			logger.info(bulletin.getBulletin_num() + ":" + bulletin.getBulletin_title());
		}
	}
	
	//@Test
	public void testListCriteria() throws Exception{
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<Bulletin> list = dao.listCriteria(cri);
		
		for (Bulletin board : list) {
			logger.info(board.getBulletin_num() + ":" + board.getBulletin_title());
		}
	}
	
	//@Test
	public void testURI() throws Exception{
		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/board/read").queryParam("bno", 12).queryParam("perPageNum", 20).build();
		
		logger.info("/board/read?bno=12&perPageNum=20");
		logger.info(uriComponents.toString());
		
	}
	//@Test
	public void testURI2() throws Exception {
		UriComponents uriComponents = UriComponentsBuilder.newInstance().path("/{module}/{page}").queryParam("bno", 12).queryParam("perPageNum", 20).build().expand("board","read").encode();
		
		logger.info("/board/read?bno=12&perPageNum=20");
		logger.info(uriComponents.toString());
		
	}
	
	@Test
	public void testDynamic1() throws Exception {
		SearchCriteria cri = new SearchCriteria();
		cri.setPage(1);
		cri.setKeyword("글");
		cri.setSearchType("t");
		
		logger.info("============");
		
		List<Bulletin> list = dao.listSearch(cri);
		
		for (Bulletin bulletin : list) {
			logger.info(bulletin.getBulletin_num() + ":" + bulletin.getBulletin_title());
		}
		
		logger.info("============");
		
		logger.info("COUNT:" + dao.listSearchCount(cri));
	}
	
	
	
}
