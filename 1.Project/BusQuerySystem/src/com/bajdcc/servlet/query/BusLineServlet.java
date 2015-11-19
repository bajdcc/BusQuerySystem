package com.bajdcc.servlet.query;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.bajdcc.dao.BusDao;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/query/qline.do" })
public class BusLineServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("line");
		String term = request.getParameter("term");
		if ((name == null || name.isEmpty()) && (term != null)) {
			BusDao dao = new BusDao();
			Object line = dao.getBusLine(term);
			dao.close();
			String json = JSONObject.valueToString(line);
			response.setCharacterEncoding("UTF-8");
			PrintWriter os = response.getWriter();
			os.print(json);
			os.flush();
			return;
		}
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name = request.getParameter("line");
		if (name == null || name.isEmpty()) {
			session.setAttribute("redirect", "query/qline.jsp");
			session.setAttribute("info", "输入为空！");
			response.sendRedirect("../redirect.jsp");
			return;
		}
		BusDao dao = new BusDao();
		Object line = dao.getBusLineBean(name);
		dao.close();
		if (line == null) {
			session.setAttribute("redirect", "query/qline.jsp");
			session.setAttribute("info", "线路不存在！");
			response.sendRedirect("../redirect.jsp");
			return;
		}
		request.setAttribute("line", line);
		request.getRequestDispatcher("qlineR.jsp").forward(request, response);
	}
}