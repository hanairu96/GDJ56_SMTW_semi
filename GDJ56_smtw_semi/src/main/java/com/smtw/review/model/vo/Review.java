package com.smtw.review.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder

public class Review {
	private int reviewNo;
	private String memberId;
	private String nationName;
	private String reviewTitle;
	private String reviewContnet;
	private Date enrollDate;
	private String reviewCity;
	private int reviewSat;
	
	
}
