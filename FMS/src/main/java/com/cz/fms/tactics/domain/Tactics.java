package com.cz.fms.tactics.domain;

public class Tactics {
	
	private int tactics_num;
	private int schedule_num;
	private int formation_num;
	private int tactics_half;
	
	public Tactics() {}
	
	public Tactics(int tactics_num, int schedule_num, int formation_num, int tactics_half) {
		this.tactics_num = tactics_num;
		this.schedule_num = schedule_num;
		this.formation_num = formation_num;
		this.tactics_half = tactics_half;
	}


	public int getTactics_num() {
		return tactics_num;
	}
	public void setTactics_num(int tactics_num) {
		this.tactics_num = tactics_num;
	}
	public int getSchedule_num() {
		return schedule_num;
	}
	public void setSchedule_num(int schedule_num) {
		this.schedule_num = schedule_num;
	}
	public int getFormation_num() {
		return formation_num;
	}
	public void setFormation_num(int formation_num) {
		this.formation_num = formation_num;
	}
	public int getTactics_half() {
		return tactics_half;
	}
	public void setTactics_half(int tactics_half) {
		this.tactics_half = tactics_half;
	}
	

}
