package com.cz.fms.vote.service;

import java.util.List;

import com.cz.fms.member.domain.Member;

public interface VoteService {
	
	/** 전체 맴버 리스트*/
	public List<Member> votelist() throws Exception;
}
