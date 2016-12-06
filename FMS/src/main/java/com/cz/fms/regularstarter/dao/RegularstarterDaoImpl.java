package com.cz.fms.regularstarter.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cz.fms.member.domain.Member;
import com.cz.fms.schedule.domain.Schedule;

@Repository
public class RegularstarterDaoImpl implements RegularstarterDao {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.cz.fms.formation";

	@Override
	public int getMemberNum(String member_name) throws Exception {
		return session.selectOne(namespace + ".findmembernum", member_name);
	}

	@Override
	public int getFormationNum(String formation_path) throws Exception {
		return session.selectOne(namespace + ".findformationnum", formation_path);
	}

	@Override
	public int getPositionNum(String position_name) throws Exception {
		return session.selectOne(namespace + ".findpositionnum", position_name);
	}
	
	@Override
	public int getScheduleNum(String schedule_title) throws Exception {
		return session.selectOne(namespace + ".findschedulenum", schedule_title);
		
	}
	
	@Override
	public void tacticsAdd(int formation_num, int tactics_half, int schedule_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("formation_num", formation_num);
		map.put("tactics_half", tactics_half);
		map.put("schedule_num", schedule_num);
				session.insert(namespace + ".tacticsadd", map);
	}
	

	@Override
	public int getTacticsNum(int formation_num, int tactics_half, int schedule_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("formation_num", formation_num);
		map.put("tactics_half", tactics_half);
		map.put("schedule_num", schedule_num);
		
		return session.selectOne(namespace + ".findtacticsnum", map);
	}

	@Override
	public void regularstarterAdd(int tactics_num, int member_num, int position_num, int regularstarter_half, String regularstarter_location)
			throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tactics_num", tactics_num);
		map.put("member_num", member_num);
		map.put("position_num", position_num);
		map.put("regularstarter_half", regularstarter_half);
		map.put("regularstarter_location", regularstarter_location);
		
		session.insert(namespace + ".regularstarteradd", map);
		
		
	}

	@Override
	public void tacticsDelete(int tactics_num) throws Exception {
		session.delete(namespace + ".tacticsdelete", tactics_num);
		
	}

	@Override
	public void regularstarterDelete(int tactics_num) throws Exception {
		session.delete(namespace + ".regularstarterdelete", tactics_num);
	}

	@Override
	public List<Schedule> getSchedule(int schedule_num) throws Exception {
		return session.selectList(namespace + ".scheduleget", schedule_num);
	}
	
	
	
	

}
