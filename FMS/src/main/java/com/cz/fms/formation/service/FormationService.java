package com.cz.fms.formation.service;

import java.util.List;

import com.cz.fms.member.domain.Member;
import com.cz.fms.regularstarter.domain.Regularstarter;
import com.cz.fms.schedule.domain.Schedule;
import com.cz.fms.tactics.domain.Tactics;

public interface FormationService {
	
	/** tactics_num으로 Regularstarter 정보 받기 */
	public List<Regularstarter> regularstarterList(int tactics_num)throws Exception;
	
	/** tactics_num으로 Tactics 정보 받기 */
	public List<Tactics> getTactics(int tactics_num)throws Exception;
	
	/** schedule_num으로 Schedule 정보 받기 */
	public Schedule getSchedule(int schedule_num)throws Exception;
	
	/** member_num으로 Schedule 정보 받기 */
	public List<Member> getMember(int member_num)throws Exception;
	
	/** member_num , tactics_num 으로 Regularstarter 정보 받기 */
	public List<Regularstarter> getRegularstarter(int member_num, int tactics_num)throws Exception;
	
	/** 오늘 이후의 날짜로 스케줄 리스트 받기 */
	public List<List<Object>> ScheduleList()throws Exception;
	
	/** 해당 선수 평점 업데이트  */
	public void gradeUpdate(double regularstarter_grade, int tactics_num, int member_num) throws Exception;
	
	/** 해당 선수 코멘트 업데이트  */
	public void commentUpdate(String regularstarter_comment, int tactics_num, int member_num) throws Exception;
	
	
}
