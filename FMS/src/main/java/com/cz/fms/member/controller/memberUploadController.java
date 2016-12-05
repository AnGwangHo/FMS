package com.cz.fms.member.controller;

import java.io.FileInputStream;
import java.io.InputStream;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cz.fms.util.MemberMediaUtils;

/**
 * 맴버의 사진을 업로드 하기위한 처리를 하는 컨트롤러로. displayFile을 JSON으로 값을 처리해서 화면에 뿌려주게된다.
 ** 
 * @author 임영묵
 */
@Controller
public class memberUploadController {

	   /** 파일을 저장, 로드하는 기본위치 */
	   private String uploadPath = "D:/kosta126/workspace/FMS/src/main/webapp/resources/images/member";
	   
	   private static final Logger logger = LoggerFactory.getLogger(memberController.class);

	   /** 파일 상세보기를 하기위해 displayFile이라는 이름으로 json으로 값을 처리한다.*/
	   @ResponseBody
	   @RequestMapping("/memberdisplayFile")
	   public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {

	      InputStream in = null;
	      ResponseEntity<byte[]> entity = null;

	      logger.info("FILE NAME: " + fileName);

	      try {

	         String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

	         MediaType mType = MemberMediaUtils.getMediaType(formatName);

	         HttpHeaders headers = new HttpHeaders();

	         //in = new FileInputStream(uploadPath + fileName);
	         in = new FileInputStream(uploadPath + "/" + fileName);
	         if (mType != null) {
	            headers.setContentType(mType);
	         } else {

	            fileName = fileName.substring(fileName.indexOf("_") + 1);
	            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	            headers.add("Content-Disposition",
	                  "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
	         }

	         entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
	      } catch (Exception e) {
	         e.printStackTrace();
	         entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	      } finally {
	         in.close();
	      }
	      return entity;
	   }   
}