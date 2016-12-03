/**
 *  댓글 domain
 */
package com.cz.fms.article.domain;

import java.sql.Date;

public class Reply {
		
		private int reply_num;              //댓글 고유번호
		private int bulletin_num;           //게시글 고유번호
		private int member_num;         //댓글 단 사람
		private String reply_content;     //댓글 내용
		private Date reply_date;           //댓글 날짜
		
		public Reply() {
			super();
		}

		public Reply(int reply_num, int bulletin_num, int member_num, String reply_content, Date reply_date) {
			super();
			this.reply_num = reply_num;
			this.bulletin_num = bulletin_num;
			this.member_num = member_num;
			this.reply_content = reply_content;
			this.reply_date = reply_date;
		}

		public int getReply_num() {
			return reply_num;
		}

		public void setReply_num(int reply_num) {
			this.reply_num = reply_num;
		}

		public int getBulletin_num() {
			return bulletin_num;
		}

		public void setBulletin_num(int bulletin_num) {
			this.bulletin_num = bulletin_num;
		}

		public int getMember_num() {
			return member_num;
		}

		public void setMember_num(int member_num) {
			this.member_num = member_num;
		}

		public String getReply_content() {
			return reply_content;
		}

		public void setReply_content(String reply_content) {
			this.reply_content = reply_content;
		}

		public Date getReply_date() {
			return reply_date;
		}

		public void setReply_date(Date reply_date) {
			this.reply_date = reply_date;
		}

		@Override
		public String toString() {
			return "Reply [reply_num=" + reply_num + ", bulletin_num=" + bulletin_num + ", member_num=" + member_num
					+ ", reply_content=" + reply_content + ", reply_date=" + reply_date + "]";
		}
		
		
		
		
}
