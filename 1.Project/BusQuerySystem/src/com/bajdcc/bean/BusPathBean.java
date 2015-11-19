package com.bajdcc.bean;

import java.io.Serializable;
import java.util.List;

import com.bajdcc.util.JsonHelper;

public class BusPathBean<LineType, SpotType> implements Serializable {

	private static final long serialVersionUID = 1L;

	private SpotType begin;
	private SpotType end;
	private List<LineType> line;

	public BusPathBean() {

	}

	public SpotType getBegin() {
		return begin;
	}

	public void setBegin(SpotType begin) {
		this.begin = begin;
	}

	public SpotType getEnd() {
		return end;
	}

	public void setEnd(SpotType end) {
		this.end = end;
	}

	public List<LineType> getLine() {
		return line;
	}

	public void setLine(List<LineType> line) {
		this.line = line;
	}

	@Override
	public String toString() {
		return JsonHelper.toJSON(this).toString();
	}
}
