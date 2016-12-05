package com.cz.fms.member.domain;

import java.sql.Date;

public class Member {
	private int 	member_num;
	private int 	member_mainposition;
	private int 	member_subposition;
	private String  member_id;
	private String  member_passwd;
	private String  member_name;
	private String  member_profile_image;
	private int 	member_age;
	private int 	member_sex;
	private int 	member_height;
	private int 	member_weight;
	private int 	member_foot;
	private String  member_phone;
	private String  member_email;
	private String  member_addr;
	private String  member_detailaddr;
	private String  member_comment;
	private int 	member_matchcount;
	private Date 	member_regdate;
	
	public Member() {}

	public Member(int member_num, int member_mainposition, int member_subposition, String member_id,
			String member_passwd, String member_name, String member_profile_image, int member_age, int member_sex,
			int member_height, int member_weight, int member_foot, String member_phone, String member_email,
			String member_addr, String member_detailaddr, String member_comment, int member_matchcount,
			Date member_regdate) {
		super();
		this.member_num = member_num;
		this.member_mainposition = member_mainposition;
		this.member_subposition = member_subposition;
		this.member_id = member_id;
		this.member_passwd = member_passwd;
		this.member_name = member_name;
		this.member_profile_image = member_profile_image;
		this.member_age = member_age;
		this.member_sex = member_sex;
		this.member_height = member_height;
		this.member_weight = member_weight;
		this.member_foot = member_foot;
		this.member_phone = member_phone;
		this.member_email = member_email;
		this.member_addr = member_addr;
		this.member_detailaddr = member_detailaddr;
		this.member_comment = member_comment;
		this.member_matchcount = member_matchcount;
		this.member_regdate = member_regdate;
	}

	/**
	 * @return the member_num
	 */
	public int getMember_num() {
		return member_num;
	}

	/**
	 * @param member_num the member_num to set
	 */
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	/**
	 * @return the member_mainposition
	 */
	public int getMember_mainposition() {
		return member_mainposition;
	}

	/**
	 * @param member_mainposition the member_mainposition to set
	 */
	public void setMember_mainposition(int member_mainposition) {
		this.member_mainposition = member_mainposition;
	}

	/**
	 * @return the member_subposition
	 */
	public int getMember_subposition() {
		return member_subposition;
	}

	/**
	 * @param member_subposition the member_subposition to set
	 */
	public void setMember_subposition(int member_subposition) {
		this.member_subposition = member_subposition;
	}

	/**
	 * @return the member_id
	 */
	public String getMember_id() {
		return member_id;
	}

	/**
	 * @param member_id the member_id to set
	 */
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	/**
	 * @return the member_passwd
	 */
	public String getMember_passwd() {
		return member_passwd;
	}

	/**
	 * @param member_passwd the member_passwd to set
	 */
	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}

	/**
	 * @return the member_name
	 */
	public String getMember_name() {
		return member_name;
	}

	/**
	 * @param member_name the member_name to set
	 */
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	/**
	 * @return the member_profile_image
	 */
	public String getMember_profile_image() {
		return member_profile_image;
	}

	/**
	 * @param member_profile_image the member_profile_image to set
	 */
	public void setMember_profile_image(String member_profile_image) {
		this.member_profile_image = member_profile_image;
	}

	/**
	 * @return the member_age
	 */
	public int getMember_age() {
		return member_age;
	}

	/**
	 * @param member_age the member_age to set
	 */
	public void setMember_age(int member_age) {
		this.member_age = member_age;
	}

	/**
	 * @return the member_sex
	 */
	public int getMember_sex() {
		return member_sex;
	}

	/**
	 * @param member_sex the member_sex to set
	 */
	public void setMember_sex(int member_sex) {
		this.member_sex = member_sex;
	}

	/**
	 * @return the member_height
	 */
	public int getMember_height() {
		return member_height;
	}

	/**
	 * @param member_height the member_height to set
	 */
	public void setMember_height(int member_height) {
		this.member_height = member_height;
	}

	/**
	 * @return the member_weight
	 */
	public int getMember_weight() {
		return member_weight;
	}

	/**
	 * @param member_weight the member_weight to set
	 */
	public void setMember_weight(int member_weight) {
		this.member_weight = member_weight;
	}

	/**
	 * @return the member_foot
	 */
	public int getMember_foot() {
		return member_foot;
	}

	/**
	 * @param member_foot the member_foot to set
	 */
	public void setMember_foot(int member_foot) {
		this.member_foot = member_foot;
	}

	/**
	 * @return the member_phone
	 */
	public String getMember_phone() {
		return member_phone;
	}

	/**
	 * @param member_phone the member_phone to set
	 */
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	/**
	 * @return the member_email
	 */
	public String getMember_email() {
		return member_email;
	}

	/**
	 * @param member_email the member_email to set
	 */
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	/**
	 * @return the member_addr
	 */
	public String getMember_addr() {
		return member_addr;
	}

	/**
	 * @param member_addr the member_addr to set
	 */
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	/**
	 * @return the member_detailaddr
	 */
	public String getMember_detailaddr() {
		return member_detailaddr;
	}

	/**
	 * @param member_detailaddr the member_detailaddr to set
	 */
	public void setMember_detailaddr(String member_detailaddr) {
		this.member_detailaddr = member_detailaddr;
	}

	/**
	 * @return the member_comment
	 */
	public String getMember_comment() {
		return member_comment;
	}

	/**
	 * @param member_comment the member_comment to set
	 */
	public void setMember_comment(String member_comment) {
		this.member_comment = member_comment;
	}

	/**
	 * @return the member_matchcount
	 */
	public int getMember_matchcount() {
		return member_matchcount;
	}

	/**
	 * @param member_matchcount the member_matchcount to set
	 */
	public void setMember_matchcount(int member_matchcount) {
		this.member_matchcount = member_matchcount;
	}

	/**
	 * @return the member_regdate
	 */
	public Date getMember_regdate() {
		return member_regdate;
	}

	/**
	 * @param member_regdate the member_regdate to set
	 */
	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Member [member_num=" + member_num + ", member_mainposition=" + member_mainposition
				+ ", member_subposition=" + member_subposition + ", member_id=" + member_id + ", member_passwd="
				+ member_passwd + ", member_name=" + member_name + ", member_profile_image=" + member_profile_image
				+ ", member_age=" + member_age + ", member_sex=" + member_sex + ", member_height=" + member_height
				+ ", member_weight=" + member_weight + ", member_foot=" + member_foot + ", member_phone=" + member_phone
				+ ", member_email=" + member_email + ", member_addr=" + member_addr + ", member_detailaddr="
				+ member_detailaddr + ", member_comment=" + member_comment + ", member_matchcount=" + member_matchcount
				+ ", member_regdate=" + member_regdate + "]";
	}

	
}
