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
@WebServlet(urlPatterns = { "/query/qspot.do" })
public class BusSpotServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("spot");
		String term = request.getParameter("term");
		if ((name == null || name.isEmpty()) && (term != null)) {
			BusDao dao = new BusDao();
			Object line = dao.getBusSpot(term);
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
		String name = request.getParameter("spot");
		if (name == null || name.isEmpty()) {
			session.setAttribute("redirect", "query/qspot.jsp");
			session.setAttribute("info", "站点不存在！");
			response.sendRedirect("../redirect.jsp");
			return;
		}
		BusDao dao = new BusDao();
		Object spot = dao.getBusSpotBean(name);
		dao.close();
		request.setAttribute("spot", spot);
		request.getRequestDispatcher("qspotR.jsp").forward(request, response);
	}
}