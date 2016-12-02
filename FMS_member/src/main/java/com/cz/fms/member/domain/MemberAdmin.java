package com.cz.fms.member.domain;

import java.util.Date;

public class MemberAdmin {

	private Integer member_num;
	private Integer member_mainposition;
	private Integer member_subposition;
	private String member_id;
	private String member_passwd;
	private String member_name;
	private String member_profile_image;
	private Integer member_age;
	private Integer member_sex;
	private Integer member_height;
	private Integer member_weight;
	private Integer member_foot;
	private String member_phone;
	private String member_email;
	private String member_addr;
	private String member_detailaddr;
	private String member_comment;
	private Integer member_matchcount;
	private Date member_regdate;

	public MemberAdmin(Integer member_num, Integer member_mainposition, Integer member_subposition, String member_id,
			String member_passwd, String member_name, String member_profile_image, Integer member_age,
			Integer member_sex, Integer member_height, Integer member_weight, Integer member_foot, String member_phone,
			String member_email, String member_addr, String member_detailaddr, String member_comment,
			Integer member_matchcount, Date member_regdate) {
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

	public MemberAdmin() {
	}

	public Integer getMember_num() {
		return member_num;
	}

	public void setMember_num(Integer member_num) {
		this.member_num = member_num;
	}

	public Integer getMember_mainposition() {
		return member_mainposition;
	}

	public void setMember_mainposition(Integer member_mainposition) {
		this.member_mainposition = member_mainposition;
	}

	public Integer getMember_subposition() {
		return member_subposition;
	}

	public void setMember_subposition(Integer member_subposition) {
		this.member_subposition = member_subposition;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_passwd() {
		return member_passwd;
	}

	public void setMember_passwd(String member_passwd) {
		this.member_passwd = member_passwd;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_profile_image() {
		return member_profile_image;
	}

	public void setMember_profile_image(String member_profile_image) {
		this.member_profile_image = member_profile_image;
	}

	public Integer getMember_age() {
		return member_age;
	}

	public void setMember_age(Integer member_age) {
		this.member_age = member_age;
	}

	public Integer getMember_sex() {
		return member_sex;
	}

	public void setMember_sex(Integer member_sex) {
		this.member_sex = member_sex;
	}

	public Integer getMember_height() {
		return member_height;
	}

	public void setMember_height(Integer member_height) {
		this.member_height = member_height;
	}

	public Integer getMember_weight() {
		return member_weight;
	}

	public void setMember_weight(Integer member_weight) {
		this.member_weight = member_weight;
	}

	public Integer getMember_foot() {
		return member_foot;
	}

	public void setMember_foot(Integer member_foot) {
		this.member_foot = member_foot;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_addr() {
		return member_addr;
	}

	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}

	public String getMember_detailaddr() {
		return member_detailaddr;
	}

	public void setMember_detailaddr(String member_detailaddr) {
		this.member_detailaddr = member_detailaddr;
	}

	public String getMember_comment() {
		return member_comment;
	}

	public void setMember_comment(String member_comment) {
		this.member_comment = member_comment;
	}

	public Integer getMember_matchcount() {
		return member_matchcount;
	}

	public void setMember_matchcount(Integer member_matchcount) {
		this.member_matchcount = member_matchcount;
	}

	public Date getMember_regdate() {
		return member_regdate;
	}

	public void setMember_regdate(Date member_regdate) {
		this.member_regdate = member_regdate;
	}

	@Override
	public String toString() {
		return "MemberAdmin [member_num=" + member_num + ", member_mainposition=" + member_mainposition
				+ ", member_subposition=" + member_subposition + ", member_id=" + member_id + ", member_passwd="
				+ member_passwd + ", member_name=" + member_name + ", member_profile_image=" + member_profile_image
				+ ", member_age=" + member_age + ", member_sex=" + member_sex + ", member_height=" + member_height
				+ ", member_weight=" + member_weight + ", member_foot=" + member_foot + ", member_phone=" + member_phone
				+ ", member_email=" + member_email + ", member_addr=" + member_addr + ", member_detailaddr="
				+ member_detailaddr + ", member_comment=" + member_comment + ", member_matchcount=" + member_matchcount
				+ ", member_regdate=" + member_regdate + "]";
	}

}
