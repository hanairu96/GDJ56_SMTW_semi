package com.smtw.mycountry.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor //매개변수있는생성자
@NoArgsConstructor  //기본생성자
public class MyCountry {
	private String nName;
	private String nLanguage;
	private String nTend;
	private String nPlace;
	private String nSeason;
	private String nImg;
	private String nPharse;
}
