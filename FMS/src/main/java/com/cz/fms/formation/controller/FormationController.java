package com.cz.fms.formation.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cz.fms.formation.service.FormationService;

@Controller
public class FormationController {
	
	private static final Logger logger = LoggerFactory.getLogger(FormationController.class);
	
	@Inject
	private FormationService service;
	
	@RequestMapping(value = "/formationList", method = RequestMethod.GET)
	public String formationList(Locale locale, Model model) throws Exception {
		
		logger.info("formation 리스트 폼 실행 ");
		
		List<List<Object>> scheduleList = service.ScheduleList();
		
		
		model.addAttribute("scheduleList", scheduleList);
		
		return "/formation/formationList";
	}
	
	
	@RequestMapping(value = "/formationList", method = RequestMethod.POST)
	public String formationListRegistModal(@RequestParam("gradeInput") double gradeInput, 
			@RequestParam("modalPlayerComment") String modalPlayerComment,
			@RequestParam("modalTacticsNum") int modalTacticsNum,
			@RequestParam("modalMemberNum") int modalMemberNum) throws Exception {
		
			
			service.gradeUpdate(gradeInput, modalTacticsNum, modalMemberNum);
			service.commentUpdate(modalPlayerComment, modalTacticsNum, modalMemberNum);
			
			return "redirect:/formationList";
	}

	

}
