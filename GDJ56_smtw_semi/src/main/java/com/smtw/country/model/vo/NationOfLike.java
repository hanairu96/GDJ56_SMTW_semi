package com.smtw.country.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NationOfLike {
	private String memberId2;
	private String nName;
	private String ckLike;
	
}
