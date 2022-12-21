package com.smtw.qna.model.vo;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Qna {
	private int qnaNo;
	private String memberId;
	private String reviewTitle;
	private String reviewContents;
	private Date enrollDate;
	private int qnaCommentsCount;
}
