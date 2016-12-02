package com.cz.fms.vote.controller;

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
 * Handles requests for the application home page.
 */
@Controller
public class voteController {
	
	private static final Logger logger = LoggerFactory.getLogger(voteController.class);
	
	@RequestMapping(value = "/vote", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		logger.info("vote(투표화면) 실행했습니다!", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "vote/vote_form";
	}
}
