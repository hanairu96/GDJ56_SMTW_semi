package com.smtw.mypage.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder

public class MemberInfo2 {
	
	private String memberId;
	private String memberName;
	private String age;
	private char gender;

}
