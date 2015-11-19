package com.bajdcc.servlet;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bajdcc.util.MyTools;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = { "/verify.open" })
public class VerifyServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 禁止缓存
		response.setHeader("Pragma", "No-cache");
		response.setHeader("Cache-Control", "No-cache");
		response.setDateHeader("Expires", 0);
		// 指定生成的响应是图片
		response.setContentType("image/jpeg");
		int width = 140; // 验证码图片的宽度
		int height = 70; // 验证码图片的高度
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics g = image.getGraphics(); // 获取Graphics类的对象
		g.setColor(Color.GRAY);
		g.fillRect(0, 0, image.getWidth(), image.getHeight());
		/********************************************************/
		Random random = new Random(); // 实例化一个Random对象
		g.setFont(new Font("宋体", Font.PLAIN, 16)); // 设置字体
		g.setColor(new Color(255, 255, 255)); // 设置雪花的颜色
		String sRand = "";
		Font mFont = new Font("宋体", Font.ITALIC, 26); // 通过Font构造字体
		g.setFont(mFont); // 设置字体
		// 画随机的线条
		for (int i = 0; i < 100; i++) {
			g.setColor(MyTools.getRandColor(180, 200));
			int x = random.nextInt(width - 1);
			int y = random.nextInt(height - 1);
			int x1 = random.nextInt(3) + 1;
			int y1 = random.nextInt(6) + 1;
			g.drawLine(x, y, x + x1, y + y1); // 绘制直线
		}

		// 画随机的线条
		// 创建一个供画笔选择线条粗细的对象
		BasicStroke bs = new BasicStroke(2f, BasicStroke.CAP_BUTT,
				BasicStroke.JOIN_BEVEL);
		Graphics2D g2d = (Graphics2D) g; // 通过Graphics类的对象创建一个Graphics2D类的对象
		g2d.setStroke(bs); // 改变线条的粗细
		g.setColor(Color.BLACK); // 设置当前颜色为预定义颜色中的灰色
		final int lineNumber = 4; // 指定端点的个数
		final int[] xPoints = new int[lineNumber]; // 定义保存x轴坐标的数组
		final int[] yPoints = new int[lineNumber]; // 定义保存x轴坐标的数组
		// 通过循环为x轴坐标和y轴坐标的数组赋值
		for (int i = 0; i < lineNumber; i++) {
			xPoints[i] = random.nextInt(width - 1);
			yPoints[i] = random.nextInt(height - 1);
		} // 绘制折线
		g.drawPolyline(xPoints, yPoints, lineNumber);

		// 输出随机的验证码文字
		g.setColor(new Color(0, 0, 0)); // 设置颜色为黑色
		int itmp = 0;
		for (int i = 0; i < 4; i++) {
			if (random.nextInt(2) == 1) {
				itmp = random.nextInt(26) + 65; // 生成A~Z的字母
			} else {
				itmp = random.nextInt(10) + 48; // 生成0~9的数字
			}
			char ctmp = (char) itmp;
			sRand += String.valueOf(ctmp);
			/**** 随机缩放文字并将文字旋转指定角度 **/
			// 将文字旋转指定角度
			Graphics2D g2d_word = (Graphics2D) g;
			AffineTransform trans = new AffineTransform();
			trans.rotate(random.nextInt(20) * 3.14 / 180, 15 * i + 8, 7);
			// 缩放文字
			float scaleSize = random.nextFloat() + 0.5f;
			if (scaleSize < 0.8 || scaleSize > 1.1f) {
				scaleSize = 1f;
			}
			trans.scale(scaleSize, scaleSize);
			g2d_word.setTransform(trans);
			/************************/
			g.drawString(String.valueOf(ctmp), width / 6 * i + 23,
					random.nextInt(height / 2) + 20);

		}
		// 将生成的验证码保存到Session中
		HttpSession session = request.getSession();
		session.setAttribute("verify_code", sRand);
		g.dispose();
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}
}