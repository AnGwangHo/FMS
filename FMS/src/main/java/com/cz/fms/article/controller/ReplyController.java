/**
 *  Reply RestController ( 댓글 )
 *  김민호
 */
package com.cz.fms.article.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cz.fms.article.domain.Reply;
import com.cz.fms.article.service.ReplyService;
import com.cz.fms.common.web.Criteria;
import com.cz.fms.common.web.PageMaker;

@RestController
@RequestMapping("/replies")
public class ReplyController {

	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
  @Inject
  private ReplyService service;

  //댓글 등록
  @RequestMapping(value = "", method = RequestMethod.POST)
  public ResponseEntity<String> register(@RequestBody Reply reply) {
	logger.info("댓글 등록");
    ResponseEntity<String> entity = null;
    try {
      service.addReply(reply);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  //댓글 리스트
  @RequestMapping(value = "/all/{bulletin_num}", method = RequestMethod.GET)
  public ResponseEntity<List<Reply>> list(@PathVariable("bulletin_num") int bulletin_num) {
	  logger.info("댓글 리스트?");
	  System.out.println(bulletin_num);
    ResponseEntity<List<Reply>> entity = null;
    try {
      entity = new ResponseEntity<>(service.listReply(bulletin_num), HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    return entity;
  }

  //댓글 수정
  @RequestMapping(value = "/{reply_num}", method = { RequestMethod.PUT, RequestMethod.PATCH })
  public ResponseEntity<String> update(@PathVariable("reply_num") int reply_num, @RequestBody Reply reply) {
	logger.info("댓글 수정");
    ResponseEntity<String> entity = null;
    try {
      reply.setReply_num(reply_num);
      service.modifyReply(reply);     

      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  //댓글 삭제
  @RequestMapping(value = "/{reply_num}", method = RequestMethod.DELETE)
  public ResponseEntity<String> remove(@PathVariable("reply_num") int reply_num) {
	logger.info("댓글 삭제");
    ResponseEntity<String> entity = null;
    try {
    	service.removeReply(reply_num);     
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }
  
  //댓글 페이지처리
  @RequestMapping(value = "/{bulletin_num}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(@PathVariable("bulletin_num") int bulletin_num,@PathVariable("page") int page) {
    logger.info("페이지처리");
	  ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      Criteria cri = new Criteria();
      cri.setPage(page);

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);

      Map<String, Object> map = new HashMap<String, Object>();
      List<Reply> list = service.listReplyPage(bulletin_num, cri);
      for (Reply reply : list) {
		System.out.println("댓글 : " + reply.toString());
	}

      map.put("list", list);

      int replyCount = service.count(bulletin_num);
      pageMaker.setTotalCount(replyCount);

      map.put("pageMaker", pageMaker);

      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

}
