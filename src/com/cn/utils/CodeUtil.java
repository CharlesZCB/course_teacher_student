package com.cn.utils;

import java.util.Random;



public class CodeUtil{
	
	
	public synchronized static String generate9() {
        int n = (int) (Math.random() * 500000000) + 10000000;
        return n + "";
    }
	
	//生成1-10  班级序列号生成代码
	public synchronized static int getnerate1(){
		 int m = (int) (Math.random() * 2000)+1000;
	        return m ;
	}
	
	 /**
     * 获取6位 的随机位数数字
     * @param length    想要生成的长度
     * @return result
     */
	public static String getRandom6() {
        String result = "";
        Random rand = new Random();
        
        int randInt = 0;
        for (int i = 0; i < 6; i++) {
            randInt = rand.nextInt(10);
 
            result += randInt;
        }
        return result;
    }
}