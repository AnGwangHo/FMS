package com.cz.fms.formation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.cz.fms.formation.dao.FormationDao;
import com.cz.fms.member.domain.Member;
import com.cz.fms.regularstarter.dao.RegularstarterDao;
import com.cz.fms.regularstarter.domain.Regularstarter;
import com.cz.fms.schedule.domain.Schedule;
import com.cz.fms.tactics.domain.Tactics;

@Repository
public class FormationServiceImpl implements FormationService {
	
	@Inject
	private FormationDao dao;

	@Override
	public List<Regularstarter> regularstarterList(int tactics_num) throws Exception {
		return dao.regularstarterList(tactics_num);
	}

	@Override
	public List<Tactics> getTactics(int tactics_num) throws Exception {
		return dao.getTactics(tactics_num);
	}

	@Override
	public Schedule getSchedule(int schedule_num) throws Exception {
		return dao.getSchedule(schedule_num);
	}
	
	@Override
	public List<Member> getMember(int member_num) throws Exception {
		return dao.getMember(member_num);
	}
	
	@Override
	public List<Regularstarter> getRegularstarter(int member_num, int tactics_num) throws Exception {
		return dao.getRegularstarter(member_num, tactics_num);
	}

	@Override
	public List<List<Object>> ScheduleList() throws Exception {
		return dao.ScheduleList();
	}

	@Override
	public void gradeUpdate(double regularstarter_grade, int tactics_num, int member_num) throws Exception {
			dao.gradeUpdate(regularstarter_grade, tactics_num, member_num);
	}

	@Override
	public void commentUpdate(String regularstarter_comment, int tactics_num, int member_num) throws Exception {
			dao.commentUpdate(regularstarter_comment, tactics_num, member_num);
	}

	



	

	
	
	
}
