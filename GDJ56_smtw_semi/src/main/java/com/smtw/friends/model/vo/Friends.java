package com.smtw.friends.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Friends {
	private int friendsNo;
	private String nName;
	private String friendsTitle;
	private String friendsContents;
	private Date enrollDate;
	private String memberId;
	private String mbti;
	private String type;
	private String introduce;
	private char filed;
	private String purpose;
}
