package com.cn.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cn.bean.News;
import com.cn.service.NewsService;
import com.cn.utils.CodeUtil;
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
public class NewsController {
	 private static String UPLOAD_DIRECTORY ="/images/";
	 
	@Autowired
	NewsService newsService;
	@RequestMapping("/news/show")//跳转到inform这页面
	public String  InforShow(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model
			,HttpSession session){
		PageHelper.startPage(pn, 6);
		List<News> list=newsService.getAll();
		 PageInfo<News> pageInfo=new PageInfo<News>(list,6);
		 model.addAttribute("pageInfo", pageInfo);
		 /**
		  * 设置pn参数以返回本页面
		  */
		 session.setAttribute("pas", pn);
		 return "news/newslist";
	}
	
	
	@RequestMapping(value="/news/addnewsaction",method=RequestMethod.POST)
	public ModelAndView AddOne(HttpServletRequest request,@RequestParam
	CommonsMultipartFile file,HttpSession session) throws IOException{
		int state=0;
		ModelAndView mv=new ModelAndView("redirect:show");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String editor=request.getParameter("editor");
		String check=request.getParameter("check");
		//System.out.println(title+"."+content+"."+editor+"."+check+"."+file);
		
        if(check==null)
        	state=0;
        else state=1;
		//获取前台传来的图片 
		ServletContext context = session.getServletContext(); 
		String path = context.getRealPath(UPLOAD_DIRECTORY);  
		
		String image = file.getOriginalFilename();
		//System.out.println(image);//文件名字
		String imageaddress=path+'\\'+image;
		CodeUtil codeUtil=new CodeUtil();
		
		image=codeUtil.generate9()+codeUtil.generate9()+image.substring(image.lastIndexOf("."));
		newsService.insertone(title, content,editor,state,imageaddress,image);
		File uploadfile=new File(path+"\\"+image);
		//System.out.println(path+image);
		file.transferTo(uploadfile);
		return mv;
		
	}
	
	@RequestMapping("/news/news_del")
	public ModelAndView Delete(HttpServletRequest request){
		ModelAndView modelAndView=new ModelAndView("redirect:show");
		String ids=request.getParameter("id");
		int id=Integer.parseInt(ids);
		newsService.deletes(id);
		return modelAndView;
		
	}

	
	@RequestMapping("/news/news_detail")
	public String Detail(HttpServletRequest request,HttpSession session) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String Id=request.getParameter("id");
		int id=Integer.parseInt(Id);
		News news=newsService.getById(id);
		request.setAttribute("id", news.getId());
		request.setAttribute("title", news.getTitle());
		request.setAttribute("content", news.getContent());
		request.setAttribute("editdate", news.getEditdate());
		request.setAttribute("showoff", news.getShowoff());
		request.setAttribute("editor", news.getEditor());
		request.setAttribute("image", news.getImage());
		
		//从点击开始获取点击页面的pn值
		String pag=request.getParameter("pag");
		Integer.parseInt(pag);
		session.setAttribute("pa", pag);
		return "/news/detail";
	}
	
	
	@RequestMapping("/news/editstatue")
	public ModelAndView ChangeStatue(HttpServletRequest request){
		
		
		String id=request.getParameter("id");
		String pags=request.getParameter("pnga");
		int pp=Integer.parseInt(pags);
		int ids=Integer.parseInt(id);
		
		/**
		 * 获取当前时间记录changtime
		 */
		
		String time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss") .format(new Date() );
		Timestamp time1 = Timestamp.valueOf(time);//得到DateTime类型的数据
		newsService.insertTime(time1,ids);
		
		int statues=newsService.getStatueById(ids);
		int changeStatue=(statues+3)%2;
		newsService.ChangeStatueById(ids,changeStatue);
		ModelAndView modelAndView=new ModelAndView("redirect:news_detail?id="+ids+"&pag="+pp);
		return modelAndView;
	}
	
	
	@RequestMapping("/news/backpage")
	public ModelAndView GetpageById(HttpServletRequest request)
	{
		
		String idString=request.getParameter("pn");
		int pn=Integer.parseInt(idString);
		ModelAndView modelAndView=new ModelAndView("redirect:show?pn="+pn);
		return modelAndView;
	}
	
	 @ResponseBody
	 @RequestMapping("/news/many_del_news")
	 public void deleteMany(HttpServletRequest request){
		// System.out.println("进入方法");
		 String items = request.getParameter("delitems");// System.out.println(items);
		// System.out.println("走完items获取"+items);
	     String[] strs = items.split(",");  
	      for (int i = 0; i < strs.length; i++) {  
	          try {  
	              int a = Integer.parseInt(strs[i]);  
	            newsService.deletes(a);  
	          } catch (Exception e) {  
	          }  
	      }  
	 }
	
	
}
