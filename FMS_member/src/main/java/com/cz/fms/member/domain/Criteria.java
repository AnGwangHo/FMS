package com.cz.fms.member.domain;

public class Criteria {

	private int page;
	private int perPageNum;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 5;
	}

	public void setPage(int page) {
		if (page <= 0) {
			this.page = page;
			return;
		}
		this.page = page;
	}

	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 5;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}

	// method for Mybatis SQL Mapper
	public int getPageStart() {
		return page; // 갓규가 여기 바꿈
	}

	public int getPerPageNum() {
		return this.perPageNum;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
