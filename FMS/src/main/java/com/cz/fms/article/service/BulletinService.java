package com.cz.fms.article.service;

import java.util.List;

import com.cz.fms.article.domain.Bulletin;
import com.cz.fms.common.web.Criteria;
import com.cz.fms.common.web.SearchCriteria;
import com.cz.fms.member.domain.Member;


public interface BulletinService {
   
   public void regist(Bulletin bulletin) throws Exception;                         // 게시글 등록
   
   public Bulletin read(int bulletin_num) throws Exception;                        // 게시글 상세
   
   public void modify(Bulletin bulletin) throws Exception;                         // 게시글 수정
   
   public void remove(int bulletin_num) throws Exception;                          // 게시글 삭제
   
   public List<Bulletin> listAll() throws Exception;                               // 게시글 전체 출력
   
   public List<Bulletin> listCriteria(Criteria cri) throws Exception;              // 게시글 페이지 전체 출력
   
   public int listCountCriteria(Criteria cri) throws Exception;                    // 페이지 수
   
   public List<Bulletin> listSearchCriteria(SearchCriteria cri) throws Exception;  // 검색 페이지 전체 출력
    
   public int listSearchCount(SearchCriteria cri) throws Exception;                // 검색 페이지 수

   public List<String> getAttach(Integer bulletin_num)throws Exception;          // 파일첨부
    
   public List<Member> getMember(Integer member_num)throws Exception;          //Member 얻어오기

   public Member getMember_id(Integer member_num)throws Exception;         //Member_name 얻어오기

}