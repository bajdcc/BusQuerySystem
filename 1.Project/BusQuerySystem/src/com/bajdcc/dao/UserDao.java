package com.bajdcc.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bajdcc.model.UserModel;
import com.bajdcc.util.DBConnection;

public class UserDao extends CommonDao {

	public UserModel login(String user, String password) {
		String findSQL = "select * from account where name=? and password=?";
		PreparedStatement pstmt = null; // 声明预处理对象
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(findSQL); // 获得预处理对象并赋值
			pstmt.setString(1, user); // 设置第一个参数
			pstmt.setString(2, password);// 设置第二个参数
			rs = pstmt.executeQuery(); // 执行查询
			if (rs.next()) {
				return new UserModel(rs.getInt("id"), rs.getString("name"),
						rs.getInt("super"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(pstmt); // 关闭处理对象
		}
		return null;
	}

	public boolean register(String user, String password) {
		String findSQL = "insert into account values(?,?,?)";
		PreparedStatement pstmt = null; // 声明预处理对象
		try {
			pstmt = conn.prepareStatement(findSQL); // 获得预处理对象并赋值
			pstmt.setString(1, user); // 设置第一个参数
			pstmt.setString(2, password);// 设置第二个参数
			pstmt.setInt(3, UserModel.USER);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt); // 关闭处理对象
		}
		return false;
	}

	public List<UserModel> getUserList() {
		String findSQL = "select * from account";
		Statement stmt = null; // 声明处理对象
		List<UserModel> list = new ArrayList<>();
		ResultSet rs = null;
		try {
			stmt = conn.createStatement(); // 获得处理对象并赋值
			rs = stmt.executeQuery(findSQL); // 执行查询
			while (rs.next()) {
				list.add(new UserModel(rs.getInt("id"), rs.getString("name"),
						rs.getInt("super")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(stmt); // 关闭处理对象
		}
		return list;
	}
}
