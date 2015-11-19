package com.bajdcc.servlet;

import java.io.*;
import java.util.*;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class MyDealServlet
 */
@WebServlet("/mydeal.do")
public class MailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MailServlet() {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String message1 = null;
			List<MimeBodyPart> mbps = new ArrayList<MimeBodyPart>();
			Map<String, String> param = new HashMap<String, String>(); 
			if (ServletFileUpload.isMultipartContent(request)) { // 判断是否是上传文件
				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(20 * 1024); // 设置内存中允许存储的字节数
				factory.setRepository(factory.getRepository()); // 设置存放临时文件的目录
				ServletFileUpload upload = new ServletFileUpload(factory); // 创建新的上传文件句柄

				int size = 2 * 1024 * 1024; // 指定上传文件的大小
				List<?> formlists = null; // 创建保存上传文件的集合对象
				try {
					formlists = upload.parseRequest(request); // 获取上传文件集合
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				Iterator<?> iter = formlists.iterator(); // 获取上传文件迭代器
				while (iter.hasNext()) {
					FileItem formitem = (FileItem) iter.next(); // 获取每个上传文件
					if (!formitem.isFormField()) { // 忽略不是上传文件的表单域
						String name = formitem.getName(); // 获取上传文件的名称
						if (formitem.getSize() > size) { // 如果上传文件大于规定的上传文件的大小
							message1 = "您上传的文件太大，请选择不超过20M的文件";
							break; // 退出程序
						}
						String adjunctsize = new Long(formitem.getSize())
								.toString(); // 获取上传文件的大小
						if ((name == null) || (name.equals(""))
								&& (adjunctsize.equals("0"))) // 如果上传文件为空
							continue; // 退出程序
						String adjunctname = name.substring(
								name.lastIndexOf("\\") + 1, name.length());
						String fileDir = "upload";
						String address = fileDir + "\\" + adjunctname; // 创建上传文件的保存地址
						File saveFile = new File(address); // 根据文件保存地址，创建文件
						try {
							formitem.write(saveFile); // 向文件写数据
						} catch (Exception e) {
							e.printStackTrace();
						}
						MimeBodyPart mbp = new MimeBodyPart();
						FileDataSource fds = new FileDataSource(address); // 得到数据源
						mbp.setDataHandler(new DataHandler(fds)); // 得到附件本身并至入BodyPart
						mbp.setFileName(fds.getName()); // 得到文件名同样至入BodyPart
						mbps.add(mbp);
					}else{
						param.put(formitem.getFieldName(), formitem.getString("gb2312"));
					}
				}
			}

			if (message1 != null) {
				request.setAttribute("result", message1); // 将提示信息保存在request对象中
				RequestDispatcher requestDispatcher = request
						.getRequestDispatcher("index.jsp"); // 设置相应返回地址
				requestDispatcher.forward(request, response);
			}

			request.setCharacterEncoding("gb2312");
			String from = param.get("from").toString();
			String to = param.get("to").toString();
			String subject = param.get("subject").toString();
			String messageText = param.get("content").toString();
			String password = param.get("password").toString();
			// 生成SMTP的主机名称
			// int n =from.indexOf('@');
			// int m=from.length() ;
			// String mailserver ="smtp."+from.substring(n+1,m);
			String mailserver = "mail.njnu.edu.cn";
			// 建立邮件会话
			Properties pro = new Properties();
			pro.put("mail.smtp.host", mailserver);
			pro.put("mail.smtp.auth", "true");
			Session sess = Session.getInstance(pro);
			sess.setDebug(true);
			// 新建一个消息对象
			MimeMessage message = new MimeMessage(sess);
			// 设置发件人
			InternetAddress from_mail = new InternetAddress(from);
			message.setFrom(from_mail);
			// 设置收件人
			InternetAddress to_mail = new InternetAddress(to);
			message.setRecipient(Message.RecipientType.TO, to_mail);
			// 设置主题
			message.setSubject(subject);
			// 设置内容
			if (mbps.isEmpty()) {
				message.setText(messageText);
			}
			// 设置发送时间
			message.setSentDate(new Date());
			// 附件
			if (!mbps.isEmpty()) {
				Multipart mp = new MimeMultipart();
				MimeBodyPart mbp = new MimeBodyPart();
				mbp.setContent(messageText, "text/html;charset=gb2312");
				mp.addBodyPart(mbp);
				for (MimeBodyPart m : mbps) {
					mp.addBodyPart(m);
				}
				message.setContent(mp);
			}
			// 发送邮件
			message.saveChanges(); // 保证报头域同会话内容保持一致
			Transport transport = sess.getTransport("smtp");
			transport.connect(mailserver, from, password);
			transport.sendMessage(message, message.getAllRecipients());
			transport.close();
			out.println("<script language='javascript'>alert('Success!');window.location.href='index.jsp';</script>");
		} catch (Exception e) {
			System.out.println("发送邮件产生的错误：" + e.getMessage());
			out.println("<script language='javascript'>alert('Failed!');window.location.href='index.jsp';</script>");
		}
	}

}
