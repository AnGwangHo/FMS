package com.cz.fms.member.controller;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.cz.fms.member.domain.Member;
import com.cz.fms.member.service.MemberService;

/**
 * 로그인의 뷰만 보여주는 컨트롤러. Logger로 뷰가 켜졌다는걸 알려주는 역할만한다.
 * 
 * @author임영묵
 */
@Controller
public class registController{
	
	private static final Logger logger = LoggerFactory.getLogger(registController.class);
	
	@Inject
	private MemberService service;

	private String uploadsaved;
	
	public void uploadsaved(String uploadsaved) {
		  this.uploadsaved = uploadsaved;
		}
	
	/** 회원가입 폼으로 넘어가는 기본 컨트롤러. GET으로 불러와 데이터의 정보는없다.*/
	 @RequestMapping(value = "/member_regist", method = RequestMethod.GET)
		public String registGet(Model model) throws Exception{
			
			logger.info("regist(실행) 회원가입실행 ");
			
			logger.info("register get...");
			return "/member/member_regist";
		}
	 
	 /** 회원가입에서 결과화면과 DB에 추가해주는 컨트롤러. 회원가입화면에서도 post외에는 지정하는값이 없어야 정상 작동가능하다. */
	 @RequestMapping(value="/member_regist", method = RequestMethod.POST)
	public String registPOST(Member member, Model model) throws Exception {
		 
		 logger.info("regist(회원가입완료) POST... ");
	
		logger.info(member.toString());
		
		service.memberadd(member);
		
		model.addAttribute("result", "sucess");
		
		return "member/member_result";
	}
	 
	 @RequestMapping(value ="/profile_image", method=RequestMethod.POST)
	 public void uploadForm(MultipartFile file, Model model) throws Exception{
		 
		/* String saveName = uploadFile(file.getOriginalFilename(), file.getBytes());*/
		 
		/* model.addAttribute("saveName", saveName);*/
	 }
	 
	 private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception{
		 
		 UUID uid = UUID.randomUUID();	 
		 String saveName =  uid.toString() + "_" + originalName;
		/* String saveName =  "FMS_" + originalName;*/
		 
		 File target = new File(uploadsaved, saveName);
		 
		 FileCopyUtils.copy(fileData, target);
		 
		return saveName;
	 }
	 
	 private static String calcPath(String uploadPath){
		 
		 Calendar cal = Calendar.getInstance();
		 
		 String yearPath = File.separator + cal.get(Calendar.YEAR);
		 
		 String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		 
		 String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)+1);
		 
		 makeDir(uploadPath, yearPath, monthPath,datePath);
		 
		 return datePath;
	 }
	 
	 private static void makeDir(String uploadPath, String...paths){
		 
		 /*if(new File(path[]))*/
	 }
}
