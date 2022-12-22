package com.smtw.mypage.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder

public class WroteList {

	private int pkNo;
	private String title;
	private Date date;
	
}
