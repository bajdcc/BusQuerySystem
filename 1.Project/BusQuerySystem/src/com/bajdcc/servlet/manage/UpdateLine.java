package com.bajdcc.servlet.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bajdcc.dao.BusDao;
import com.bajdcc.model.BusLineModel;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/manage/mupdate.do" })
public class UpdateLine extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = request.getParameter("line");
		if (name == null || name.isEmpty()) {
			session.setAttribute("redirect", "manage/bus_list.jsp");
			session.setAttribute("info", "表中某项为空，不符合要求");
			response.sendRedirect("../redirect.jsp");
			return;
		}
		BusDao dao = new BusDao();
		Object line = dao.getBusLineModel(name);
		dao.close();
		request.setAttribute("line", line);
		request.getRequestDispatcher("bus_edit.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = request.getParameter("name");
		String route = request.getParameter("route");
		String start_time = request.getParameter("start_time");
		String end_time = request.getParameter("end_time");
		String price = request.getParameter("price");
		if (name == null || name.isEmpty() || route == null || route.isEmpty()
				|| start_time == null || start_time.isEmpty()
				|| end_time == null || end_time.isEmpty() || price == null
				|| price.isEmpty()) {
			session.setAttribute("redirect", "manage/bus_list.jsp");
			session.setAttribute("info", "表中某项为空，不符合要求");
			response.sendRedirect("../redirect.jsp");
			return;
		}
		BusLineModel line = new BusLineModel();
		line.setName(name);
		line.setRoute(route);
		line.setStart(start_time);
		line.setEnd(end_time);
		line.setPrice(price);
		BusDao dao = new BusDao();
		int retv = dao.updateBusLine(line);
		dao.close();
		switch (retv) {
		case 1:
			session.setAttribute("redirect", "manage/mupdate.do?line=" + name);
			session.setAttribute("info", "线路名称不存在，请更改");
			break;
		case 2:
			session.setAttribute("redirect", "manage/bus_list.jsp");
			session.setAttribute("info", "修改成功");
			break;
		default:
			session.setAttribute("redirect", "manage/mupdate.do?line=" + name);
			session.setAttribute("info", "出现错误");
			break;
		}
		response.sendRedirect("../redirect.jsp");
	}
}