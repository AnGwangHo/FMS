package com.cz.fms.vote.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cz.fms.member.domain.Member;

@Repository
public class VoteDaoImpl implements VoteDao {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.cz.fms.member";

	@Override
	public List<Member> votelist() throws Exception {
		return session.selectList(namespace, ".votelist");
	}
}
