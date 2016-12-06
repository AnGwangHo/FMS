package com.cz.fms.regularstarter.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.cz.fms.regularstarter.dao.RegularstarterDao;
import com.cz.fms.schedule.domain.Schedule;

@Repository
public class RegularstarterServiceImpl implements RegularstarterService {
	
	@Inject
	private RegularstarterDao dao;

	@Override
	public int getMemberNum(String member_name) throws Exception {
		return dao.getMemberNum(member_name);
	}

	@Override
	public int getFormationNum(String formation_path) throws Exception {
		return dao.getFormationNum(formation_path);
	}

	@Override
	public int getPositionNum(String position_name) throws Exception {
		return dao.getPositionNum(position_name);
	}

	@Override
	public int getScheduleNum(String schedule_title) throws Exception {
		return dao.getScheduleNum(schedule_title);
	}
	
	@Override
	public void tacticsAdd(int formation_num, int tactics_half, int schedule_num) throws Exception {
		dao.tacticsAdd(formation_num, tactics_half, schedule_num);
	}
	
	@Override
	public int getTacticsNum(int formation_num, int tactics_half, int schedule_num) throws Exception {
		return dao.getTacticsNum(formation_num, tactics_half, schedule_num);
	}

	@Override
	public void regularstartersAdd(int tactics_num, int member_num, int position_num, int regularstarter_half, String regularstarter_location)
			throws Exception {
		dao.regularstarterAdd(tactics_num, member_num, position_num, regularstarter_half, regularstarter_location);
	}

	@Override
	public void tacticsDelete(int tactics_num) throws Exception {
		dao.tacticsDelete(tactics_num);
	}

	@Override
	public void regularstarterDelete(int tactics_num) throws Exception {
		dao.regularstarterDelete(tactics_num);
	}

	@Override
	public List<Schedule> getSchedule(int schedule_num) throws Exception {
		return dao.getSchedule(schedule_num);
	}
	
	
}
