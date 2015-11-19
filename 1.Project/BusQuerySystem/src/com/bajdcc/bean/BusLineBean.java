package com.bajdcc.bean;

import java.io.Serializable;
import java.util.List;

public class BusLineBean implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String name;
	private String price;
	private String start;
	private String end;
	private List<String> route;

	public BusLineBean() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getStart() {
		return start;
	}

	public void setStart(String start) {
		this.start = start;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public List<String> getRoute() {
		return route;
	}

	public void setRoute(List<String> route) {
		this.route = route;
	}
}
