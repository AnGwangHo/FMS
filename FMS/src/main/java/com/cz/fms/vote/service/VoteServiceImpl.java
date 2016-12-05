package com.cz.fms.vote.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.cz.fms.member.dao.MemberDao;
import com.cz.fms.member.domain.Member;

@Repository
public class VoteServiceImpl implements VoteService {
	
	@Inject
	private MemberDao dao;
	
	/** 투표 리스트*/
	@Override
	public List<Member> votelist() throws Exception {
		return dao.memberlist();
	}
}
