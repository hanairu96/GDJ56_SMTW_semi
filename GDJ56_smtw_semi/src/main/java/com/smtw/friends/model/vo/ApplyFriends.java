package com.smtw.friends.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ApplyFriends {
	private int pNo;
	private String propose;
	private String memberFrom;
	private char fAdd;
	private int friendsNo;
	private Date fEnroll;
	private String nName;
}
