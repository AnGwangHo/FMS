package com.cz.fms.member.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cz.fms.member.dao.MemberAdminDao;
import com.cz.fms.member.domain.Criteria;
import com.cz.fms.member.domain.MemberAdmin;
import com.cz.fms.member.domain.SearchCriteria;

@Service
public class MemberAdminServiceImpl implements MemberAdminService {

	@Inject
	private MemberAdminDao dao;

	//회원정보 수정
	@Override
	public void updateMember(MemberAdmin memberAdmin) throws Exception {
		dao.updateMember(memberAdmin);
	}

	//회원 강제 탈퇴
	@Override
	public void deleteMember(Integer member_num) throws Exception {
		dao.deleteMember(member_num);
	}
	
	//회원 상세보기
	@Override
	public MemberAdmin readMember(Integer member_num) throws Exception {
		return dao.readMember(member_num);
	}
	
	//회원전체 출력
	@Override
	public List<MemberAdmin> memberListAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.memberlistAll();
	}

	@Override
	public List<MemberAdmin> memberListCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberlistCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return dao.countPaging(cri);
	}

	// 검색 + 페이징처리
	@Override
	public List<MemberAdmin> listSearchCriteria(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.memberlistSearch(cri);
	}

	// 검색 + 페이징처리
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearchCount(cri);
	}

}
