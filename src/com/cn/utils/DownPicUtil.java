/*package com.cn.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
public class DownPicUtil {
	@Test
	public void download(HttpServletResponse response,String path,String fileName) throws IOException{
		path="C:/Users/Administrator/Desktop/inform.xlsx";
		fileName="inform.xlsx";
		//1.获取文件的绝对地址
		//2.获取下载的文件名字
		//3.设置content-disposition响应头控制浏览器以下载的形式打开文件
		response.setHeader("content-disposition", "attachment;"
				+ "filename="+URLEncoder.encode(fileName, "UTF-8"));
		
		//4.获取要下载的文件输入流InputSream
		InputStream inputStream=new FileInputStream(path);
		int len=0;
		//5.创建缓冲区Buffer
		byte[] buffer=new byte[1024];
		//6.通过Response 对象获取OutputStream流
		OutputStream outputStream=response.getOutputStream();
		//7.将FileInputStream 写入缓冲区
		while((len=inputStream.read(buffer))>0){
			outputStream.write(buffer, 0, len);	//8.使用OutPutStream将缓冲区的数据输出到客户端的浏览器
		}
		inputStream.close();
		outputStream.close();
		

	
  }
}
*/