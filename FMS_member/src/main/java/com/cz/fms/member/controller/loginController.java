package com.cz.fms.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 로그인의 뷰만 보여주는 컨트롤러. Logger로 뷰가 켜졌다는걸 알려주는 역할만한다.
 * 
 * @author 임영묵
 */
@Controller
public class loginController {
	
	private static final Logger logger = LoggerFactory.getLogger(loginController.class);
	
	@RequestMapping(value = "/member_login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("login(화면) 실행했습니다!", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "member/member_login";
	}
}
