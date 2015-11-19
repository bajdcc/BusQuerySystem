package com.bajdcc.util;

import java.awt.Color;
import java.io.UnsupportedEncodingException;
import java.util.Random;

public class MyTools {
	public static int strToint(String str, int defval) { // ��String������ת��Ϊint�����ݵķ���
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

	public static String encodeURI(String str) { // ����ת������ķ���
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

	public static String decodeURI(String str) { // ����ת������ķ���
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

	// ��ȡ�����ɫ
	public static Color getRandColor(int s, int e) {
		Random random = new Random();
		if (s > 255)
			s = 255;
		if (e > 255)
			e = 255;
		int r = s + random.nextInt(e - s); // �������RGB��ɫ�е�rֵ
		int g = s + random.nextInt(e - s); // �������RGB��ɫ�е�gֵ
		int b = s + random.nextInt(e - s); // �������RGB��ɫ�е�bֵ
		return new Color(r, g, b);
	}
}
