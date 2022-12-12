package com.smtw.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@Builder
@NoArgsConstructor
public class Member {
	private String userId;
	private String password;
	private String userName;
	private String email;
	private String phone;
	private String birth;
	private char gender;
	private String address;
	private String myImg;
	private char emailAgree;
}
