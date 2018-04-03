package com.cn.test;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;

import org.junit.Test;

public class testFile {
	
	@Test
public void test1() throws IOException{
		String urlString = "https://images2015.cnblogs.com/blog/907280/201607/907280-20160714174539748-1121611716.png";  
		URL url = new URL(urlString);  
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();  
		if (conn.getResponseCode() == 200) {  
		  String file = conn.getURL().getFile();  
		  System.out.println(file.substring(file.lastIndexOf('/')+1));  
		}  
}
}
