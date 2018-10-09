package com.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class StringUtil {

	/**
	 * String转Int
	 * @param str
	 * @return
	 */
	public static int StringToInt(String str) {
		int result = 1;
		try {
			result = Integer.parseInt(str);
		} catch (NumberFormatException e) {
			result = 0;
			//e.printStackTrace();
		}
		return result;
	}
	
	/**
	* String转float
	* @param str
	* @return
	*/
	public static float strToFlo(String str) {
	float i = 0;
	try {
	i = Integer.parseInt(str);
	} catch (Exception e) {
	}
	return i;
	}
	
	
	/**
	 * 获取盐值（随机字符串）
	 * @param length
	 * @return
	 */
	public static String getRandomString(int length) { 
	    String base = "abcdefghijklmnopqrstuvwxyz0123456789";   
	    Random random = new Random();   
	   /* StringBuffer类中的方法主要偏重于对于字符串的变化，例如追加、插入和删除等，这个也是StringBuffer和String类的主要区别。*/
	    StringBuffer sb = new StringBuffer();   
	    for (int i = 0; i < length; i++) {   
	        int number = random.nextInt(base.length()); 
	  /*该方法的作用是追加内容到当前StringBuffer对象的末尾，类似于字符串的连接。调用该方法以后，StringBuffer对象的内容也发生改变*/
	        sb.append(base.charAt(number));   
	    }   
	    return sb.toString();   
	 }
	
	public static List<String> splitProperties (String properties){
		List<String> options = new ArrayList<String>();
		String option = null;
		String[] strings = properties.split(",");
		for (String string : strings) {
			if(!"0".equals(string)){
				option = string.charAt(3)+"";
				options.add(option);
				
			}
		}
		return options;
		
	}
}
