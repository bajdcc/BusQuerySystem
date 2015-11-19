package com.bajdcc.bean;

import java.io.Serializable;
import java.util.List;

public class BusSpotBean implements Serializable {

	private static final long serialVersionUID = 1L;

	private String name;
	private List<String> line;

	public BusSpotBean() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getLine() {
		return line;
	}

	public void setLine(List<String> line) {
		this.line = line;
	}
}
