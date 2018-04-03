package com.cn.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.cn.bean.Course;
import com.cn.bean.Courseteacher;
import com.cn.bean.User;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.CourseteacherService;
import com.cn.service.UserService;
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
public class UsercourseController {

	@Autowired
	UsercourseService usercourseService;
	@Autowired
	UserService userService;
	@Autowired
	ClassRoomService classroomService;
	@Autowired
	CourseService courseService;
	@Autowired
    CourseteacherService courseTeacherService;
	
	
	@RequestMapping("/course/cuserlist")
	public String ListUserBycid(HttpServletRequest request){
		int cid=Integer.parseInt(request.getParameter("cid"));
		
		int banhao=classroomService.getClassCodeById(cid);
		String cname=classroomService.getClassNameById(cid);
		String jibie=classroomService.getJibieById(cid);
		request.setAttribute("banhao", banhao);
		request.setAttribute("cname", cname);
		request.setAttribute("jibie", jibie);
		
		List<User>list= userService.getListBycode(banhao);
		List<Course>list2=courseService.getAll();
		request.setAttribute("users", list);
		request.setAttribute("courses",list2);
		return"/score/recordscore";
	}
	@ResponseBody
	@RequestMapping(value="/course/table1",produces="text/html;charset=utf-8")
	public String CourseTable(HttpServletRequest request) throws UnsupportedEncodingException{
		String year1=request.getParameter("year");
		String year=URLDecoder.decode(year1, "utf-8");
		String string[]=year.split("-");
		
		int sid=Integer.parseInt(request.getParameter("id"));
		//根据学生的id查找班级的班号
		int banhao=userService.getBanhaoById(sid);
	
	    String jibie=classroomService.getJibieByBanhao(banhao);//获得班级的级别
	   
	    //获取所有的cid :根据年 学期 级别
		//根据班号 cid在courseteacher表中查找所有的课程
	    List<Integer>cid=courseService.getAllByNianXueqiJibie(string[0],string[1],jibie);//一些列和该班级有关的cid
	    
	    
	    List<List<Courseteacher>> listcourseteacher=new ArrayList<List<Courseteacher>>();
	   // System.out.println("怀疑的班号："+banhao+"  "+cid.get(0));
	    
	    for(int i=0;i<cid.size();i++){
	      listcourseteacher.add(courseTeacherService.getAllBcodeCid(cid.get(i),banhao));
	    }
	    String str=String.valueOf(listcourseteacher);
	    String str1=str.replace("[", "");
	    String str2=str1.replace("]", "");
	    
	 
	    
	    String message=null;
	 
	    if(!str2.isEmpty()){
	    	message="查找成功！";
	    	return message;
	    }
	    System.out.println("hh ");
		return message;
	}
	
	
	@RequestMapping(value="/course/table",produces="text/html;charset=utf-8")
	public String CourseTable1(HttpServletRequest request) throws UnsupportedEncodingException{
		String year1=request.getParameter("year");
		String year=URLDecoder.decode(year1, "utf-8");
		String string[]=year.split("-");
		int sid=Integer.parseInt(request.getParameter("id"));
		//根据学生的id查找班级的班号
		int banhao=userService.getBanhaoById(sid);
	    String jibie=classroomService.getJibieByBanhao(banhao);//获得班级的级别
	   //根据级别  获得所有的年度 学期
	    List<Course>listtime=courseService.getAllByJibie(jibie);
	    //获取所有的cid :根据年 学期 级别
		//根据班号 cid在courseteacher表中查找所有的课程
	    List<Integer>cid=courseService.getAllByNianXueqiJibie(string[0],string[1],jibie);//一些列和该班级有关的cid
	    List<List<Courseteacher>> listcourseteacher=new ArrayList<List<Courseteacher>>();
	    for(int i=0;i<cid.size();i++){
	      listcourseteacher.add(courseTeacherService.getAllBcodeCid(cid.get(i),banhao));
	    }
		List<Courseteacher> listrow1=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow1.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow2=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow2.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow3=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow3.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow4=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow4.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow5=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow5.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow6=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow6.add(i,new Courseteacher());
		}//listcourse:[[],[]]
		for(int i=0;i<listcourseteacher.size();i++){
			for(int t=0;t<listcourseteacher.get(i).size();t++){
				if(listcourseteacher.get(i).get(t).getJie().equals("第一节")){
					if(listcourseteacher.get(i).get(t).getWeek().equals("周一")){
						listrow1.set(0, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周二")){
						listrow1.set(1, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周三")){
						listrow1.set(2, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周四")){
						listrow1.set(3, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周五")){
						listrow1.set(4, listcourseteacher.get(i).get(t));
					}
				}
				//
				if(listcourseteacher.get(i).get(t).getJie().equals("第二节")){
					if(listcourseteacher.get(i).get(t).getWeek().equals("周一")){
						listrow2.set(0, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周二")){
						listrow2.set(1, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周三")){
						listrow2.set(2, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周四")){
						listrow2.set(3, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周五")){
						listrow2.set(4, listcourseteacher.get(i).get(t));
					}
				}
				//
				if(listcourseteacher.get(i).get(t).getJie().equals("第三节")){
					if(listcourseteacher.get(i).get(t).getWeek().equals("周一")){
						listrow3.set(0, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周二")){
						listrow3.set(1, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周三")){
						listrow3.set(2, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周四")){
						listrow3.set(3, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周五")){
						listrow3.set(4, listcourseteacher.get(i).get(t));
					}
				}
				//
				if(listcourseteacher.get(i).get(t).getJie().equals("第四节")){
					if(listcourseteacher.get(i).get(t).getWeek().equals("周一")){
						listrow4.set(0,listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周二")){
						listrow4.set(1,listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周三")){
						listrow4.set(2,listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周四")){
						listrow4.set(3,listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周五")){
						listrow4.set(4,listcourseteacher.get(i).get(t));
					}
				}
				//
				if(listcourseteacher.get(i).get(t).getJie().equals("第五节")){
					if(listcourseteacher.get(i).get(t).getWeek().equals("周一")){
						listrow5.set(0, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周二")){
						listrow5.set(1, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周三")){
						listrow5.set(2, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周四")){
						listrow5.set(3, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周五")){
						listrow5.set(4, listcourseteacher.get(i).get(t));
					}
				}
				//
				if(listcourseteacher.get(i).get(t).getJie().equals("第六节")){
					if(listcourseteacher.get(i).get(t).getWeek().equals("周一")){
						listrow6.set(0, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周二")){
						listrow6.set(1, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周三")){
						listrow6.set(2, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周四")){
						listrow6.set(3, listcourseteacher.get(i).get(t));
					}
					if(listcourseteacher.get(i).get(t).getWeek().equals("周五")){
						listrow6.set(4, listcourseteacher.get(i).get(t));
					}
				}
			}
		}
		request.setAttribute("listrow1", listrow1);
		request.setAttribute("listrow2", listrow2);
		request.setAttribute("listrow3", listrow3);
		request.setAttribute("listrow4", listrow4);
		request.setAttribute("listrow5", listrow5);
		request.setAttribute("listrow6", listrow6);
		request.setAttribute("listtime", listtime);
		request.setAttribute("year", year);
		request.setAttribute("id", sid);
		return "/student/table";
	}
	@RequestMapping("/course/tablehome")
	public String TableQuery(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		request.setAttribute("id", id);
		
		//String jibie=request.getParameter("jibie");
		//根据学生的id查找班级的班号
		int banhao=userService.getBanhaoById(id);
	    String jibie=classroomService.getJibieByBanhao(banhao);//获得班级的级别
	   //根据级别  获得所有的年度 学期
	    List<Course>listtime=courseService.getAllByJibie(jibie);
		request.setAttribute("listtime", listtime);
		
		List<Courseteacher> listrow1=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow1.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow2=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow2.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow3=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow3.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow4=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow4.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow5=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow5.add(i,new Courseteacher());
		}
		List<Courseteacher> listrow6=new ArrayList<Courseteacher>();
		for(int i=0;i<5;i++){
			listrow6.add(i,new Courseteacher());
		}
		
		request.setAttribute("listrow1", listrow1);
		request.setAttribute("listrow2", listrow2);
		request.setAttribute("listrow3", listrow3);
		request.setAttribute("listrow4", listrow4);
		request.setAttribute("listrow5", listrow5);
		request.setAttribute("listrow6", listrow6);
		request.setAttribute("listtime", listtime);
		return "/student/table";
		
	}
	
}
