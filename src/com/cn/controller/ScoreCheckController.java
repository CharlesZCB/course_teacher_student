package com.cn.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cn.bean.Courseteacher;
import com.cn.service.ClassRoomService;
import com.cn.service.CourseService;
import com.cn.service.CourseteacherService;
import com.cn.service.TeacherService;
import com.cn.service.TipService;
import com.cn.service.UsercourseService;

@Controller
public class ScoreCheckController {
	@Autowired
	TeacherService teacherService;
	@Autowired
	UsercourseService usercourseService;
	@Autowired
	CourseService courseService;
	@Autowired
	CourseteacherService courseteacherService;
	@Autowired
	ClassRoomService classroomService;
	@Autowired
	TipService tipService;
	
	
	@RequestMapping("/score/teachlist1")//跳转的链接
	public String CheckFlag(HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("ccode"));
		String flages=request.getParameter("flages");
		request.setAttribute("id", id);
		String cname=courseService.getCoursenameById(id);
		request.setAttribute("cname",cname);
		/**
		 * 进行列表显示的操作
		 */
		//根据cid 到courseteacher中进行查找
		//List<Courseteacher> list = courseteacherService.getAllDistinctinctBycid(id);
		List<Courseteacher> list=courseteacherService.getAllDistincBycid(id);
		for(int i=0;i<list.size();i++){
			//查看是否已经录入bid cid足以
			int bcode=list.get(i).getBid();
		//	System.out.println(bcode);
			int bid=classroomService.getIdBycode(bcode);
		//	System.out.println(bid);
		
			if (usercourseService.getCnameByCidBid(id, bid)==null) {
				list.get(i).setCname("0");
			}
			else if(usercourseService.getCnameByCidBid(id, bid)!=null) {
				list.get(i).setCname("1");
			}
			
		}
		request.setAttribute("lists", list);
		request.setAttribute("flages",flages);
	    return "/score/teainf";
	}
	
	@ResponseBody
	@RequestMapping(value="/flag/tip",produces="text/html;charset=utf-8")
	public String Message(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		String message=null;
		int tid=Integer.parseInt(request.getParameter("tid"));//教师的id
		String cname=request.getParameter("cname");//
		String banming=request.getParameter("classname");//
		int banhao=Integer.parseInt(request.getParameter("bcode"));//教师的id
		//将此插入数据库
		tipService.insertMessage(tid,cname,banhao,banming,0);
		message="消息已经送达!";
		return message;
	}
	
	@ResponseBody
	@RequestMapping(value="/message/delete",produces="text/html;charset=utf-8")
	public String MessageDelete(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		int id=Integer.parseInt(request.getParameter("id"));
		tipService.deleteByid(id);
		String message="删除成功";
		return message;
		
	}

}