package com.bajdcc.bean;

import java.io.Serializable;
import java.util.List;

public class BusP2PBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private String begin;
	private String end;
	private List<String> direct;
	private List<BusPathBean<String, String>> path;

	public BusP2PBean() {

	}

	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public List<String> getDirect() {
		return direct;
	}

	public void setDirect(List<String> direct) {
		this.direct = direct;
	}

	public List<BusPathBean<String, String>> getPath() {
		return path;
	}

	public void setPath(List<BusPathBean<String, String>> path) {
		this.path = path;
	}
}
