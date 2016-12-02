package com.cz.fms.member.service;

import java.util.List;

import com.cz.fms.member.domain.Criteria;
import com.cz.fms.member.domain.MemberAdmin;
import com.cz.fms.member.domain.SearchCriteria;

public interface MemberAdminService {

	// 회원 수정
	public void updateMember(MemberAdmin memberAdmin) throws Exception;

	// 회원 강제 탈퇴
	public void deleteMember(Integer member_num) throws Exception;

	// 회원 상세보기
	public MemberAdmin readMember(Integer member_num) throws Exception;

	// 회원 리스트 출력
	public List<MemberAdmin> memberListAll() throws Exception;

	// 회원 리스트 ver2
	public List<MemberAdmin> memberListCriteria(Criteria cri) throws Exception;

	// 페이징 처리 cri
	public int listCountCriteria(Criteria cri) throws Exception;

	// 검색 + 페이징처리
	public List<MemberAdmin> listSearchCriteria(SearchCriteria cri) throws Exception;

	// 검색 페이징처리
	public int listSearchCount(SearchCriteria cri) throws Exception;
}
