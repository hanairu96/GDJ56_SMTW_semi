package com.smtw.country.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Likenation {
	private String memId;
	private String nName;
	private String ckLike;
	
}
