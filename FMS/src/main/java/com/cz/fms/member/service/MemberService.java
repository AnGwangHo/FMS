package com.cz.fms.member.service;

import java.util.List;

import com.cz.fms.member.dao.Login;
import com.cz.fms.member.domain.Member;

public interface MemberService {
	
	/** 로그인처리 */
	public Member login(Login login)throws Exception;
	
	/** 맴버 추가*/
	public void memberadd(Member member) throws RuntimeException;

	/** 회원 목록 반환 */
	public List<Member> getMemberList() throws RuntimeException;

	/** 아이디를 이용하여 회원 조회 */
	public Member getMember_Id(String member_id) throws RuntimeException;

	/** 회원 정보 수정 
	 * @throws Exception */
	public void Membermodify(Member member) throws Exception;

	/** 회원 탈퇴 
	 * @throws Exception */
	public void leaveMember(int member_num) throws Exception;
	
	/** 회원 MYPAGE */
	public Member MemberMypage(String member_id) throws Exception;

	/** 아이디 찾기 */
	public Member Member_idSearch(String member_name, String member_email, String member_phone) throws RuntimeException;

	/** 비밀번호 찾기 */
	public Member pwSearch(String member_name, String member_id, String member_email, String member_phone) throws RuntimeException;
	
	/** 전체 맴버 리스트*/
	public List<Member> memberlist() throws Exception;
	
	/** 사진가져오기*/
	public List<String> getImage(int member_num) throws Exception;
	
	
}
