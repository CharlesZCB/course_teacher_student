package com.cn.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cn.bean.Inform;
import com.cn.service.InformService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
/**
 * 
 * @作者  张昌北
 * @创建时间 2018年3月2日
 * @版本号 1.0
 * @所在学校 大连东软信息学院
 * @指导教师 刘蕾
 *
 */
@Controller
public class InformController {
	@Autowired
	InformService informService;
	@RequestMapping("/inform/edit")//跳转到inform这页面
	public String  InforShow(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		PageHelper.startPage(pn,8);
		List<Inform> list=informService.getAll();
		PageInfo<Inform> pageInfo=new PageInfo<Inform>(list,6);
		model.addAttribute("pageInfo", pageInfo);
		return "inform/informedit";
	}
	
	@ResponseBody
	@RequestMapping("/inform/inform_del")//
	public void Delet(int id){
		informService.deletes(id);
		
	}
	
	
	
	@RequestMapping("/inform/addinform")
	public String  Addinformb(HttpServletRequest request) throws UnsupportedEncodingException{
		/*ModelAndView modelAndView=new ModelAndView("inform/informedit");*/
		request.setCharacterEncoding("UTF-8");
		String title= request.getParameter("title");
		String content=request.getParameter("content");
		String writer=request.getParameter("writer");
		informService.add(title, content,writer);
		return "redirect:edit";
		
	}
	
	 @ResponseBody
	 @RequestMapping("/inform/many_del_inf")
	 public void deleteMany(HttpServletRequest request){
		 //System.out.println("进入方法");
		 String items = request.getParameter("delitems");// System.out.println(items);
		 //System.out.println("走完items获取"+items);
	     String[] strs = items.split(",");  
	      for (int i = 0; i < strs.length; i++) {  
	          try {  
	              int a = Integer.parseInt(strs[i]);  
	              informService.deletes(a);  
	          } catch (Exception e) {  
	          }  
	      }  
	 }
	 
	 /**
	  * 批量导入infor数据
	  * @param request
	  * @return
	  * @throws InvalidFormatException
	  * @throws IOException
	  */
	 @ResponseBody
	 @RequestMapping(value="/infor/batches",produces="text/html;charset=utf-8")
	 public String Batchers(HttpServletRequest request) throws InvalidFormatException, IOException{
		// ModelAndView modelAndView=new ModelAndView("redirect:/inform/edit");
		 String filename=request.getParameter("fileinfor");
	     
		 int strat=filename.lastIndexOf("\\");
		 String filenames= filename.substring(strat+1);
	    // System.out.println(filenames);
		 
		 String file="C:/Users/Administrator/Desktop/"+filenames;
		 File filetext=new File(file);
		 String message=null;
		 if(filetext.exists()){
			 InputStream inputStream=new FileInputStream(file);
			 message="确定导入？数据大小:"+inputStream.available()/1000+"kb";
			 String suffix=filenames.substring(filenames.lastIndexOf(".")+1);
			 if(suffix.equals(String.valueOf("xls"))||suffix.equals(String.valueOf("xlsx"))){
				 inputStream.close();
				 return message;
			 }
			 else{
				 inputStream.close();
				 message="文件格式出错！指定文件xls或者xlsx";
				 return message;
			 }
			 
		 }
		 else{
			 message="找不到该文件";
			 return message;
		 }
	}
	 
	 @ResponseBody
	 @RequestMapping("/infor/actioninsert")
	 public ModelAndView SuccessInsert(HttpServletRequest request) throws InvalidFormatException, IOException{
		 ModelAndView modelAndView=new ModelAndView("redirect:/inform/edit");
		 String file=request.getParameter("file");
		 int strat=file.lastIndexOf("\\");
		 String filenames= file.substring(strat+1);
		 String file2="C:/Users/Administrator/Desktop/"+filenames;
		 InputStream inputStream=new FileInputStream(file2);
		 Workbook workbook=WorkbookFactory.create(inputStream);
         Sheet sheet=workbook.getSheetAt(0);
         Row row=null;
         for(int i=1;i<sheet.getLastRowNum();i++){
        	int index=0;
        	row=sheet.getRow(i);
        	 //获取各个属性并且插入数据库
        	String title= row.getCell(index++).toString();
     		String content=row.getCell(index++).toString();
     		String writer=row.getCell(index++).toString();
     		informService.add(title, content, writer);
         }
		 return modelAndView;
	 }
         
	
}
