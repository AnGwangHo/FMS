/**
 *  게시글 Dao Interface
 */
package com.cz.fms.article.dao;

import java.util.List;

import com.cz.fms.common.web.Criteria;
import com.cz.fms.common.web.SearchCriteria;
import com.cz.fms.member.domain.Member;
import com.cz.fms.article.domain.Bulletin;

public interface BulletinDao {

   public void create(Bulletin bulletin) throws Exception;                         //게시글 생성
   
   public Bulletin read(int bulletin_num) throws Exception;                       //게시글 상세
   
   public void update(Bulletin bulletin) throws Exception;                        //게시글 수정
   
   public void delete(int bulletin_num) throws Exception;                             //게시글 삭제
   
   public List<Bulletin> listAll() throws Exception;                               //게시글 전체출력
   
   public List<Bulletin> listPage(int page) throws Exception;                        //게시글 페이지 리스트 출력
   
   public List<Bulletin> listCriteria(Criteria cri) throws Exception;                 //게시글 페이지 처리( Criteria )
    
   public int countPaging (Criteria cri) throws Exception;                           //페이지 수
   
   public List<Bulletin> listSearch(SearchCriteria cri) throws Exception;             //검색 게시글 페이지 처리 ( SearchCriteria )
   
   public int listSearchCount(SearchCriteria cri) throws Exception;                   //검색 게시글 수
   
   public void updateReplycount(int bulletin_num, int amount) throws Exception;       //댓글수 
   
   public void updateViewCount(int bulletin_num) throws Exception;                   //게시글 View Count 증가
   
   public void addAttach(String bulletin_attachment) throws Exception;               // 파일 업로드
   
   public List<String> getAttach(Integer bulletin_num)throws Exception;               // 파일 다운로드
   
   public List<Member> getMember(Integer member_num)throws Exception;         // Member 얻어오기
   
   public Member getMember_id(Integer member_num)throws Exception;         //Member_ID 얻어오기
}