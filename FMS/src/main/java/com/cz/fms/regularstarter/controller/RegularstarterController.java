package com.cz.fms.regularstarter.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cz.fms.regularstarter.domain.Regularstarter;
import com.cz.fms.regularstarter.service.RegularstarterService;

@Controller
public class RegularstarterController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegularstarterController.class);
	
	@Inject
	private RegularstarterService service;
	
	@RequestMapping(value = "/formation", method = RequestMethod.GET)
	public String formation(Locale locale, Model model) {
		
		logger.info("formation 등록 폼 실행 ");
		
//		service.getSchedule(schedule_num);
		
		
		return "/formation/formation";
	}
	
	@RequestMapping(value = "/formation", method = RequestMethod.POST)
	public String hi(@RequestParam("playerArray") List<String> playerArray, @RequestParam("benchPlayer") List<?> benchPlayer,Locale locale, Model model) throws Exception {

		/***
		 * formation path로 formation num 추출
		 */
		String formation_path = playerArray.get(5);
		int formation_num = service.getFormationNum(formation_path);
		
		/***
		 * half 분기 전반0 후반1
		 */
		String half = playerArray.get(6);
		int tactics_half = 0;
		if(half.equals("후반")){
			tactics_half = 1;
		}
		
		/***
		 * schedule_title으로 schedule_num 추출
		 */
		String schedule_title = playerArray.get(0);
		int schedule_num = service.getScheduleNum(schedule_title);
		
		/***
		 * 전술 테이블에 해당 전술 등록.
		 * formation num 정보 : 433 4231등 무슨 포메이션인지
		 * tactis half 정보 : 0(전반) 1(후반)
		 * schedule_num : 해당 스케줄의 고유번호가 들어간다.
		 */
		service.tacticsAdd(formation_num, tactics_half, schedule_num);
		int tactics_num = service.getTacticsNum(formation_num, tactics_half, schedule_num);
		
		
		for (int i = 0; i < playerArray.size(); i=i+7) {
			List<String> list = new ArrayList<String>();
			list = playerArray.subList(i, i+7);
			
			// member name으로 member id 추출
			String member_name = list.get(1);
			int member_num = service.getMemberNum(member_name);
			
			// position_name으로 position_num 추출
			String position_name = list.get(4);
			int position_num = service.getPositionNum(position_name);
			
			// left 좌표 top좌표  = location 컬럼 값
			String left =list.get(2);
			String top = list.get(3);
			String location = left +","+top;
			
			service.regularstartersAdd(tactics_num, member_num, position_num, tactics_half, location);
			
			
		}
		/***
		 * 후보선수 등록 후보선수이름으로 member num 추출
		 * 포지션 넘버는 후보선수인 5로 고정
		 * 좌표값은 0으로 설정
		 */
		for (int i = 0; i < benchPlayer.size(); i++) {
			
			// member name으로 member id 추출
			String member_name = benchPlayer.get(i).toString();
			int member_num = service.getMemberNum(member_name);
			
			service.regularstartersAdd(tactics_num, member_num, 5, tactics_half, "0");
		}
		return "index";
	}
	
	
	@RequestMapping(value = "/formation/delete", method = RequestMethod.POST)
	public String formationDelete(@RequestParam("tacticsNum") int tacticsNum, Locale locale, Model model) throws Exception {

		logger.info("formation+tactics 삭제 실행 ");
		
		logger.info("tactics 삭제 시작");
		service.tacticsDelete(tacticsNum);
		logger.info("tactics 삭제 완료");
		
		logger.info("regularstarter 삭제 시작");
		service.regularstarterDelete(tacticsNum);
		logger.info("regularstarter 삭제 완료");
		
		logger.info("formation+tactics 삭제 완료");
		
		return "index";
	}
	
	



}
