package com.bajdcc.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MsgModel {

	private static final SimpleDateFormat sdf = new SimpleDateFormat(
			"MM/dd/yyyy HH:mm:ss");

	private String name;
	private String title;
	private String content;
	private String time;
	private String ip;

	public MsgModel(String name, String title, String content, long time,
			String ip) {
		this.name = name;
		this.title = title;
		this.content = content;
		this.time = sdf.format(new Date(time));
		this.ip = ip;
	}

	public String getName() {
		return name;
	}

	public String getTitle() {
		return title;
	}

	public String getContent() {
		return content;
	}

	public String getTime() {
		return time;
	}

	public String getIp() {
		return ip;
	}
}
