package com.bajdcc.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bajdcc.model.UserModel;

@WebFilter(urlPatterns = { "/manage/*", "/user/*" })
public class AuthFilter implements Filter {

	public void init(FilterConfig config) throws ServletException {

	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String requestPath = req.getRequestURI();
		if (session.getAttribute("authorized") == null) {
			if ((!requestPath.endsWith(".open"))) {
				session.setAttribute("redirect", req.getRequestURI());
				session.setAttribute("info", "您当前未登录，正在跳转到登录界面...");
				session.setAttribute("login-intend", new Object());
				resp.sendRedirect("../redirect.jsp");
				return;
			}
			chain.doFilter(request, response);
			return;
		}
		UserModel user = ((UserModel) session.getAttribute("user"));
		if (user.isUser()) {
			session.setAttribute("redirect", "main.jsp");
			session.setAttribute("info", "您没有权限！");
			resp.sendRedirect("../redirect.jsp");
			return;
		}
		chain.doFilter(request, response);
	}

	public void destroy() {

	}
}
