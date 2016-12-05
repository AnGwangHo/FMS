package com.cz.fms.member.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cz.fms.member.dao.Login;
import com.cz.fms.member.domain.Member;
import com.cz.fms.member.service.MemberService;
/**
 * member에서 저장한 값을 받아와 값을 수정하는memberModify의 get과 post 메소드가 2개가 존재하고
 * 수정할시에 자신의 사진을 볼수있는 사진출력 메소드가 추가되어있다.
 * 마지막으로 일반 유저들이 다른 유저를 검색하고 볼수있는 맴버리스트의 화면도 호출해준다.
 ** 
 * @author 임영묵
 */
@Controller
public class mypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(mypageController.class);
	
	@Inject
	private MemberService service;
	
		/** MYPAGE 에 Get으로 접속하기만 하는 컨트롤러. 맴버 아이디만 받아오면 된다.*/
		@RequestMapping(value = "/member/member_mypage", method = RequestMethod.GET)
		public void memberRead(@RequestParam("member_id") String member_id, Model model, Login login) throws Exception {
			logger.info("MY PAGE 접속완료!");
			
			Member member = service.MemberMypage(member_id);
			model.addAttribute("Member_info", member);
		}
		
		/** MYPAGE 에서 수정한값을 다시 DB에 저장하기 위해 POST 작업을 거친다. */
		@RequestMapping(value = "/member/member_mypage", method = RequestMethod.POST)
		public String memberModifyPOST(Member member, Model model) throws Exception {
			
			logger.info("MY PAGE 수정완료!");
			
			service.Membermodify(member);
			
			model.addAttribute("Member_info", member);
			System.out.println(member);
			
			return "/member/member_mypage";
		}
		
		/** 일반 유저들도 볼수있는 맴버리스트를 출력한다. */
		@RequestMapping(value = "/member_list", method = RequestMethod.GET)
		public String login(Locale locale, Model model) throws Exception {
			
			model.addAttribute("memberlist", service.memberlist());
			return "member/member_list";
		}
		
		/** MYPAGE에서 사진을 호출해 띄워주는 역활을 한다. */
		@RequestMapping("/getImage/{member_num}")
		@ResponseBody
		public List<String> getImage(@PathVariable("member_num")int member_num)throws Exception{
			
			return service.getImage(member_num);		
		}
}
