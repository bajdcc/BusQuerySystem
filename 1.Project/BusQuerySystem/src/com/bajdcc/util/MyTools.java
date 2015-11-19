package com.bajdcc.util;

import java.awt.Color;
import java.io.UnsupportedEncodingException;
import java.util.Random;

public class MyTools {
	public static int strToint(String str, int defval) { // 将String型数据转换为int型数据的方法
		int i = defval;
		if (str == null || str.equals(""))
			return i;
		try {
			i = Integer.parseInt(str);
		} catch (NumberFormatException e) {
			i = 0;
			e.printStackTrace();
		}
		return i;
	}

	public static String encodeURI(String str) { // 进行转码操作的方法
		if (str == null)
			str = "";
		try {
			str = java.net.URLEncoder.encode(str, "utf-8");
		} catch (UnsupportedEncodingException e) {
			str = "";
			e.printStackTrace();
		}
		return str;
	}

	public static String decodeURI(String str) { // 进行转码操作的方法
		if (str == null)
			str = "";
		try {
			str = java.net.URLDecoder.decode(str, "utf-8");
		} catch (UnsupportedEncodingException e) {
			str = "";
			e.printStackTrace();
		}
		return str;
	}

	// 获取随机颜色
	public static Color getRandColor(int s, int e) {
		Random random = new Random();
		if (s > 255)
			s = 255;
		if (e > 255)
			e = 255;
		int r = s + random.nextInt(e - s); // 随机生成RGB颜色中的r值
		int g = s + random.nextInt(e - s); // 随机生成RGB颜色中的g值
		int b = s + random.nextInt(e - s); // 随机生成RGB颜色中的b值
		return new Color(r, g, b);
	}
}
