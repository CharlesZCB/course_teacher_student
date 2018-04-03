package com.cn.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cn.bean.Inform;
import com.cn.bean.News;
import com.cn.service.InformService;
import com.cn.service.NewsService;
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
public class HomeController {

	@Autowired
	NewsService newsService;
	@Autowired
	InformService inforService;
	@RequestMapping("/home/informore")
	public String HomeInfor(@RequestParam(value="pn",defaultValue="1")Integer pn,
		Model model,HttpServletRequest request){
		PageHelper.startPage(pn, 12);
		List<Inform> list=inforService.getAll();
		PageInfo<Inform> pageInfo=new PageInfo<Inform>(list,6);
		model.addAttribute("pageInfo", pageInfo);
		return "/preshow/show/informore";
		
	}
	
	@RequestMapping("/home/newsmore")
	public String HomeNews(@RequestParam(value="pn",defaultValue="1")Integer pn,
		Model model,HttpServletRequest request){
		PageHelper.startPage(pn, 7);
		List<News> list=newsService.getAll();
		PageInfo<News> pageInfo=new PageInfo<News>(list,6);
		model.addAttribute("pageInfo", pageInfo);
		return "/preshow/show/newsmore";
		
	}
	
	
	@RequestMapping("/home/detailinfor")
	public String DetailInfor(HttpServletRequest request){
		
		String idString=request.getParameter("id");
		int id=Integer.parseInt(idString);
		Inform inform=inforService.getInforById(id);
		request.setAttribute("infor", inform);
		return "/preshow/show/infordetail";
	}
	
}
