package com.cz.fms.vote.domain;

public class Vote {
	private int vote_num;
	private int member_num;
	private int	tactics_num;
	private int vote_month;
	private int vote_half;
	private int vote_count;
	
	public Vote() {}

	public Vote(int vote_num, int member_num, int tactics_num, int vote_month, int vote_half, int vote_count) {
		super();
		this.vote_num = vote_num;
		this.member_num = member_num;
		this.tactics_num = tactics_num;
		this.vote_month = vote_month;
		this.vote_half = vote_half;
		this.vote_count = vote_count;
	}

	/**
	 * @return the vote_num
	 */
	public int getVote_num() {
		return vote_num;
	}

	/**
	 * @param vote_num the vote_num to set
	 */
	public void setVote_num(int vote_num) {
		this.vote_num = vote_num;
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
	 * @return the tactics_num
	 */
	public int getTactics_num() {
		return tactics_num;
	}

	/**
	 * @param tactics_num the tactics_num to set
	 */
	public void setTactics_num(int tactics_num) {
		this.tactics_num = tactics_num;
	}

	/**
	 * @return the vote_month
	 */
	public int getVote_month() {
		return vote_month;
	}

	/**
	 * @param vote_month the vote_month to set
	 */
	public void setVote_month(int vote_month) {
		this.vote_month = vote_month;
	}

	/**
	 * @return the vote_half
	 */
	public int getVote_half() {
		return vote_half;
	}

	/**
	 * @param vote_half the vote_half to set
	 */
	public void setVote_half(int vote_half) {
		this.vote_half = vote_half;
	}

	/**
	 * @return the vote_count
	 */
	public int getVote_count() {
		return vote_count;
	}

	/**
	 * @param vote_count the vote_count to set
	 */
	public void setVote_count(int vote_count) {
		this.vote_count = vote_count;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Vote [vote_num=" + vote_num + ", member_num=" + member_num + ", tactics_num=" + tactics_num
				+ ", vote_month=" + vote_month + ", vote_half=" + vote_half + ", vote_count=" + vote_count + "]";
	}
}
