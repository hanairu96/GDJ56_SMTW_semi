package com.smtw.mypage.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class ReviewList {

	private String type;
	private int reviewNo;
	private String title;
	private Date date;
	
}
