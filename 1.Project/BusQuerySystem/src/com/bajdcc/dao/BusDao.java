package com.bajdcc.dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;

import com.bajdcc.bean.BusLineBean;
import com.bajdcc.bean.BusP2PBean;
import com.bajdcc.bean.BusSpotBean;
import com.bajdcc.model.BusLineModel;
import com.bajdcc.util.BusLineGraph;
import com.bajdcc.util.DBConnection;

public class BusDao extends CommonDao {

	private static final String splitter = "->";
	private static final DateFormat sdf = new SimpleDateFormat(
			"yyyy/MM/dd HH:mm");

	public Object getBusList() {
		String findSQL = "select * from bus order by id asc";
		Statement stmt = null; // 声明预处理对象
		ResultSet rs = null;
		List<BusLineModel> list = new ArrayList<>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(findSQL); // 执行查询
			while (rs.next()) {
				BusLineModel model = new BusLineModel();
				model.setName(rs.getString("name"));
				String route = rs.getString("route");
				List<String> rts = new ArrayList<>();
				StringTokenizer st = new StringTokenizer(route, splitter);
				while (st.hasMoreTokens()) {
					rts.add(st.nextToken());
				}
				if (!rts.isEmpty()) {
					String start = rts.get(0);
					String end = rts.get(rts.size() - 1);
					if (start.equals(end)) {
						model.setRoute(String.format("[%d站][环行] %s => %s",
								rts.size(), start, rts.get(rts.size() / 2)));
					} else {
						model.setRoute(String.format("[%d站] %s => %s",
								rts.size(), start, end));
					}
				}
				model.setPrice(rs.getBigDecimal("price").toPlainString());
				model.setStart(rs.getString("start_time"));
				model.setEnd(rs.getString("end_time"));
				model.setTime(sdf.format(rs.getTimestamp("update_time")));
				list.add(model);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(stmt); // 关闭处理对象
		}
		return list;
	}

	public Object getBusLine(String term) {
		String findSQL = "select name from bus where name like ? order by id asc";
		PreparedStatement stmt = null; // 声明预处理对象
		ResultSet rs = null;
		List<Map<String, String>> list = new ArrayList<>();
		try {
			stmt = conn.prepareStatement(findSQL);
			stmt.setString(1, "%" + term + "%");
			rs = stmt.executeQuery(); // 执行查询
			while (rs.next()) {
				Map<String, String> map = new HashMap<>();
				String value = rs.getString(1);
				map.put("label", value);
				map.put("value", value);
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(stmt); // 关闭处理对象
		}
		return list;
	}

	public Object getBusSpot(String term) {
		String findSQL = "select route from bus";
		Statement stmt = null;
		ResultSet rs = null;
		Set<Map<String, String>> set = new HashSet<Map<String, String>>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(findSQL); // 执行查询
			while (rs.next()) {
				StringTokenizer st = new StringTokenizer(rs.getString(1),
						splitter);
				while (st.hasMoreTokens()) {
					Map<String, String> map = new HashMap<>();
					String value = st.nextToken();
					if (value.contains(term)) {
						map.put("label", value);
						map.put("value", value);
						set.add(map);
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(stmt); // 关闭处理对象
		}
		return new ArrayList<Map<String, String>>(set);
	}

	public BusLineBean getBusLineBean(String name) {
		String findSQL = "select * from bus where name=?";
		PreparedStatement stmt = null; // 声明预处理对象
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(findSQL); // 获得预处理对象并赋值
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			BusLineBean bean = new BusLineBean();
			if (rs.next()) {
				bean.setName(rs.getString("name"));
				String route = rs.getString("route");
				List<String> rts = new ArrayList<>();
				StringTokenizer st = new StringTokenizer(route, splitter);
				while (st.hasMoreTokens()) {
					rts.add(st.nextToken());
				}
				bean.setRoute(rts);
				bean.setPrice(rs.getBigDecimal("price").toPlainString());
				bean.setStart(rs.getString("start_time"));
				bean.setEnd(rs.getString("end_time"));
				return bean;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(stmt); // 关闭处理对象
		}
		return null;
	}

	public BusLineModel getBusLineModel(String name) {
		String findSQL = "select * from bus where name=?";
		PreparedStatement stmt = null; // 声明预处理对象
		ResultSet rs = null;
		try {
			stmt = conn.prepareStatement(findSQL); // 获得预处理对象并赋值
			stmt.setString(1, name);
			rs = stmt.executeQuery();
			BusLineModel model = new BusLineModel();
			if (rs.next()) {
				model.setName(rs.getString("name"));
				model.setRoute(rs.getString("route"));
				model.setPrice(rs.getBigDecimal("price").toPlainString());
				model.setStart(rs.getString("start_time"));
				model.setEnd(rs.getString("end_time"));
				return model;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(stmt); // 关闭处理对象
		}
		return null;
	}

	public BusSpotBean getBusSpotBean(String name) {
		String findSQL = "select name,route from bus";
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement(); // 获得预处理对象并赋值
			rs = stmt.executeQuery(findSQL);
			BusSpotBean bean = new BusSpotBean();
			List<String> line = new ArrayList<>();
			bean.setName(name);
			bean.setLine(line);
			while (rs.next()) {
				String key = rs.getString("name");
				String route = rs.getString("route");
				StringTokenizer st = new StringTokenizer(route, splitter);
				while (st.hasMoreTokens()) {
					String value = st.nextToken();
					if (name.equals(value)) {
						line.add(key);
						break;
					}
				}
			}
			return bean;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(stmt); // 关闭处理对象
		}
		return null;
	}

	public BusP2PBean getBusSpotAdjacencyBean(String begin, String end) {
		String findSQL = "select name,route,price from bus";
		Statement stmt = null;
		ResultSet rs = null;
		BusLineGraph<String, String> graph = new BusLineGraph<>();
		BusP2PBean bean = new BusP2PBean();
		bean.setBegin(begin);
		bean.setEnd(end);
		try {
			stmt = conn.createStatement(); // 获得预处理对象并赋值
			rs = stmt.executeQuery(findSQL);
			while (rs.next()) {
				String key = rs.getString("name");
				String route = rs.getString("route");
				double price = rs.getBigDecimal("price").doubleValue();
				StringTokenizer st = new StringTokenizer(route, splitter);
				String prev = null;
				while (st.hasMoreTokens()) {
					String value = st.nextToken();
					if (prev != null) {
						graph.addEdge(prev, value, key);
					}
					prev = value;
				}
				graph.addCost(key, price);
			}
			bean.setPath(graph.getShortestPath(begin, end));
			bean.setDirect(graph.getDirectPath(begin, end));
			return bean;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(rs); // 关闭结果集对象
			DBConnection.close(stmt); // 关闭处理对象
		}
		return null;
	}

	public int addBusLine(BusLineModel line) {
		CallableStatement stmt = null;
		int retv = -1;
		try {
			stmt = conn.prepareCall("{ ?=call Add_Line(?,?,?,?,?) }");
			stmt.registerOutParameter(1, Types.INTEGER);
			stmt.setString(2, line.getName());
			stmt.setString(3, line.getRoute());
			stmt.setString(4, line.getStart());
			stmt.setString(5, line.getEnd());
			stmt.setString(6, line.getPrice());
			stmt.execute();
			retv = stmt.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt); // 关闭处理对象
		}
		return retv;
	}

	public int delBusLine(String name) {
		CallableStatement stmt = null;
		int retv = -1;
		try {
			stmt = conn.prepareCall("{ ?=call Delete_Line(?) }");
			stmt.registerOutParameter(1, Types.INTEGER);
			stmt.setString(2, name);
			stmt.execute();
			retv = stmt.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt); // 关闭处理对象
		}
		return retv;
	}

	public int updateBusLine(BusLineModel line) {
		CallableStatement stmt = null;
		int retv = -1;
		try {
			stmt = conn.prepareCall("{ ?=call Update_Line(?,?,?,?,?) }");
			stmt.registerOutParameter(1, Types.INTEGER);
			stmt.setString(2, line.getName());
			stmt.setString(3, line.getRoute());
			stmt.setString(4, line.getStart());
			stmt.setString(5, line.getEnd());
			stmt.setString(6, line.getPrice());
			stmt.execute();
			retv = stmt.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(stmt); // 关闭处理对象
		}
		return retv;
	}
}
