package com.bajdcc.servlet.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bajdcc.dao.BusDao;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/manage/mdelete.do" })
public class DeleteLine extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = request.getParameter("line");
		if (name == null || name.isEmpty()) {
			session.setAttribute("redirect", "manage/bus_add.jsp");
			session.setAttribute("info", "参数为空，不符合要求");
			response.sendRedirect("../redirect.jsp");
			return;
		}
		BusDao dao = new BusDao();
		int retv = dao.delBusLine(name);
		dao.close();
		switch (retv) {
		case 1:
			session.setAttribute("info", "线路名称不存在，请更改");
			break;
		case 2:
			session.setAttribute("info", "删除成功");
			break;
		default:
			session.setAttribute("info", "出现错误");
			break;
		}
		session.setAttribute("redirect", "manage/bus_list.jsp");
		response.sendRedirect("../redirect.jsp");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}