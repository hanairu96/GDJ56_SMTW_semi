package com.smtw.mypage.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder

public class Note {
	
	private int ntNo;
	private String memberId;
	private String content;
	private Date date;
	private String sender;
	private String senderName;

}
