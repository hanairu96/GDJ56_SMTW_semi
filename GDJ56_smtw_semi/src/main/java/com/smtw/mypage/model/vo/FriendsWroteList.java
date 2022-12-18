package com.smtw.mypage.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;


@Builder
@Data

public class FriendsWroteList {

		private String type;
		private int friendsNo;
		private String title;
		private Date date;
		
}

