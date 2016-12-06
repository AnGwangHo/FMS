package com.cz.fms.regularstarter.service;

import java.util.List;

import com.cz.fms.schedule.domain.Schedule;


public interface RegularstarterService {
	
	/** member name으로 member num 받기 */
	public int getMemberNum(String member_name)throws Exception;
	
	/** formation path로 formation num 받기 */
	public int getFormationNum(String formation_path)throws Exception;
	
	/** position name으로 position num 받기 */
	public int getPositionNum(String position_name)throws Exception;
	
	/** schedule title로 schedule num 받기 */
	public int getScheduleNum(String schedule_title)throws Exception;
	
	/** schedule_num으로 Schedule 정보 받기 */
	public List<Schedule> getSchedule(int schedule_num)throws Exception;
	
	/** tactics 등록 */
	public void tacticsAdd(int formation_num, int tactics_half, int schedule_num)throws Exception;
	
	/** formation num, tactics_half, schedule_num으로 tactics num 받기 */
	public int getTacticsNum(int formation_num, int tactics_half, int schedule_num)throws Exception;
	
	/** regularstarter 등록 */
	public void regularstartersAdd(int tactics_num, int member_num, int position_num, int regularstarter_half, String regularstarter_location)throws Exception;

	/** tactics 삭제 */
	public void tacticsDelete(int tactics_num)throws Exception;
	
	/** regularstarter 삭제 */
	public void regularstarterDelete(int tactics_num)throws Exception;
	
}
