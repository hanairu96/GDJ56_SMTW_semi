package com.smtw.qna.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class QnaComments {
	private int qnaCoNo;
	private int qnaCoLevel;
	private String qnaCoRef;
	private String qcContents;
	private Date enrollDate;
	private int qnaNo2;
	private String memberId;
}
