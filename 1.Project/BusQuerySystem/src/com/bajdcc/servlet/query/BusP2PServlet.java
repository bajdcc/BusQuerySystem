package com.bajdcc.servlet.query;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bajdcc.dao.BusDao;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/query/qp2p.do" })
public class BusP2PServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String spot1 = request.getParameter("spot1");
		String spot2 = request.getParameter("spot2");
		if (spot1 == null || spot1.isEmpty() || spot2 == null
				|| spot2.isEmpty()) {
			session.setAttribute("redirect", "query/qspot.jsp");
			session.setAttribute("info", "站点不存在！");
			response.sendRedirect("../redirect.jsp");
			return;
		}
		BusDao dao = new BusDao();
		Object path = dao.getBusSpotAdjacencyBean(spot1, spot2);
		dao.close();
		request.setAttribute("p2p", path);
		request.getRequestDispatcher("qp2pR.jsp").forward(request, response);
	}
}