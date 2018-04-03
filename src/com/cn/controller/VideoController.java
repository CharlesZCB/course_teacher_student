package com.cn.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cn.bean.Video;
import com.cn.service.VideoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import it.sauronsoftware.jave.EncoderException;
import it.sauronsoftware.jave.InputFormatException;
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
public class VideoController {
	 private static String UPLOAD_DIRECTORY ="/images/";
	@Autowired
	VideoService videoService;
	@RequestMapping("/video/show")
	public String ShowAll(@RequestParam(defaultValue="1",value="pn")Integer pn,Model model){
		PageHelper.startPage(pn, 8);
		List<Video>list=videoService.getAll();
		PageInfo<Video> pageInfo=new PageInfo<Video>(list,6);
		model.addAttribute("pageInfo",pageInfo);
		return "/video/videolist";
	}
	
	@RequestMapping("/video/addsure")
	public ModelAndView AddSure(HttpServletRequest request,
			@RequestParam MultipartFile videofile,MultipartFile pic, HttpSession session) throws IOException, InputFormatException, EncoderException{
		ModelAndView modelAndView=new ModelAndView("redirect:show");
		String filename=videofile.getOriginalFilename();
		String picname=pic.getOriginalFilename();
		ServletContext context = session.getServletContext(); 
   	    String path = context.getRealPath(UPLOAD_DIRECTORY);  
		String realpath=path+"\\"+filename;
        String realpathpic=path+"\\"+picname;
		String name= request.getParameter("name");
		String introduce= request.getParameter("introduce");
		
		String personname= request.getParameter("personname");
		//视频大小
		DecimalFormat df = new DecimalFormat("#.00"); 
		long size= videofile.getSize();
		String sizefile=df.format((double) size / 1048576)+"Mb";
	    //104853069
		
		//写文件
		byte[] bytes = videofile.getBytes();
		byte[] bytepic = pic.getBytes();
		
  	     BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(  
  	     new File(path + File.separator + filename)));
  	     BufferedOutputStream streampic =new BufferedOutputStream(new FileOutputStream(  
  	  	     new File(path + File.separator + picname)));
  	    stream.write(bytes);
  	    stream.flush();
  	    stream.close();
  	    streampic.write(bytepic);
	    streampic.flush();
	    streampic.close();
  	    videoService.addOne(name,introduce,personname,realpath/*视频下载的地址*/,realpathpic,picname,filename,sizefile);
		return modelAndView;
	}
	
	
	/**
	 * 跳转秩删除页面
	 */
	@RequestMapping("/video/deletepage")
	public String DeletePage(@RequestParam(defaultValue="1",value="pn")Integer pn,Model model){
		PageHelper.startPage(pn, 7);
		List<Video>list=videoService.getAll();
		PageInfo<Video> pageInfo=new PageInfo<Video>(list,6);
		model.addAttribute("pageInfo",pageInfo);
		return "/video/deletepage";
	}
	
	@ResponseBody
	@RequestMapping("/video/delete")
	public void Delete(HttpServletRequest request){
		int ids=Integer.parseInt(request.getParameter("id"));
		videoService.deleteById(ids);
	}
	
	
}
