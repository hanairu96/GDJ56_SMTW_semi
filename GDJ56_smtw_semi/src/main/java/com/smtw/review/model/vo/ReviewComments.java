package com.smtw.review.model.vo;

import java.sql.Date;



import lombok.Builder;
import lombok.Data;

@Data
@Builder

public class ReviewComments {
	private int rcNo;  // 댓글 자제  번호
	private int reviewCommentLevel;   //    레벨
	private int reviewCommentRef;    // 그댓글의 번호 참조
	private String rcContents;   //작성내용//
	private Date enrollDate;   // 작성일
	private int reviewNo2;   //  게시글 번호
	private String memberId;  // 작성자
	//private String nName;   // 나라이름? 일단 넣어
	private int qcCount;    // 무엇?
	
	
	
	
	
	
	
	
}
