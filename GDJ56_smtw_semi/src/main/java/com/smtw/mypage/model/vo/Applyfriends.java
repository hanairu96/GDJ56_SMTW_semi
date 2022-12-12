package com.smtw.mypage.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder


public class Applyfriends {

	private String propose;
	private String memberId;
	private Date fEnroll;
	
}
