/**
 *  게시글 controller class
 */
package com.cz.fms.article.controller;

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

import com.cz.fms.article.domain.Bulletin;
import com.cz.fms.article.service.BulletinService;
import com.cz.fms.common.web.Criteria;
import com.cz.fms.common.web.PageMaker;




@Controller
@RequestMapping("/article/*")
public class BulletinController {
	
	private static final Logger logger = LoggerFactory.getLogger(BulletinController.class);
	
	@Inject
	private BulletinService service;
	
	//등록 (get)
	
	@RequestMapping(value="/write" , method = RequestMethod.GET)
	public void registerGET(Bulletin bulletin, Model model) throws Exception{
		
		logger.info("새글 등록 get");
	
	}
	

	//등록 (post)
	@RequestMapping(value="/write", method = RequestMethod.POST)
	public String registPOST(Bulletin bulletin, RedirectAttributes rttr) throws Exception{
		
		logger.info("새글 등록 post");
		logger.info(bulletin.toString());
		
		service.regist(bulletin);
		
		//model.addAttribute("result", "success");
		rttr.addFlashAttribute("msg","SUCCESS");
		
		//return "/board/success";
		return "redirect:/article/listPage";   
  	}
	
	//전체 리스트
	@RequestMapping(value="/listAll", method= RequestMethod.GET)
	public void listAll(Model model) throws Exception {
		
		logger.info("전체리스트");
		model.addAttribute("list", service.listAll());
	}
	
	//상세
	@RequestMapping(value="/read" , method= RequestMethod.GET)
	public void read(@RequestParam("bulletin_num") int bulletin_num, Model model) throws Exception{
		logger.info("상세보기...");
		model.addAttribute(service.read(bulletin_num));
	}
	
	//삭제
	@RequestMapping(value="/remove" ,method=RequestMethod.POST)
	public String remove(@RequestParam("bulletin_num") int bulletin_num, RedirectAttributes rttr) throws Exception{
		
		logger.info("삭제");
		service.remove(bulletin_num);
		
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/article/listPage";
	}
	
	//수정 (get)
	@RequestMapping(value="/modify" , method= RequestMethod.GET)
	public void modifyGET(int bulletin_num, Model model) throws Exception {
		
		logger.info("mod get");
		
		model.addAttribute(service.read(bulletin_num));
	}
	
	//수정 (post)
	@RequestMapping(value="/modify", method= RequestMethod.POST)
	public String modifyPOST(Bulletin bulletin, RedirectAttributes rttr) throws Exception {
		
		logger.info("mod post");
		
		service.modify(bulletin);
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/article/listPage";
	}
	
	//페이징 처리
	@RequestMapping(value="/listCri", method = RequestMethod.GET)
	public void listAll(Criteria cri, Model model) throws Exception{
		
		logger.info("show list Page with Criteria");
		
		model.addAttribute("list", service.listCriteria(cri));
	}
	
	//페이지 처리 전체 리스트 
	@RequestMapping(value="/listPage", method= RequestMethod.GET)
	public void listPage(@ModelAttribute("cri")Criteria cri, Model model) throws Exception{
		
		logger.info(cri.toString());
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		//pageMaker.setTotalCount(131);
		
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		
	}
	
	//전체 리스트 페이지에서 조회페이지 처리
	@RequestMapping(value="/readPage" , method= RequestMethod.GET)
	public void read(@RequestParam("bulletin_num") int bulletin_num, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		
		model.addAttribute(service.read(bulletin_num));
	}
	
	//삭제
	@RequestMapping(value="/removePage" , method= RequestMethod.POST)
	public String remove(@RequestParam("bulletin_num") int bulletin_num, Criteria cri, RedirectAttributes rttr) throws Exception{
		
		service.remove(bulletin_num);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		return "redirect:/article/listPage";
	}
	
	//수정 페이지 ( GET )
	@RequestMapping(value="/modifyPage" , method= RequestMethod.GET)
	public void modifyPagingGET(@RequestParam("bulletin_num") int bulletin_num, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{
		logger.info("modifyPage_GET");
		model.addAttribute(service.read(bulletin_num));
	}
	
	//수정 페이지 ( POST)
	@RequestMapping(value="/modifyPage" , method= RequestMethod.POST)
	public String modifyPagingPOST(Bulletin bulletin, Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("modifyPage_POST");

		service.modify(bulletin);
		
		rttr.addAttribute("page",cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "SUCCESS");
		//System.out.println(bulletin.getBulletin_title());
		return "redirect:/article/listPage";
	}
	
}
