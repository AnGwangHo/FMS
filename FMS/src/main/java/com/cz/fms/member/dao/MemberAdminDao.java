package com.cz.fms.member.dao;

import java.util.List;

import com.cz.fms.member.domain.Criteria;
import com.cz.fms.member.domain.MemberAdmin;
import com.cz.fms.member.domain.SearchCriteriaMember;

public interface MemberAdminDao {

	// 멤버 수정
	public void updateMember(MemberAdmin ma) throws Exception;

	// 멤버 탈퇴
	public void deleteMember(Integer member_num) throws Exception;

	// 상세 보기
	public MemberAdmin readMember(Integer member_num) throws Exception;

	// 전체 멤버 리스트 출력
	public List<MemberAdmin> memberlistAll() throws Exception;

	// 전체 멤버 페이징처리 리스트 출력
	public List<MemberAdmin> memberlistPage(int page) throws Exception;

	// 페이징처리 ver2
	public List<MemberAdmin> memberlistCriteria(Criteria cri) throws Exception;

	// 페이징 처리를 위한 cri
	public int countPaging(Criteria cri) throws Exception;
	
	// 페이징 처리 검색
	public List<MemberAdmin> memberlistSearch(SearchCriteriaMember cri)throws Exception;
	
	// 페이징 처리 검색 카운트
	public int listSearchCount(SearchCriteriaMember cri)throws Exception;
}
