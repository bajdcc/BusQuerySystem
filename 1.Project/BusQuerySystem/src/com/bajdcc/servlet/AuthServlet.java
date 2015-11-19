package com.bajdcc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bajdcc.dao.UserDao;
import com.bajdcc.model.UserModel;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/login.open" })
public class AuthServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/auth.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String verify_ok = (String) session.getAttribute("verify_code"); // 获取action参数值
		String verify_test = request.getParameter("verify_code"); // 获取action参数值
		if (verify_ok == null || verify_test == null
				|| verify_ok.compareToIgnoreCase(verify_test) != 0) {
			request.setAttribute("message", "验证码错误。");
			request.getRequestDispatcher("/auth.jsp")
					.forward(request, response);
			return;
		}
		String user = request.getParameter("user"); // 获取action参数值
		String password = request.getParameter("password"); // 获取action参数值
		UserDao dao = new UserDao();
		UserModel model = dao.login(user, password);
		dao.close();
		if (model == null) {
			request.setAttribute("message", "帐号或密码错误。");
			request.getRequestDispatcher("/auth.jsp")
					.forward(request, response);
			return;
		}
		synchronized (session) {
			session.setAttribute("authorized", new Object());
			session.setAttribute("user", model);
		}
		session.setAttribute("info", "正在转到之前的页面，请稍候...");
		response.sendRedirect("redirect.jsp");
	}
}