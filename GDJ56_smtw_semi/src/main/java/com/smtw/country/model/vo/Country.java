package com.smtw.country.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Country {
	private String nName;
	private String nLanguage;
	private String nTend;
	private String nPlace;
	private String nSeason;
	private String nImg;
	private String npharse;
	private String emergency;
	private CountryPageInfo info;
	
	
}
