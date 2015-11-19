package com.bajdcc.dao;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bajdcc.bean.MsgBean;
import com.bajdcc.model.MsgModel;
import com.bajdcc.util.DBConnection;

public class MsgDao extends CommonDao {

	public List<MsgModel> getMsgList() {
		String findSQL = "select msg.title,msg.body,msg.time,msg.ip,account.name from msg,account where uid=account.id";
		Statement stmt = null;
		ResultSet rs = null;
		List<MsgModel> list = new ArrayList<MsgModel>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(findSQL); // 执行查询
			while (rs.next()) {
				list.add(new MsgModel(rs.getString("name"), rs
						.getString("title"), rs.getString("body"), rs
						.getTimestamp("time").getTime(), rs.getString("ip")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(stmt); // 关闭处理对象
		}
		return list;
	}

	public void addMsg(MsgBean msg) {
		String insertSQL = "insert into msg values(?,?,?,?,default)";
		PreparedStatement pstmt = null; // 声明预处理对象
		try {
			pstmt = conn.prepareStatement(insertSQL); // 获得预处理对象并赋值
			pstmt.setInt(1, msg.getId());
			pstmt.setString(2, msg.getIp());
			pstmt.setString(3, msg.getTitle());
			pstmt.setString(4, msg.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt); // 关闭处理对象
			close();
		}
	}
}
