package com.smtw.qna.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Faq {
	private int faqNo;
	private String faqTitle;
	private String faqContents;
}
