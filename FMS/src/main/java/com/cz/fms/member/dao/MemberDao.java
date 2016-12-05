package com.cz.fms.member.dao;

import java.util.List;

import com.cz.fms.member.domain.Member;

/**
 * 맴버 회원가입, 수정, 탈퇴, 아이디로 조회, 로그인등의 기본 처리 DAO.
 * @author 임영묵
 *
 */
public interface MemberDao {
	
	/** 로그인처리 */
	public Member login(Login login)throws Exception;
	
	/** 맴버 추가*/
	public void memberadd(Member member) throws RuntimeException;
	
	/** 아이디를 이용하여 사용자 조회 */
	public Member getmember_id(String member_id) throws RuntimeException;
	
	/** 멤버 수정 */
	public void Membermodify(Member member) throws Exception;

	/** 멤버 탈퇴 */
	public void leaveMember(int member_num) throws Exception;
	
	/** 맴버 MYPAGE */
	public Member MemberMypage(String member_id) throws Exception;
	
	/** 전체 맴버 리스트*/
	public List<Member> memberlist() throws Exception;
	
	/** 사진가져오기*/
	public List<String> getImage(int member_num) throws Exception;
		
}
