package com.cz.fms.member.dao;

public class Login {
	private String  member_id;
	private String  member_passwd;
	private String  member_name;
	private int 	member_num;
	private boolean	useCookie;
	
	public Login() {}

	public Login(String member_id, String member_passwd, String member_name, int member_num, boolean useCookie) {
		super();
		this.member_id = member_id;
		this.member_passwd = member_passwd;
		this.member_name = member_name;
		this.member_num = member_num;
		this.useCookie = useCookie;
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
	 * @return the useCookie
	 */
	public boolean isUseCookie() {
		return useCookie;
	}

	/**
	 * @param useCookie the useCookie to set
	 */
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Login [member_id=" + member_id + ", member_passwd=" + member_passwd + ", member_name=" + member_name
				+ ", member_num=" + member_num + ", useCookie=" + useCookie + "]";
	}
}
