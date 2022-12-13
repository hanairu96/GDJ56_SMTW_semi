package com.smtw.review.model.vo;

import java.sql.Date;



import lombok.Builder;
import lombok.Data;

@Data
@Builder

public class ReviewComments {
	private int rcNo;
	private String rcContents;
	private Date enrollDate;
	private int reviewNo2;
	private String memberId;
	private String nName;
	
	
	
	
	
	
	
}
