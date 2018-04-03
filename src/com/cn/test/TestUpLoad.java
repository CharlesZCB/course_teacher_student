package com.cn.test;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.junit.Test;


public class TestUpLoad {

	@Test
	public void importExcel() throws IOException, InvalidFormatException{
		
		InputStream is = new FileInputStream("C:/Users/Administrator/Desktop/admin.xlsx");
		System.out.println("待测试数据大小:"+is.available()/1000+"kb");
		Workbook workbook=WorkbookFactory.create(is);//获取文件输入流
		Sheet sheet=workbook.getSheetAt(0);//获取Excel第一个子页面
		Row row=null;
		for(int i=1;i<sheet.getLastRowNum();i++){
			int dex=0;//列数
			row=sheet.getRow(i);
			/*id*/String id=row.getCell(dex++).toString();//获取第i行第dex列
			/*姓名*/String name=row.getCell(dex++).toString();
			/*密码*/String password=row.getCell(dex++).toString();
			       System.out.println("id是："+id+",密码是："+password+",用户名是："+name);
		}
	
		
		
	}
}
