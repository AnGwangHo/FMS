package com.cz.fms.regularstarter.domain;

public class Regularstarter {
	
	private int tactics_num;
	private int member_num;
	private int position_num;
	private double regularstarter_grade;
	private String regularstarter_comment;
	private int regularstarter_half;
	private String regularstarter_location;
	private int regularstarter_change;
	
	
	
	
	public Regularstarter() {}
	
	public Regularstarter(int tactics_num, int member_num, int position_num, double regularstarter_grade,
			String regularstarter_comment, int regularstarter_half, String regularstarter_location,
			int regularstarter_change) {
		this.tactics_num = tactics_num;
		this.member_num = member_num;
		this.position_num = position_num;
		this.regularstarter_grade = regularstarter_grade;
		this.regularstarter_comment = regularstarter_comment;
		this.regularstarter_half = regularstarter_half;
		this.regularstarter_location = regularstarter_location;
		this.regularstarter_change = regularstarter_change;
	}



	public int getTactics_num() {
		return tactics_num;
	}
	public void setTactics_num(int tactics_num) {
		this.tactics_num = tactics_num;
	}
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public int getPosition_num() {
		return position_num;
	}
	public void setPosition_num(int position_num) {
		this.position_num = position_num;
	}
	public double getRegularstarter_grade() {
		return regularstarter_grade;
	}
	public void setRegularstarter_grade(double regularstarter_grade) {
		this.regularstarter_grade = regularstarter_grade;
	}
	public String getRegularstarter_comment() {
		return regularstarter_comment;
	}
	public void setRegularstarter_comment(String regularstarter_comment) {
		this.regularstarter_comment = regularstarter_comment;
	}
	public int getRegularstarter_half() {
		return regularstarter_half;
	}
	public void setRegularstarter_half(int regularstarter_half) {
		this.regularstarter_half = regularstarter_half;
	}
	public String getRegularstarter_location() {
		return regularstarter_location;
	}
	public void setRegularstarter_location(String regularstarter_location) {
		this.regularstarter_location = regularstarter_location;
	}
	public int getRegularstarter_change() {
		return regularstarter_change;
	}
	public void setRegularstarter_change(int regularstarter_change) {
		this.regularstarter_change = regularstarter_change;
	}

	@Override
	public String toString() {
		return "Regularstarter [tactics_num=" + tactics_num + ", member_num=" + member_num + ", position_num="
				+ position_num + ", regularstarter_grade=" + regularstarter_grade + ", regularstarter_comment="
				+ regularstarter_comment + ", regularstarter_half=" + regularstarter_half + ", regularstarter_location="
				+ regularstarter_location + ", regularstarter_change=" + regularstarter_change + "]";
	}
	
	
	
	

}
