package com.cz.fms.member.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cz.fms.member.domain.Criteria;
import com.cz.fms.member.domain.MemberAdmin;
import com.cz.fms.member.domain.PageMakerMember;
import com.cz.fms.member.domain.SearchCriteriaMember;
import com.cz.fms.member.service.MemberAdminService;

/**
 * 관리자 회원관리 컨트롤러
 * 
 * @param 회원관리수정
 *            탈퇴
 * @author KOSTA 126기 박찬용
 */
@Controller
@RequestMapping("/admin/*")
public class MemberAdminController {

	private static final Logger logger = LoggerFactory.getLogger(MemberAdminController.class);

	@Inject
	private MemberAdminService service;

	/**
	 * 회원 전체리스트 출력
	 * 
	 * @param 박찬용
	 *            전체리스트 테이블로 동적 출력
	 * @return member/member_all
	 * @throws Exception
	 */

	/*// 전체회원 리스트 출력
	@RequestMapping(value = "/member_list", method = RequestMethod.GET)
	public void memberlistAll(Model model) throws Exception {
		logger.info(">>> 전체회원 출력 되나요..?");
		model.addAttribute("memberList", service.memberListAll());
	}*/

	// 상세보기 출력
	@RequestMapping(value = "/member_read", method = RequestMethod.GET)
	public void memberRead(@RequestParam("member_num") int member_num, Model model) throws Exception {
		logger.info("회원 상세보기 접속완료!");

		model.addAttribute("MemberAdmin", service.readMember(member_num));
	}

	// 관리자 회원탈퇴
	@RequestMapping(value = "/member_remove", method = RequestMethod.GET)
	public String memberRemove(@RequestParam("member_num") int member_num, RedirectAttributes rttr) throws Exception {
		service.deleteMember(member_num);
		
		rttr.addFlashAttribute("alert", "REMOVE");

		return "redirect:/admin/member_list";
	}

	// 관리자 회원수정 GET
	@RequestMapping(value = "/member_modify", method = RequestMethod.GET)
	public void memberModifyGET(int member_num, Model model) throws Exception {
		model.addAttribute("MemberAdmin", service.readMember(member_num));
	}
	
	// 관리자 회원수정 POST
	@RequestMapping(value = "/member_modify", method = RequestMethod.POST)
	public String memberModifyPOST(MemberAdmin memberAdmin, RedirectAttributes rttr) throws Exception {
		logger.info("수정 POST 접근");
		
		service.updateMember(memberAdmin);
		rttr.addFlashAttribute("alert", "MODIFY");
		
		return "redirect:/admin/member_list";
	}

	// 페이징 처리
	@RequestMapping(value = "/member_listCri", method = RequestMethod.GET)
	public void memberlistAll(Criteria cri, Model model) throws Exception {

		model.addAttribute("memberList", service.memberListCriteria(cri));
	}

	// 검색 + 페이징 처리
	@RequestMapping(value = "/member_list", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") SearchCriteriaMember cri, Model model) throws Exception {

		logger.info(cri.toString());

		model.addAttribute("memberList", service.listSearchCriteria(cri));
		//logger.info("사이즈 수: " + service.memberListCriteria(cri).size());
		// model.addAttribute("list", service.listAll());
		PageMakerMember pageMaker = new PageMakerMember();
		pageMaker.setCri(cri);
		// pageMaker.setTotalCount(3);
		//pageMaker.setTotalCount(service.listCountCriteria(cri));
		pageMaker.setTotalCount(service.listSearchCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
	}
	
}