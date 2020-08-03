package org.toy.web.job.model;

import lombok.Data;

@Data
public class JobVO {

	private String jid;
	
	private String title; 
	private String closeDt;
	private String location;
	private String company;
	private String employStatus;
	private String creator;
	private String createDt;
	
	private long volunteer;
	private String groupContent;
	private String businessContent;
	private String supportContent;
	private String mustContent;
	private String workContent;
	
}
