package com.bajdcc.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bajdcc.dao.MsgDao;
import com.bajdcc.bean.MsgBean;
import com.bajdcc.model.UserModel;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/manage/add_msg.do" })
public class AddMsgServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("redirect");
		session.setAttribute("info", "禁止访问");
		response.sendRedirect("../redirect.jsp");
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String title = request.getParameter("txtTitle");
		String contents = request.getParameter("txtContents");
		String ip = request.getRemoteAddr();
		HttpSession session = request.getSession();
		UserModel user = (UserModel) session.getAttribute("user");
		if (user == null || title == null || title.isEmpty()
				|| contents == null || contents.isEmpty()) {
			session.setAttribute("redirect", "manage/add_msg.jsp");
			session.setAttribute("info", "请检查内容是否合法！");
			response.sendRedirect("../redirect.jsp");
			return;
		}
		MsgBean msg = new MsgBean();
		msg.setId(user.getId());
		msg.setTitle(title);
		msg.setContent(contents);
		msg.setIp(ip);
		MsgDao dao = new MsgDao();
		dao.addMsg(msg);
		dao.close();
		session.setAttribute("redirect", "view_msg.jsp");
		session.setAttribute("info", "发表成功！");
		response.sendRedirect("../redirect.jsp");
	}
}