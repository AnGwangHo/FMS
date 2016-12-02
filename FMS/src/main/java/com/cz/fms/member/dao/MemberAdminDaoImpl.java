package com.cz.fms.member.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cz.fms.member.domain.Criteria;
import com.cz.fms.member.domain.MemberAdmin;
import com.cz.fms.member.domain.SearchCriteria;

@Repository
public class MemberAdminDaoImpl implements MemberAdminDao {

	@Inject
	private SqlSession session;

	private static String namespace = "com.cz.fms.member";

	// 회원 정보 수정
	@Override
	public void updateMember(MemberAdmin ma) throws Exception {
		session.update(namespace + ".updateMember", ma);
	}

	// 회원 강제 탈퇴
	@Override
	public void deleteMember(Integer member_num) throws Exception {
		session.delete(namespace + ".deleteMember", member_num);
	}

	// 회원 상세정보
	@Override
	public MemberAdmin readMember(Integer member_num) throws Exception {
		return session.selectOne(namespace + ".readMember", member_num);
	}

	// 회원 전체리스트 출력
	@Override
	public List<MemberAdmin> memberlistAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".memberlistAll");
	}

	@Override
	public List<MemberAdmin> memberlistPage(int page) throws Exception {

		if (page < 0) {
			page = 1;
		}
		page = (page - 1) * 10;
		return session.selectList(namespace + ".memberlistPage", page);
	}

	@Override
	public List<MemberAdmin> memberlistCriteria(Criteria cri) throws Exception {

		return session.selectList(namespace + ".memberlistCriteria", cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".countPaging", cri);
	}

	// 검색 + 페이징 처리
	@Override
	public List<MemberAdmin> memberlistSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listSearch", cri);
	}

	// 검색 + 페이징 처리
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".listSearchCount", cri);
	}
}
