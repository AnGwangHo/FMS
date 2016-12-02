package com.cz.fms.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.cz.fms.member.dao.Login;
import com.cz.fms.member.dao.MemberDao;
import com.cz.fms.member.domain.Member;

@Repository
public class MemberServiceImpl implements MemberService {
	
	@Inject
	private MemberDao dao;
	
	/** 로그인*/
	@Override
	public Member login(Login login) throws Exception {
		return dao.login(login);
	}
	/** 회원가입*/
	@Override
	public void memberadd(Member member) throws RuntimeException {
		dao.memberadd(member);
	}
	
	/** 맴버 수정*/
	@Override
	public void Membermodify(Member member) throws Exception {
		dao.Membermodify(member);
	}
	/** 맴버 탈퇴*/
	@Override
	public void leaveMember(int member_num) throws Exception {
		dao.leaveMember(member_num);	
	}
	

	@Override
	public List<Member> getMemberList() throws RuntimeException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member getMember_Id(String member_id) throws RuntimeException {
		return dao.getmember_id(member_id);
	}
	
	@Override
	public Member Member_idSearch(String member_name, String member_email, String member_phone)
			throws RuntimeException {
		return null;
	}

	@Override
	public Member pwSearch(String Member_name, String member_id, String member_email, String member_phone)
			throws RuntimeException {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Member MemberMypage(String member_id) throws Exception {
		return dao.MemberMypage(member_id);
	}
	@Override
	public List<Member> memberlist() throws Exception {
		return dao.memberlist();
	}
}
