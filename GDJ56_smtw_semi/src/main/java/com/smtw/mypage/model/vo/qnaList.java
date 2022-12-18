package com.smtw.mypage.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder

public class qnaList {
	
	private String type;
	private int qnaNo;
	private String title;
	private Date date;

}