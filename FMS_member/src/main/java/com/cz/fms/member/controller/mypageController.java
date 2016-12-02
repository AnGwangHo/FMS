package com.cz.fms.member.controller;

import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cz.fms.member.dao.Login;
import com.cz.fms.member.domain.Member;
import com.cz.fms.member.service.MemberService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class mypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(mypageController.class);
	
	@Inject
	private MemberService service;
	
		/** MYPAGE GET */
		@RequestMapping(value = "/member/member_mypage", method = RequestMethod.GET)
		public void memberRead(@RequestParam("member_id") String member_id, Model model, Login login) throws Exception {
			logger.info("MY PAGE 접속완료!");
			
			Member member = service.MemberMypage(member_id);
			model.addAttribute("Member_info", member);
		}
		
		/** MYPAGE POST */
		@RequestMapping(value = "/member/member_mypage", method = RequestMethod.POST)
		public String memberModifyPOST(Member member, Model model) throws Exception {
			
			logger.info("MY PAGE 수정완료!");
			
			service.Membermodify(member);
			
			model.addAttribute("Member_info", member);
			System.out.println(member);
			
			return "/member/member_mypage";
		}
		
		/** 사이드바에있는 맴버리스트를 출력한다. */
		@RequestMapping(value = "/member_list", method = RequestMethod.GET)
		public String login(Locale locale, Model model) throws Exception {
			
			model.addAttribute("memberlist", service.memberlist());
			return "member/member_list";
		}
}
