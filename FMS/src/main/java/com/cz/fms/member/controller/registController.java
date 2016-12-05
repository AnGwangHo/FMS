package com.cz.fms.member.controller;

import java.io.File;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cz.fms.member.domain.Member;
import com.cz.fms.member.service.MemberService;

/**
 * 로그인의 뷰만 보여주는 컨트롤러. Logger로 뷰가 켜졌다는걸 알려주는 역할만한다.
 * 추가로 화면의 사진을 업로드 시켜, DB와 프로젝트내에 존재하도록 하는 메소드와
 * Ajax처리를 한 uploadForm을 통해 화면에 뿌려주고 저장해주는 역할을 맡고있다.
 * 
 * @author임영묵
 */
@Controller
public class registController {

	private static final Logger logger = LoggerFactory.getLogger(registController.class);

	/** 파일 저장/불러오기 경로 */
	private String uploadPath = "D:/kosta126/workspace/FMS/src/main/webapp/resources/images/member";

	@Inject
	private MemberService service;	

	/** 회원가입 폼으로 넘어가는 기본 컨트롤러. GET으로 불러와 데이터의 정보는없다. */
	@RequestMapping(value = "/member_regist", method = RequestMethod.GET)
	public String registGet(Model model) throws Exception {

		logger.info("regist(실행) 회원가입실행 ");

		logger.info("register get...");
		return "/member/member_regist";
	}

	/** 회원가입에서 결과화면과 DB에 추가해주는 컨트롤러. 회원가입화면에서도 post외에는 지정하는값이 없어야 정상 작동가능하다. */
	@RequestMapping(value = "/member_regist", method = RequestMethod.POST)
	public String registPOST(Member member, Model model) throws Exception {

		logger.info("regist(회원가입완료) POST... ");

		logger.info(member.toString());

		service.memberadd(member);

		model.addAttribute("result", "sucess");

		return "member/member_result";
	}

	/** 회원가입내에 사진을 Ajax 를 전송해주는 컨트롤러.*/
	@ResponseBody
	@RequestMapping(value = "/profile_image", method = RequestMethod.POST, produces = "text/plain; charset=UTF-8")
	public ResponseEntity<String> uploadForm(MultipartFile file) throws Exception {

		logger.info("[전송완료]파일이름 :" + file.getOriginalFilename());

		return new ResponseEntity<>(uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
	}

	/** 파일을 업로드하기위한 기본 설정. 이름과 저장할장소를 지정하고 FileCopyUtils.copy를 이용해 값을 옴겨준다.*/
	static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		String saveName = originalName;

		 File target = new File(uploadPath, saveName);

		FileCopyUtils.copy(fileData, target);

		String uploadedFileName = null;
		
		return uploadedFileName;
	}
}
