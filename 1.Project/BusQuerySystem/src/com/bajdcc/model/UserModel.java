package com.bajdcc.model;

public class UserModel {

	private int id;
	private String name;
	private int level;
	
	public static final int ADMIN = 1;
	public static final int USER = 2;
	
	public UserModel(int id, String name, int level) {
		this.id = id;
		this.name = name;
		this.level = level;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public boolean isUser() {
		return level == USER;
	}
	
	public boolean isAdmin() {
		return level == ADMIN;
	}
	
	public String getLevelString() {
		switch (level) {
		case USER:
			return "普通用户";
		case ADMIN:
			return "管理员";
		default:
			return "Error";
		}
	}
}
