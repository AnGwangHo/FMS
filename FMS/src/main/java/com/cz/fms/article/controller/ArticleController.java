package com.cz.fms.article.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cz.fms.member.service.MemberAdminService;

/**
 * 게시판 관리 컨트롤러
 * @param 글 작성, 글 수정, 글 삭제, 전체 글 리스트 출력, 상세글 보기, 댓글 동적 처리
 * @author KOSTA 126기 김민호,박찬용
 */
@Controller
public class ArticleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	@Inject
	private MemberAdminService service;

	/**
	 * 전체리스트 출력
	 * @param 김민호 listAll - 전체리스트 테이블로 동적 출력
	 * @return article/listAll
	 */
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public String listAll(Locale locale, Model model) {
		logger.info(">>> 전체리스트 출력", locale);
		
		
		return "article/listAll";
	}
	
	
	/**
	 * 글쓰기 출력
	 * @param 박찬용 write - 글쓰기 폼 출력
	 * @return article/write
	 */
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Locale locale, Model model) {
		logger.info(">>> 글쓰기 출력 ", locale);
		
		return "article/write";
	}
	
	/**
	 * 글 상세보기 출력
	 * @param 박찬용 read - 글 상세보기 폼 출력
	 * @return article/read
	 */
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public String read(Locale locale, Model model) {
		logger.info(">>> 글상세보기 출력 ", locale);
		
		return "article/read";
	}
	
}
