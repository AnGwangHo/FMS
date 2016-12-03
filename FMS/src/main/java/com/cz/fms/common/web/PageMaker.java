/**
 *  페이지 처리용 클래스
 */
package com.cz.fms.common.web;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {
	
	private int totalCount;                     // SQL 결과로 나온 데이터의 전체 개수
	private int startPage;                      // 시작 페이지 번호
	private int endPage;                       // 끝 페이지 번호
	private boolean prev;                     // 이전 페이지 링크
	private boolean next;                     // 이후 페이지 링크
	
	private int displayPageNum = 10;
	
	private Criteria cri;
	
	public void setCri(Criteria cri){
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount){
		this.totalCount = totalCount;
		
		calcData();
	}
	
	private void calcData() {

	    endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

	    startPage = (endPage - displayPageNum) + 1;

	    int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

	    if (endPage > tempEndPage) {
	      endPage = tempEndPage;
	    }

	    prev = startPage == 1 ? false : true;

	    next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

	  }
	
	public int getTotalCount() {
	    return totalCount;
	  }

	  public int getStartPage() {
	    return startPage;
	  }

	  public int getEndPage() {
	    return endPage;
	  }

	  public boolean isPrev() {
	    return prev;
	  }

	  public boolean isNext() {
	    return next;
	  }

	  public int getDisplayPageNum() {
	    return displayPageNum;
	  }

	  public Criteria getCri() {
	    return cri;
	  }

	  public String makeQuery(int page) {

	    UriComponents uriComponents = 
	    		UriComponentsBuilder.newInstance()
	    		.queryParam("page", page)
	    		.queryParam("perPageNum", cri.getPerPageNum())
	    		.build();

	    return uriComponents.toUriString();
	  }
	  
	  //UriComponents 이용 페이지 처리 필요한 데이터 생성
	   public String makeSearch(int page){
	    
	    UriComponents uriComponents = 
	    		UriComponentsBuilder.newInstance()
	    		.queryParam("page", page)
	    		.queryParam("perPageNum", cri.getPerPageNum())
	    		.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
	    		.queryParam("keyword", ((SearchCriteria)cri).getKeyword())
	    		.build();             
	    
	    return uriComponents.toUriString();
	  }

	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + ", displayPageNum=" + displayPageNum + ", cri=" + cri + "]";
	} 
	   
	   
	  
}
