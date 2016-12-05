package com.cz.fms.member.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cz.fms.member.dao.Login;
import com.cz.fms.member.domain.Member;
import com.cz.fms.member.service.MemberService;

/**
 * member에서 기본적인 로그인 화면과, 로그아웃을 인터셉터에서 처리한것이 컨트롤러로 들어온다. 로그인은 post로 받았고, login 은
 * 리턴을 void기 때문에 속성값만 추가해주면 로그인이 완료된다. 로그아웃은 session을 받아놓은걸 삭제하는 문장으로 처리한다.
 * 
 * 회원가입은 GET으로 값을 받아 기본으로 보여준다, POST로 값을 날려주기때문에. 기본 불러온 GET뷰에서 action 처리가 필요가없다.
 ** 
 * @author 임영묵
 */
@Controller
@RequestMapping("/member")
public class memberController {

   private static final Logger logger = LoggerFactory.getLogger(memberController.class);

   @Inject
   private MemberService service;
   
   /** 로그인 화면을 받아만 오는 컨트롤러*/
   @RequestMapping(value = "/login", method = RequestMethod.GET)
   public void loginGET(@ModelAttribute("login") Login login) {

   }
   
   /** 로그인 화면으로 쏴준다. login intercepter에서 session 값을 받아온다.*/
   @RequestMapping(value = "/member_loginPost", method = RequestMethod.POST)
   public String loginPOST(Login login, HttpSession session, Model model) throws Exception {

      Member vo = service.login(login);

      if (vo == null) {
         logger.info("로그인 실패 본래 화면으로 돌아갑니다");
         return "redirect:/login_fail";
      }
      System.out.println("로그인처리완료!");
      System.out.println(vo);
      model.addAttribute("memberVo", vo);
      
      return "index";
   }

   /**
    * 로그아웃 처리를 위해 session.invalidate 를 하면 값이 지워지고, 속성값 login도 지우면 세션 값이 사라진다.
    */
   @RequestMapping(value = "/member_logout", method = RequestMethod.GET)
   public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
         throws Exception {

      Object obj = session.getAttribute("login");

      if (obj != null) {
         /*Member vo = (Member) obj;*/

         session.removeAttribute("login");
         session.invalidate();

         /** 세션의 기한 날짜를 정할경우 사용한다. 날짜 지정은 없기때문에 사용하지않았다.*/
         /*
          * Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
          * 
          * if (loginCookie !=null){ loginCookie.setPath("/");
          * loginCookie.setMaxAge(0); response.addCookie(loginCookie);
          * service.keepLogin(vo.getMember_id(), session.getId(), new
          * Date()); }
          */
      }
      return "/member/member_logout";
   }

   /** Ajax로 Id를 확인시 들어가는 컨트롤러. 기본 컨트롤러와 다르게 ResponseEntity를 사용하며 member_id 로 값을 받아서
    * domain에 Member와 일치하는지 확인하는작업을 한다. */ 
   @ResponseBody
   @RequestMapping(value = "/member_checkid/{id}", method = RequestMethod.GET)
   public ResponseEntity<String> checkid(HttpServletRequest request,
         @PathVariable("id") String member_id) {
      System.out.println(member_id);
      ResponseEntity<String> entity;

      try {
         Member member = service.getMember_Id(member_id);
         if(member == null){
            /** 일치하는 아이디가없을시, SUCESS로 값을 받아 넘어간다. */
            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
         }
         else   {
            entity = new ResponseEntity<String>("DUPLICATE", HttpStatus.OK);
         }
      } catch (Exception e) {
         e.printStackTrace();
         entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
      }
      return entity;
   }
   
   /** Ajax로 비밀번호 확인시 사용한다. DB에 접속할 필요가없기때문에. 실행만 해준다.*/
   @RequestMapping(value = "/member_checkpw", method = RequestMethod.GET)
   public String checkpasswd(Locale locale, Model model) {
      logger.info("비밀번호 check 실행했습니다!", locale);

      Date date = new Date();
      DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

      String formattedDate = dateFormat.format(date);

      model.addAttribute("serverTime", formattedDate);

      return "member/member_checkpw";
   }
   
   /** 회원 탈퇴시에 사용되며 탈퇴와 동시에 로그아웃도 이루어지게된다.*/
   @RequestMapping(value = "/member_remove", method = RequestMethod.GET)
   public String memberRemove(@RequestParam("member_num") int member_num, RedirectAttributes rttr, HttpSession session) throws Exception {
      service.leaveMember(member_num);
      Object obj = session.getAttribute("login");

      if (obj != null) {
         session.removeAttribute("login");
         session.invalidate();
      }
      
      return "redirect:/";
   }
}