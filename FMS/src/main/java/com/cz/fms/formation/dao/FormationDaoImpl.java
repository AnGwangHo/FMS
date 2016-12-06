package com.cz.fms.formation.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cz.fms.member.domain.Member;
import com.cz.fms.regularstarter.domain.Regularstarter;
import com.cz.fms.schedule.domain.Schedule;
import com.cz.fms.tactics.domain.Tactics;

@Repository
public class FormationDaoImpl implements FormationDao {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.cz.fms.formation";

	@Override
	public List<Regularstarter> regularstarterList(int tactics_num) throws Exception {
		return session.selectList(namespace + ".regularstarterList", tactics_num);
	}

	@Override
	public List<Tactics> getTactics(int tactics_num) throws Exception {
		return session.selectList(namespace + ".tactcisget", tactics_num);
	}

	@Override
	public Schedule getSchedule(int schedule_num) throws Exception {
		return (Schedule)session.selectList(namespace + ".scheduleget", schedule_num);
	}
	
	@Override
	public List<Member> getMember(int member_num) throws Exception {
		return session.selectList(namespace + ".memberget", member_num);
	}
	
	
	@Override
	public List<Regularstarter> getRegularstarter(int member_num, int tactics_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_num", member_num);
		map.put("tactics_num", tactics_num);
		return session.selectList(namespace + ".regularstarterget", map);
	}

	@Override
	public List<List<Object>> ScheduleList() throws Exception {
		List<Map<String, Object>> list = session.selectList(namespace + ".scheduleList");
		
		List<List<Object>> returnList = new ArrayList<List<Object>>();//return시킬 리스트
		
		for (int i = 0; i < list.size(); i++) {
			List<Object> temp= new ArrayList<Object>(); // 저장 시킬 하나의 값.
			
			Map<String, Object> map = list.get(i);
			Set<String>set =map.keySet();
			Iterator<String> iterator = set.iterator();
			while (iterator.hasNext()) {
				String key = iterator.next();
				
				if(key.equals("FORMATION_NUM")){
					temp.add(map.get(key));
				}
				if(key.equals("SCHEDULE_TITLE")){
					temp.add(map.get(key));
				}
				if(key.equals("TACTICS_NUM")){
					temp.add(map.get(key));
				}
				
				if(key.equals("TACTICS_HALF")){
					temp.add(map.get(key));
				}
				
				if(key.equals("SCHEDULE_DATE")){
					temp.add(map.get(key));
				}
			}
			returnList.add(temp);
		}
		
		
		return returnList;
	}

	@Override
	public void gradeUpdate(double regularstarter_grade, int tactics_num, int member_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("regularstarter_grade", regularstarter_grade);
		map.put("tactics_num", tactics_num);
		map.put("member_num", member_num);
		session.update(namespace + ".gradeUpdate", map);
	}

	@Override
	public void commentUpdate(String regularstarter_comment, int tactics_num, int member_num) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("regularstarter_comment", regularstarter_comment);
		map.put("tactics_num", tactics_num);
		map.put("member_num", member_num);
		session.update(namespace + ".commentUpdate", map);
	}


}
