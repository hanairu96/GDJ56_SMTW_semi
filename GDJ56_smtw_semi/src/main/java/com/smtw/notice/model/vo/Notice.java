package com.smtw.notice.model.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Notice {
	private int noticeNo;
	private String memberId;
	private String noticeTitle;
	private String noticeContents;
	private Date noticeEnrollDate;
	private String fileName;
}
