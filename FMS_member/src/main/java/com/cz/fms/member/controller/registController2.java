package com.cz.fms.member.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cz.fms.member.domain.Member;
import com.cz.fms.member.service.MemberService;

/**
 * 로그인의 뷰만 보여주는 컨트롤러. Logger로 뷰가 켜졌다는걸 알려주는 역할만한다.
 * 
 * @author임영묵
 */
@Controller
public class registController2 {
/*	
	private static final Logger logger = LoggerFactory.getLogger(registController2.class);
	
	@Inject
	private MemberService service;
	
	*//** 회원가입 폼으로 넘어가는 기본 컨트롤러. GET으로 불러와 데이터의 정보는없다.*//*
	 @RequestMapping(value = "/member_regist", method = RequestMethod.GET)
		public String registGet(Model model) throws Exception{
			
			logger.info("regist(실행) 회원가입실행 ");
			
			logger.info("register get...");
			return "/member/member_regist";
		}
	 
	 *//** 회원가입에서 결과화면과 DB에 추가해주는 컨트롤러. 회원가입화면에서도 post외에는 지정하는값이 없어야 정상 작동가능하다. *//*
	 @RequestMapping(value="/member_regist", method = RequestMethod.POST)
	public String registPOST(Member member, Model model) throws Exception {
		 
		 logger.info("regist(회원가입완료) POST... ");
			
		logger.info(member.toString());
		
		service.memberadd(member);
		
		model.addAttribute("result", "sucess");
		
		return "member/member_result";
	}*/
	 /*@RequestMapping(value= "/listAll", method = RequestMethod.GET)
		public void votelist(Model model) throws Exception {
		}*/	
}
