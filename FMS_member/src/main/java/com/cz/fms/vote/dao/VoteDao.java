package com.cz.fms.vote.dao;

import java.util.List;

import com.cz.fms.member.domain.Member;

/**
 * 맴버 회원가입, 수정, 탈퇴, 아이디로 조회, 로그인등의 기본 처리 DAO.
 * @author 임영묵
 *
 */
public interface VoteDao {
	
	/** 전체 맴버 리스트*/
	public List<Member> votelist() throws Exception;
	
}
