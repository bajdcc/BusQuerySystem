package com.bajdcc.dao;

import java.sql.Connection;

import com.bajdcc.util.DBConnection;

public class CommonDao {

	protected Connection conn = DBConnection.getConnection();

	public void close() {
		DBConnection.close(conn);
	}
}