/**
 *  SearchBulletinController ( 검색 게시글  )
 *  김민호
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
import com.cz.fms.common.web.PageMaker;
import com.cz.fms.common.web.SearchCriteria;

@Controller
@RequestMapping("/sarticle/*")
public class SearchBulletinController {

  private static final Logger logger = LoggerFactory.getLogger(SearchBulletinController.class);

  @Inject
  private BulletinService service;

  //게시글 페이지 리스트 
  @RequestMapping(value = "/list", method = RequestMethod.GET)
  public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

    logger.info(cri.toString());

    //model.addAttribute("list", service.listCriteria(cri));
    model.addAttribute("list", service.listSearchCriteria(cri));

    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);

    //pageMaker.setTotalCount(service.listCountCriteria(cri));
    pageMaker.setTotalCount(service.listSearchCount(cri));

    model.addAttribute("pageMaker", pageMaker);
  }
  
  //게시글 상세
  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
  public void read(@RequestParam("bulletin_num") int bulletin_num, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	logger.info("게시글 상세보기");
    model.addAttribute(service.read(bulletin_num));
  }
  
  //게시글 삭제
  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("bulletin_num") int bulletin_num, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
	logger.info("게시글 삭제");
    service.remove(bulletin_num);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/sarticle/list";
  }

  //게시글 수정화면 이동
  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(int bulletin_num, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
	logger.info("게시글 수정화면 이동");
    model.addAttribute(service.read(bulletin_num));
  }

  //게시글 수정
  @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
  public String modifyPagingPOST(Bulletin bulletin, SearchCriteria cri, RedirectAttributes rttr) throws Exception {
	logger.info("게시글 수정");
    logger.info(cri.toString());
    service.modify(bulletin);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addAttribute("searchType", cri.getSearchType());
    rttr.addAttribute("keyword", cri.getKeyword());

    rttr.addFlashAttribute("msg", "SUCCESS");

    logger.info(rttr.toString());

    return "redirect:/sarticle/list";
  }

  //게시글 등록 화면 이동
  @RequestMapping(value = "/write", method = RequestMethod.GET)
  public void registGET() throws Exception {
    logger.info("게시글 등록화면 이동");
  }
  
  //게시글 등록
  @RequestMapping(value = "/write", method = RequestMethod.POST)
  public String registPOST(Bulletin bulletin, RedirectAttributes rttr) throws Exception {
    logger.info("게시글 등록");
    logger.info(bulletin.toString());

    service.regist(bulletin);

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/sarticle/list";
  }
  
}
