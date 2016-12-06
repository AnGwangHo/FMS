/**
 *  SearchBulletinController ( 검색 게시글  )
 *  김민호
 */
package com.cz.fms.article.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cz.fms.article.domain.Bulletin;
import com.cz.fms.article.service.BulletinService;
import com.cz.fms.common.web.PageMaker;
import com.cz.fms.common.web.SearchCriteria;
import com.cz.fms.member.domain.Member;

@Controller
@RequestMapping("/board/*")
public class SearchBulletinController {

   private static final Logger logger = LoggerFactory.getLogger(SearchBulletinController.class);

   @Inject
   private BulletinService service;

   // 게시글 페이지 리스트
   @RequestMapping(value = "/board_list", method = RequestMethod.GET)
   public void listPage(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

logger.info(cri.toString());
      
      List<List<Object>> sendlist = new ArrayList<List<Object>>();   //보내줄 List
      
      List<Bulletin> listBulletin = service.listSearchCriteria(cri);                               // Bulletin
      
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
         List<Member> memberList   = service.getMember(member_num);     // Member
         String member_id = memberList.get(0).getMember_id();
         
         // 
         inputList.add(bulletin_num);                 // bulletin_num ( 0 )
         inputList.add(bulletintype_num);           // bulletintype_num ( 1 )
         inputList.add(bulletin_title);                   // bulletin_title ( 2 )
         inputList.add(member_id);                   // member_id ( 3 )
         inputList.add(bulletin_date);                 //  bulletin_date ( 4 )
         inputList.add(bulletin_hitcount);            //  bulletin_hitcount ( 5 )
         inputList.add(reply_count);                 //  reply_count ( 6 )
         
         sendlist.add(inputList);
         System.out.println(sendlist.toString());
         
      }
            
      // model.addAttribute("list", service.listCriteria(cri));
      model.addAttribute("sendlist", sendlist);

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);

      // pageMaker.setTotalCount(service.listCountCriteria(cri));
      pageMaker.setTotalCount(service.listSearchCount(cri));

      model.addAttribute("pageMaker", pageMaker);
   }

   // 게시글 상세
   @RequestMapping(value = "/board_read", method = RequestMethod.GET)
   public void read(@RequestParam("bulletin_num") int bulletin_num, @ModelAttribute("cri") SearchCriteria cri,
         Model model) throws Exception {
      logger.info("게시글 상세보기");
      
      //bulletin
      Bulletin bulletin = service.read(bulletin_num);
      
      //member
      int member_num = bulletin.getMember_num();
      service.getMember_id(member_num);
      
       model.addAttribute("bulletin",service.read(bulletin_num));
       System.out.println(service.read(bulletin_num));
       model.addAttribute("member", service.getMember_id(member_num));
       System.out.println(service.getMember_id(member_num));
   }

   // 게시글 삭제
   @RequestMapping(value = "/removePage", method = RequestMethod.POST)
   public String remove(@RequestParam("bulletin_num") int bulletin_num, SearchCriteria cri, RedirectAttributes rttr)
         throws Exception {
      logger.info("게시글 삭제");
      service.remove(bulletin_num);

      rttr.addAttribute("page", cri.getPage());
      rttr.addAttribute("perPageNum", cri.getPerPageNum());
      rttr.addAttribute("searchType", cri.getSearchType());
      rttr.addAttribute("keyword", cri.getKeyword());

      rttr.addFlashAttribute("msg", "SUCCESS");

      return "redirect:/board/board_list";
   }

   // 게시글 수정화면 이동
   @RequestMapping(value = "/board_modify", method = RequestMethod.GET)
   public void modifyPagingGET(int bulletin_num, @ModelAttribute("cri") SearchCriteria cri, Model model)
         throws Exception {
      logger.info("게시글 수정화면 이동");
      //===============================
      
            //bulletin
                  Bulletin bulletin = service.read(bulletin_num);
                  
                  //member
                  int member_num = bulletin.getMember_num();
                  service.getMember_id(member_num);
                  
                   model.addAttribute("bulletin",service.read(bulletin_num));
                   System.out.println(service.read(bulletin_num));
                   model.addAttribute("member", service.getMember_id(member_num));
                   System.out.println(service.getMember_id(member_num));
            
            
            //===============================
            //model.addAttribute(service.read(bulletin_num));
   }

   // 게시글 수정
   @RequestMapping(value = "/board_modify", method = RequestMethod.POST)
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

      return "redirect:/board/board_list";
   }

   // 게시글 등록 화면 이동
   @RequestMapping(value = "/board_write", method = RequestMethod.GET)
   public void registGET() throws Exception {
      logger.info("게시글 등록화면 이동");
   }

   // 게시글 등록
   @RequestMapping(value = "/board_write", method = RequestMethod.POST)
   public String registPOST(Bulletin bulletin, RedirectAttributes rttr) throws Exception {
      logger.info("게시글 등록");
      logger.info(bulletin.toString());

      service.regist(bulletin);

      rttr.addFlashAttribute("msg", "SUCCESS");

      return "redirect:/board/board_list";
   }

   // 파일처리 : 로딩
   @RequestMapping("/getAttach/{bulletin_num}")
   @ResponseBody
   public List<String> getAttach(@PathVariable("bulletin_num") Integer bulletin_num) throws Exception {
      return service.getAttach(bulletin_num);
   }
   
   
}