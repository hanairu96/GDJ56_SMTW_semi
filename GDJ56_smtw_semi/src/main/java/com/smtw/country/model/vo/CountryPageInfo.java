package com.smtw.country.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CountryPageInfo {
	private String nName;
	private String coInfoSimple;
	private String cLanguage;
	private String urban;
	private String money;
	private String elect;
	private String mapAddress;
	private String englishName;
	private String clock;
	private String cPic;
}
