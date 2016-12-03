package com.cz.fms.schedule.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cz.fms.schedule.domain.Schedule;
import com.cz.fms.schedule.service.ScheduleService;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Inject
	private ScheduleService service;
	
	/**
	 * 일정 등록 메소드로 /add_View로 GET 요청이 들어 왔을 경우 실행
	 * @author "안광호"
	 * */
	@RequestMapping(value="/add_View", method = RequestMethod.GET)
	public void addViewGET(Model model) throws Exception{
		logger.info("add_View GET 실행.....................");
	}
	@RequestMapping(value="/add_View", method = RequestMethod.POST)
	public String addViewPOST(Schedule schedule, Model model) throws Exception{
		logger.info("add_View POST 실행.....................");
		if(schedule.getSchedule_deadline()==null){//마감을 안정했을 시
			schedule.setSchedule_deadline(schedule.getSchedule_date());//데드라인을 일정날짜와 같게 설정해준다.
		}
		schedule.setSchedule_writer("방그리");//정적인 값 테스트
		service.scheduleAdd(schedule);
		model.addAttribute("msg", "OK");
		
		return "redirect:/schedule/listAll";
	}
	
	/**
	 * 일정 수정
	 * @author "안광호"
	 * */
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modifyGET(int schedule_num, RedirectAttributes rttr) throws Exception{
		rttr.addAttribute(service.detailSchedule(schedule_num));
		
		return "redirect:/schedule/detail_View";
	}
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String modifyPOST(Schedule schedule, Model model) throws Exception{
		logger.info("일정수정 post 실행.....................");
		
		service.scheduleModify(schedule);
		model.addAttribute("schedule_num", schedule.getSchedule_num());
		model.addAttribute("msg", "OK");
		
		return "/schedule/detail_View";
	}
	
	/**
	 * 일정 삭제 메소드로 /schedule/remove로 POST요청이 들어왔을 경우 실행
	 * @author "안광호"
	 * @param schedule_num 수정할 일정 고유번호
	 * */
	@RequestMapping(value="/remove", method = RequestMethod.POST)
	public String remove(@RequestParam("schedule_num") int schedule_num, RedirectAttributes rttr) throws Exception{
		logger.info("일정삭제 post 실행.....................");
		service.scheduleDelete(schedule_num);
		rttr.addFlashAttribute("msg", "OK");
		
		return "redirect:/schedule/listAll";
	}
	
	/**
	 * 일정 전체보기 메소드로 /schedule/listAll로 GET요청이 들어왔을 경우 실행
	 * value : List<Schedule>
	 * @author "안광호"
	 * */
	@RequestMapping(value="/listAll", method = RequestMethod.GET)
	public String listAll(Model model) throws Exception{
		logger.info("전체보기 실행.......................");
		//model.addAttribute("list", service.scheduleListAll());
		model.addAttribute("events", service.scheduleListAll());
		return "redirect:/schedule";
	}
	
	@RequestMapping(value="/jsontest", method = RequestMethod.GET)
	public @ResponseBody List<Schedule> test(Model model) throws Exception{
		logger.info("JSONTEST 실행.......................");
		
		return service.scheduleListAll();
	}
	
	/**
	 * 상세 일정 보기 메소드로 /schedule/detail_View로 GET요청이 들어왔을 경우 실행
	 * paranname : schedule
	 * value : schedule
	 * @author "안광호"
	 * */
	@RequestMapping(value="/detail_View", method = RequestMethod.GET)
	public void readSchedule(@RequestParam("schedule_num") Integer schedule_num, Model model) throws Exception{
		logger.info("detail_view 실행.......................");
		if(schedule_num != null)
		model.addAttribute(service.detailSchedule(schedule_num));
	}
	
	/**
	 * 경기참여 메소드 /schedule/joinGame로 POST요청이 들어왔을 경우 실행
	 * @author "안광호"
	 * */
	@RequestMapping(value="/joinGame", method = RequestMethod.POST)
	public String joinGame(Integer schedule_num, int member_num, Model model) throws Exception{
		logger.info("joinGame 실행......................."+schedule_num+"|"+member_num);
		service.joinSchedule(schedule_num, member_num);
		
		model.addAttribute("schedule_num" ,schedule_num);
		return "/schedule/detail_View";
	}
	
	/**
	 * 댓글 등록
	 * @author "안광호"
	 * */
	
	/**
	 * 댓글 수정
	 * @author "안광호"
	 * */
	
	/**
	 * 댓글 삭제
	 * @author "안광호"
	 * */
	
	/**
	 * 공지사항 출력
	 * @author "안광호"
	 * */
}