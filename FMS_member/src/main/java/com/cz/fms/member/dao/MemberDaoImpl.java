package com.cz.fms.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cz.fms.member.domain.Member;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.cz.fms.member";

	@Override
	public Member login(Login login) throws Exception {
		return session.selectOne(namespace + ".login", login);
	}
	
	/** 맴버 추가 */
	@Override
	public void memberadd(Member member) throws RuntimeException {
		session.insert(namespace+".memberadd", member);	
	}

	/** 맴버 아이디로 맴버 찾기 */
	@Override
	public Member getmember_id(String member_id) throws RuntimeException {
		return (Member) session.selectOne(namespace+".getmember_id", member_id);
	}
	
	/** 맴버 수정 */
	@Override
	public void Membermodify(Member member) throws Exception {
		session.update(namespace + ".Membermodify", member);	
	}
	
	/** 맴버 탈퇴 */
	@Override
	public void leaveMember(int member_num) throws Exception {
		session.delete(namespace + ".leaveMember", member_num);		
	}

	@Override
	public Member MemberMypage(String member_id) throws Exception {
		return session.selectOne(namespace + ".MemberMypage", member_id);
	}

	@Override
	public List<Member> memberlist() throws Exception {
		return session.selectList(namespace + ".memberlist");
	}
	
/*
	@Override
	public Member readWithPW(String userid, String userpw) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("userid", userid);
		paramMap.put("userpw", userpw);
		
		return sqlSession.selectOne(namespace+".readWithPW", paramMap);
	}
*/
}
