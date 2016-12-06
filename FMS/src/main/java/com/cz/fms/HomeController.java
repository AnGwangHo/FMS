package com.cz.fms;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cz.fms.article.domain.Bulletin;
import com.cz.fms.article.service.BulletinService;
import com.cz.fms.common.web.PageMaker;
import com.cz.fms.common.web.SearchCriteria;
import com.cz.fms.member.domain.Member;
import com.cz.fms.schedule.service.ScheduleService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Inject
	private ScheduleService service;

	@Inject
	private BulletinService bulletinservice;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "index";
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public String schedule(Locale locale, Model model, @ModelAttribute("cri") SearchCriteria cri) throws Exception {
		logger.info("스케줄 선택", locale);
		model.addAttribute("events", service.scheduleListAll());

		// 공지사항 보여주기
		logger.info(cri.toString());

		List<List<Object>> sendlist = new ArrayList<List<Object>>(); // 보내줄 List

		List<Bulletin> listBulletin = bulletinservice.listSearchCriteria(cri); // Bulletin

		for (int i = 0; i < listBulletin.size(); i++) {
			List<Object> inputList = new ArrayList<Object>();
			int member_num = listBulletin.get(i).getMember_num();

			// bulletin
			int bulletin_num = listBulletin.get(i).getBulletin_num();
			int bulletintype_num = listBulletin.get(i).getBulletintype_num();
			String bulletin_title = listBulletin.get(i).getBulletin_title();
			Date bulletin_date = listBulletin.get(i).getBulletin_date();
			int bulletin_hitcount = listBulletin.get(i).getBulletin_hitcount();
			int reply_count = listBulletin.get(i).getReply_count();

			// member
			List<Member> memberList = bulletinservice.getMember(member_num); // Member
			String member_id = memberList.get(0).getMember_id();

			//
			inputList.add(bulletin_num); // 0
			inputList.add(bulletintype_num); // 1
			inputList.add(bulletin_title); // 2
			inputList.add(member_id); // 3
			inputList.add(bulletin_date); // 4
			inputList.add(bulletin_hitcount); // 5
			inputList.add(reply_count); // 6

			sendlist.add(inputList);
			System.out.println(sendlist.toString());

		}

		// model.addAttribute("list", service.listCriteria(cri));
		model.addAttribute("sendlist", sendlist);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		// pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(bulletinservice.listSearchCount(cri));

		model.addAttribute("pageMaker", pageMaker);

		return "schedule/schedule_view";
	}

}