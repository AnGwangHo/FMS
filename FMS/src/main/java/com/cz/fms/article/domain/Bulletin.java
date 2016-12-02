/**
 *  게시글 domain 
 */

package com.cz.fms.article.domain;

import java.sql.Date;

public class Bulletin {
	
	private int bulletin_num;                    //게시글 고유번호
	private int bulletintype_num;              //게시글 타입번호 ( 1: 공지사항 , 2: 자유게시글 )
	private int member_num;                  //회원 고유번호
	private String bulletin_title;                 //게시글 제목
	private String bulletin_content;           //게시글 본문
	private Date bulletin_date;                 //게시글 날짜
	private String bulletin_attachment;      //게시글 첨부파일
 	private int bulletin_hitcount;               //게시글 조회수
 	private int bulletin_commentcount;     //게시글 댓글 수
 	private int reply_count;					   //댓글 수
	
 	public Bulletin() {
		super();
	}
 	
	

	public Bulletin(int bulletin_num, int bulletintype_num, int member_num, String bulletin_title,
			String bulletin_content, Date bulletin_date, String bulletin_attachment, int bulletin_hitcount,
			int bulletin_commentcount) {
		super();
		this.bulletin_num = bulletin_num;
		this.bulletintype_num = bulletintype_num;
		this.member_num = member_num;
		this.bulletin_title = bulletin_title;
		this.bulletin_content = bulletin_content;
		this.bulletin_date = bulletin_date;
		this.bulletin_attachment = bulletin_attachment;
		this.bulletin_hitcount = bulletin_hitcount;
		this.bulletin_commentcount = bulletin_commentcount;
	}

	public int getBulletin_num() {
		return bulletin_num;
	}

	public void setBulletin_num(int bulletin_num) {
		this.bulletin_num = bulletin_num;
	}

	public int getBulletintype_num() {
		return bulletintype_num;
	}

	public void setBulletintype_num(int bulletintype_num) {
		this.bulletintype_num = bulletintype_num;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getBulletin_title() {
		return bulletin_title;
	}

	public void setBulletin_title(String bulletin_title) {
		this.bulletin_title = bulletin_title;
	}

	public String getBulletin_content() {
		return bulletin_content;
	}

	public void setBulletin_content(String bulletin_content) {
		this.bulletin_content = bulletin_content;
	}

	public Date getBulletin_date() {
		return bulletin_date;
	}

	public void setBulletin_date(Date bulletin_date) {
		this.bulletin_date = bulletin_date;
	}

	public String getBulletin_attachment() {
		return bulletin_attachment;
	}

	public void setBulletin_attachment(String bulletin_attachment) {
		this.bulletin_attachment = bulletin_attachment;
	}

	public int getBulletin_hitcount() {
		return bulletin_hitcount;
	}

	public void setBulletin_hitcount(int bulletin_hitcount) {
		this.bulletin_hitcount = bulletin_hitcount;
	}

	public int getBulletin_commentcount() {
		return bulletin_commentcount;
	}

	public void setBulletin_commentcount(int bulletin_commentcount) {
		this.bulletin_commentcount = bulletin_commentcount;
	}
	public int getReply_count() {
		return reply_count;
	}

	public void setReply_count(int reply_count) {
		this.reply_count = reply_count;
	}



	@Override
	public String toString() {
		return "Bulletin [bulletin_num=" + bulletin_num + ", bulletintype_num=" + bulletintype_num + ", member_num="
				+ member_num + ", bulletin_title=" + bulletin_title + ", bulletin_content=" + bulletin_content
				+ ", bulletin_date=" + bulletin_date + ", bulletin_attachment=" + bulletin_attachment
				+ ", bulletin_hitcount=" + bulletin_hitcount + ", bulletin_commentcount=" + bulletin_commentcount
				+ ", reply_count=" + reply_count + "]";
	}

	
	
	
}
