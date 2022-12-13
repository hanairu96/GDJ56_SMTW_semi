package com.smtw.diary.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor //매개변수있는생성자
@NoArgsConstructor  //기본생성자
public class CheckList {
	private String memberId; //회원아이디
	private char passport; //여권
	private char doller; //환전
	private char resume; //이력서
	private char sim; //유심칩
	private char surplus; //증명사진여분
	private char insurance; //여행자보혐
	private char hCheckup; //건강검진
	private char vCertificate; //비자증명서
	private char ticket; //비행기티켓
	private char multitab; //멀티탭
	private char em; //비상약
	private char roaming; //핸드폰해지 및 보험
	private char aCertificate; //공인인증서갱신
	private char certificate; //각종증명서
	private char reservation; //숙소예약
	private char iLicense; //국제면허증
	private char creditCard; //해외사용가능카드개서
	private char eContact; //비상연락망
	private char clothing; //의류
	private char dailyNecessity; //생필품
}
