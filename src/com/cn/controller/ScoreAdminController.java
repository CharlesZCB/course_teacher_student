package com.cn.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.NativeWebRequest;

import com.cn.bean.Classroom;
import com.cn.bean.Course;
import com.cn.bean.Usercourse;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.CourseteacherService;
import com.cn.service.ScoreAdminService;
import com.cn.service.UsercourseService;

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
public class ScoreAdminController {
	@Autowired
	ScoreAdminService scoreAdminService;
	@Autowired
	CourseService courseService;
	@Autowired
	CourseteacherService courseteacherService;
	@Autowired
	ClassRoomService classroomService;
	@Autowired
	UsercourseService usercourseService;

	
	
	@ResponseBody
	@RequestMapping(value="/score/shouquan",produces="text/html;charset=utf-8")
	public String Shouquan(HttpServletRequest request,HttpServletResponse response) throws ParseException, UnsupportedEncodingException{
		String message=null;
		String year=request.getParameter("year");
		String xueqi1=request.getParameter("xueqi");
		String date=request.getParameter("jiezhi");
		String xueqi=URLDecoder.decode(xueqi1,"UTF-8");
		//
		SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd HH:mm");
		Date date2 =  formatter.parse(date);
		//根据year  xueqi  到course里面找 如果有则说明 年度 学期合法  否则 就说明不存在
		List<Integer> ids=courseService.getCourseIdByYear(year, xueqi);

		if (ids.isEmpty()) {
			message="该年度课程不存在，请重新确认所开学期！";
			return message;
		}
		
		Integer sure=scoreAdminService.SureNoDouble(year, xueqi);//根据year xueqi 查找id  若能找到 则已经存在 此时不参加插入操作
		if(sure==null){
			message="发布成功！";
			scoreAdminService.insertOne(year,xueqi,date2);
			return message;
		}
		else{
			message="该学期已经发布！禁止重复发布";
			return message;
		}
	}
	
	@RequestMapping("/score/detailteach")
	public String DetailScoreRecord(HttpServletRequest request) throws UnsupportedEncodingException{
		String nian=request.getParameter("nian");
		String xueqi1=request.getParameter("xueqi");
		String flages=request.getParameter("flages");
		String xueqi=new String(xueqi1.getBytes("ISO-8859-1"),"UTF-8"); 
		//根据年度   学期查找所有课程以及相关的教师的信息
		List<Course>listcourse=courseService.getAllByYearAndXueqi(nian,xueqi);
		request.setAttribute("year", nian);
		request.setAttribute("xueqi", xueqi);
		request.setAttribute("listcourse",listcourse);
		request.setAttribute("flages", flages);
		return "/score/detailrecord";
	}
	
	
	@RequestMapping("/score/getownScore")
	public String GetOwnScore(HttpServletRequest request,HttpServletResponse response){
		int cid=Integer.parseInt(request.getParameter("cid"));
		int bid=Integer.parseInt(request.getParameter("bid"));
		int banhao=classroomService.getbanhaoByCid(bid);
		String bname=classroomService.getClassNameById(bid);
		List<Usercourse> listscore= usercourseService.getScoreByCidBid(bid, cid);
		request.setAttribute("listscore", listscore);
		request.setAttribute("bname", bname);
		request.setAttribute("banhao", banhao);
		return "/score/teachscores";
	}
}
