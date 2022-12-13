package com.smtw.country.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CountryPage {
	private String nName;
	private String nInfo;
	private String nVisa;
	private String nSafety;
	private String nSettle;
	private String nJob;
}
