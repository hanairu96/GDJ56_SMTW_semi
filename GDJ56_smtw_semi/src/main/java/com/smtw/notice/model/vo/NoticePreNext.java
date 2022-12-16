package com.smtw.notice.model.vo;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class NoticePreNext {
	private int noticeNo;
	private int preNo;
	private String preTitle;
	private String preContents;
	private int nextNo;
	private String nextTitle;
	private String nextContents;
}
