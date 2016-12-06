package com.cz.fms.formation.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cz.fms.formation.service.FormationService;
import com.cz.fms.member.domain.Member;
import com.cz.fms.regularstarter.domain.Regularstarter;
import com.cz.fms.regularstarter.service.RegularstarterService;
import com.cz.fms.schedule.domain.Schedule;
import com.cz.fms.tactics.domain.Tactics;
import com.fasterxml.jackson.databind.util.JSONPObject;

@RestController
public class FormationRestController {
	
	private static final Logger logger = LoggerFactory.getLogger(FormationRestController.class);
	
	@Inject
	private FormationService service;

	@RequestMapping(value = "/formationList/get", method = RequestMethod.GET)
	public ResponseEntity<List<List<Object>>> getFormationList(@RequestParam("tactics_num") int tactics_num) throws Exception {
		
		ResponseEntity<List<List<Object>>> entity = null;
		
		
		try{
			
			List<List<Object>> listValue = new ArrayList<List<Object>>();
			
			List<Regularstarter> listdata = service.regularstarterList(tactics_num);
			for (int i = 0; i < listdata.size(); i++) {
				
				List<Object> insertValue = new ArrayList<Object>();
				
				int memberNum = listdata.get(i).getMember_num();
				List<Member>member = service.getMember(memberNum);
				int member_num = member.get(0).getMember_num();
				String member_id = member.get(0).getMember_id();
				String member_name = member.get(0).getMember_name();
				int member_age = member.get(0).getMember_age();
				int member_height = member.get(0).getMember_height();
				int member_weight = member.get(0).getMember_weight();
				int member_foot = member.get(0).getMember_foot();
				int member_mainPosition = member.get(0).getMember_mainposition();
				String member_profile_image = member.get(0).getMember_profile_image();
				
				int position_num = listdata.get(i).getPosition_num();
				int regularstarter_change =  listdata.get(i).getRegularstarter_change();
				String regularstarter_comment = listdata.get(i).getRegularstarter_comment();
				String regularstarter_location = listdata.get(i).getRegularstarter_location();
				
				List<Tactics> tactics = service.getTactics(tactics_num);
				int formaiton_num = tactics.get(0).getFormation_num();
				
				insertValue.add(member_num);
				insertValue.add(member_id);
				insertValue.add(member_name);
				insertValue.add(member_age);
				insertValue.add(member_height);
				insertValue.add(member_weight);
				insertValue.add(member_foot);
				insertValue.add(member_mainPosition);
				insertValue.add(member_profile_image);
				insertValue.add(position_num);
				insertValue.add(regularstarter_change);
				insertValue.add(regularstarter_comment);
				insertValue.add(regularstarter_location);
				insertValue.add(formaiton_num);
				
				listValue.add(insertValue);
			}
			
			
			entity = new ResponseEntity<>(listValue, HttpStatus.OK);
		} catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
	}
	
	
	@RequestMapping(value = "/formationList/getPlayer", method = RequestMethod.GET)
	public ResponseEntity<List<Object>> getFormationListModal(@RequestParam("tactics_num") int tactics_num, @RequestParam("member_num") int member_num) throws Exception {
		
		ResponseEntity<List<Object>> entity = null;
		
		try{
			List<Object> list = new ArrayList<Object>();
			
			List<Regularstarter> regularstarters = service.getRegularstarter(member_num, tactics_num);
			List<Member> member = service.getMember(member_num);
			String member_name = member.get(0).getMember_name();
			int member_age = member.get(0).getMember_age();
			int member_height = member.get(0).getMember_height();
			int member_weight = member.get(0).getMember_weight();
			int member_foot = member.get(0).getMember_foot();
			int mainPosition = member.get(0).getMember_mainposition();
			int subPosition = member.get(0).getMember_subposition();
			
			String comment = regularstarters.get(0).getRegularstarter_comment();
			double grade = regularstarters.get(0).getRegularstarter_grade();
			
			list.add(member_name);
			list.add(member_age);
			list.add(member_height);
			list.add(member_weight);
			list.add(member_foot);
			list.add(mainPosition);
			list.add(subPosition);
			list.add(comment);
			list.add(grade);
			
			
			
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
		return entity;
		
		
	}
	
	
	
	

}
