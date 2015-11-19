package com.bajdcc.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class WebAppListener implements ServletContextListener {
	private static final String DBDRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; // 驱动类类名

	public void contextInitialized(ServletContextEvent event) {
		try {
			Class.forName(DBDRIVER); // 注册驱动
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public void contextDestroyed(ServletContextEvent event) {
	}
}
